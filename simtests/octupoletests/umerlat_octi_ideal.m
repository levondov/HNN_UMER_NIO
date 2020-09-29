function umerlat_octi_ideal(qparams)
% This constructs a single particle simulation of the UMER ring
% everything is stored in the global variable 'THERING'
%
% Notes
%

if nargin < 1
    qparams = [0.7492,1.4750,1.7870,1.8731,0.9541,0.8671,1.8251,1.8870,1.7982,0.9901,1.8265,1.8276,1.7675,1.8972];
    %qparams = [1.9207,1.9207,1.9207,1.9207,1.9207,1.9207,1.9207,1.9207,1.9207,1.9207,1.9207,1.9207,1.9207,1.9207];    
end
qparams = [qparams(1),qparams(2),qparams(3),qparams(4),qparams(5),0,0,...
    qparams(6),qparams(7),qparams(8),qparams(9),qparams(10),qparams(11),qparams(12),qparams(13),qparams(14)];

% fit params
%umerinit_simple;
ao = getao;
global splitquads
% settings
adddipoles_flag = 0; % add in dipoles
addearthfield_flag = 0; % add 0 length correctors in drifts to mimic earth field 
splitquads_flag = splitquads; % split quads in half
nli_flag = 1;

% Currents
% the last values are for Y section, i.e. YQ PD QR1
pmatch = [qparams(14),qparams(13),qparams(14),qparams(13)];
QFc = [repmat([qparams(13)],1,4), qparams(2:2:12), repmat([qparams(13)],1,23), pmatch(2),pmatch(4), qparams(15)];
QDc = [repmat([qparams(14)],1,4), qparams(1:2:12), repmat([qparams(14)],1,23), pmatch(1),pmatch(3), qparams(16)];
%Oc = [1.6321,1.6149,2,1.8035,1.9854,1.6067,1.6072].*Occ;
%Oc = [0.3099,0.2668,0.2359,0.2170,0.2103,0.2158,0.2333].*1;
Oc = ao.O.SetPoints;

Dc = [csvread('dvals_nl_ochan.csv'); 14.3]*1.0;

% at lattice variables
global FAMLIST THERING
FAMLIST = cell(0);
ELIST = [];
QSPLIT = marker('Qsplit','QuadCenter','IdentityPass'); % for splitting quads
mark_idx1 = 1; % for corrector count
mark_idx2 = 1; % for bpm count

%% START LATTICE BUILDING
for i = 1:36 % 36 cells (last one is Y section)
    
    % QD
    QD_l_eff = ao.QD.FitParams(i,3)*ao.QD.FitParams(i,4);
    KQD = -1*c2k(QDc(i),ao.QD.FitParams(i,1)*ao.QD.FitParams(i,2));
    QD = quadrupole(ao.QD.CommonNames{i},ao.QD.FamilyName,QD_l_eff,KQD,'QuadLinearPass');
    QDhalf = quadrupole(ao.QD.CommonNames{i},ao.QD.FamilyName,QD_l_eff/2,KQD,'QuadLinearPass');
    % QF
    if nli_flag && i == 7
        QF_l_eff = ao.QF.FitParams(i+1,3)*ao.QF.FitParams(i+1,4);
        KQF = c2k(QFc(i+1),ao.QF.FitParams(i+1,1)*ao.QF.FitParams(i+1,2));
        QF = quadrupole(ao.QF.CommonNames{i+1},ao.QF.FamilyName,QF_l_eff,KQF,'QuadLinearPass');
        QFhalf = quadrupole(ao.QF.CommonNames{i+1},ao.QF.FamilyName,QF_l_eff/2,KQF,'QuadLinearPass');        
    else
        QF_l_eff = ao.QF.FitParams(i,3)*ao.QF.FitParams(i,4);
        KQF = c2k(QFc(i),ao.QF.FitParams(i,1)*ao.QF.FitParams(i,2));
        QF = quadrupole(ao.QF.CommonNames{i},ao.QF.FamilyName,QF_l_eff,KQF,'QuadLinearPass');
        QFhalf = quadrupole(ao.QF.CommonNames{i},ao.QF.FamilyName,QF_l_eff/2,KQF,'QuadLinearPass');
    end
    % BEND
    B_l_eff = ao.BEND.FitParams(i,3)*ao.BEND.FitParams(i,4);
    ANG = c2a(Dc(i),B_l_eff,ao.BEND.FitParams(i,1)*ao.BEND.FitParams(i,2));
    BND = rbend(ao.BEND.CommonNames{i},ao.BEND.FamilyName,B_l_eff,ANG,ANG/2,-1*ANG/2,0,'BndMPoleSymplectic4Pass'); % 10 degree nominal bends
    if ~adddipoles_flag
        BND = drift(ao.BEND.CommonNames{i},'Drift',B_l_eff,'DriftPass');
    end
    if nli_flag && i == 7
        B_l_eff2 = ao.BEND.FitParams(i+1,3)*ao.BEND.FitParams(i+1,4);
        ANG = c2a(Dc(i+1),B_l_eff2,ao.BEND.FitParams(i+1,1)*ao.BEND.FitParams(i+1,2));
        BND2 = rbend(ao.BEND.CommonNames{i+1},ao.BEND.FamilyName,B_l_eff2,ANG,ANG/2,-1*ANG/2,0,'BndMPoleSymplectic4Pass'); % 10 degree nominal bends
        if ~adddipoles_flag
            BND2 = drift(ao.BEND.CommonNames{i+1},'Drift',B_l_eff2,'DriftPass');
        end        
    end
    % Octupoles
    if nli_flag && i == 7
        O_l_eff = ao.O.FitParams(1,3)*ao.O.FitParams(1,4);
        SO = c2k(Oc(1),ao.O.FitParams(1,1)*ao.O.FitParams(1,2));
        O1 = octupole(ao.O.CommonNames{1},ao.O.FamilyName,O_l_eff,SO,'StrMPoleSymplectic4Pass');
        O_l_eff = ao.O.FitParams(2,3)*ao.O.FitParams(2,4);
        SO = c2k(Oc(2),ao.O.FitParams(2,1)*ao.O.FitParams(2,2));
        O2 = octupole(ao.O.CommonNames{2},ao.O.FamilyName,O_l_eff,SO,'StrMPoleSymplectic4Pass');
        O_l_eff = ao.O.FitParams(3,3)*ao.O.FitParams(3,4);
        SO = c2k(Oc(3),ao.O.FitParams(3,1)*ao.O.FitParams(3,2));
        O3 = octupole(ao.O.CommonNames{3},ao.O.FamilyName,O_l_eff,SO,'StrMPoleSymplectic4Pass');
        O_l_eff = ao.O.FitParams(4,3)*ao.O.FitParams(4,4);
        SO = c2k(Oc(4),ao.O.FitParams(4,1)*ao.O.FitParams(4,2));
        O4 = octupole(ao.O.CommonNames{4},ao.O.FamilyName,O_l_eff,SO,'StrMPoleSymplectic4Pass');
        O_l_eff = ao.O.FitParams(5,3)*ao.O.FitParams(5,4);
        SO = c2k(Oc(5),ao.O.FitParams(5,1)*ao.O.FitParams(5,2));
        O5 = octupole(ao.O.CommonNames{5},ao.O.FamilyName,O_l_eff,SO,'StrMPoleSymplectic4Pass');
        O_l_eff = ao.O.FitParams(6,3)*ao.O.FitParams(6,4);
        SO = c2k(Oc(6),ao.O.FitParams(6,1)*ao.O.FitParams(6,2));
        O6 = octupole(ao.O.CommonNames{6},ao.O.FamilyName,O_l_eff,SO,'StrMPoleSymplectic4Pass');
        O_l_eff = ao.O.FitParams(7,3)*ao.O.FitParams(7,4);
        SO = c2k(Oc(7),ao.O.FitParams(7,1)*ao.O.FitParams(7,2));
        O7 = octupole(ao.O.CommonNames{7},ao.O.FamilyName,O_l_eff,SO,'StrMPoleSymplectic4Pass');        
    end
    
    % DRIFTS
    DC_fodo_D = drift('D1','Drift',.08-QD_l_eff/2,'DriftPass');
    DC_fodo_F = drift('D1','Drift',.08-QF_l_eff/2,'DriftPass');
    DC_fodo_D_dipo = drift('D1','Drift',.08-QD_l_eff/2-B_l_eff/2,'DriftPass');
    if nli_flag && i == 7
        DC_fodo_F_dipo = drift('D1','Drift',.08-QF_l_eff/2-B_l_eff2/2,'DriftPass');
        DC_O_1 = drift('DO1','Drift',.16-O_l_eff*7/2 - B_l_eff/2,'DriftPass');
        DC_O_2 = drift('D02','Drift',.16-O_l_eff*7/2 - B_l_eff2/2,'DriftPass');
    else
        DC_fodo_F_dipo = drift('D1','Drift',.08-QF_l_eff/2-B_l_eff/2,'DriftPass');        
    end
    
    % BPM or VCM depending on cell in ring
    if mod(i,2) == 1
        MARK = corrector(ao.VCM.CommonNames{mark_idx1},ao.VCM.FamilyName,0.0,[0,0],'CorrectorPass');
        mark_idx1 = mark_idx1 + 1;        
    else
        MARK = marker(ao.BPM.CommonNames{mark_idx2},ao.BPM.FamilyName,'IdentityPass');
        mark_idx2 = mark_idx2 + 1;
    end
    
    % build cell
    if nli_flag && i==7
        % build octupole channel
        CEL = [MARK, DC_fodo_D QD DC_fodo_D_dipo BND DC_O_1 O1 O2 O3 O4 O5 O6 O7 DC_O_2 BND2 DC_fodo_F_dipo QF DC_fodo_F];
        if splitquads_flag
            CEL = [MARK, DC_fodo_D QDhalf QSPLIT QDhalf DC_fodo_D_dipo BND ...
                DC_O_1 O1 O2 O3 O4 O5 O6 O7 DC_O_2 BND2 DC_fodo_F_dipo QFhalf QSPLIT QFhalf DC_fodo_F];            
        end
    else
        % no octupole channel
        CEL = [MARK, DC_fodo_D QD DC_fodo_D_dipo BND DC_fodo_F_dipo QF DC_fodo_F];        
        if splitquads_flag
            CEL = [MARK, DC_fodo_D QDhalf QSPLIT QDhalf DC_fodo_D_dipo BND DC_fodo_F_dipo QFhalf QSPLIT QFhalf DC_fodo_F];
        end
    end
    
    if nli_flag && i==8 % skip cell 8 because of octupole channel
        ELIST = ELIST;
    else
        ELIST = [ELIST, CEL];
    end
    
end

buildlat(ELIST);
THERING = setcellstruct(THERING, 'Energy', 1:length(THERING), 10000);


%% add things to lattice after creation

if addearthfield_flag
    addearthfield_interp;
end

% add quad errors
if 0
    fidx = getfamily('QF',THERING);
    didx = getfamily('QD',THERING);
    
    for i=1:length(fidx)
        dx = rand()*1e-3;
        dy = rand()*1e-3;
        dsrot = rand()*.0175*3;
        addshift(fidx(i),dx,dy);
        addsrot(fidx(i), dsrot);
    end
    for i=1:length(didx)
        dx = rand()*1e-3;
        dy = rand()*1e-3;
        dsrot = rand()*.0175*3;
        addshift(didx(i),dx,dy);
        addsrot(fidx(i), dsrot);
    end
end

% add in the misalignments in YQ
if 0 
    %fprintf(['** Adding YQ misalignment **\n']);
    [~,yq_idx] = getname('YQ',THERING);
    dx = 0.01389; dy=0;
    ds = -0.00123413;
    dtheta_y = 2.5*pi/180; %param(14); %0.174533*0.1;
    %addsshift(yq_idx, ds);
    addshift(yq_idx,dx,dy);
    addsrot(yq_idx, dtheta_y)
end
% add in the misalignments in QR1
if 0
    %fprintf(['** Adding YQ misalignment **\n']);
    [~,qr1_idx] = getname('QR1',THERING);
    
    dtheta_y = -0.01745*5; %-0.174533*0.25;
    addsrot(qr1_idx, dtheta_y)
end
% add in PD misalignment
if 0
    [~,pd_idx] = getname('PD-Rec',THERING);
    
    dx = 0.01389; dy=0;
    addshift(pd_idx,dx,dy);
end

% add in the misalignments in YQ

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

evalin('caller','global THERING FAMLIST GLOBVAL');
