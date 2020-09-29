function umerlat_octi(qparams)
% This constructs a single particle simulation of the UMER ring
% everything is stored in the global variable 'THERING'
%
% Notes
%

if nargin < 1
    %qparams = [0.9803,1.6977,1.9715,1.8744,1.3374,1.0129,2.2288,1.807,2.4992,1.3027,1.8948,1.9207,5.529,5.081];
    qparams = [1.5194,0.9121,1.9770,1.7043,1.3411,0.8926,2.2771,2.0577,2.4885,1.3501,1.9088,1.8889,5.6951,5.4363];
end
qparams = [qparams(1),qparams(2),qparams(3),qparams(4),qparams(5),0,0,...
    qparams(6),qparams(7),qparams(8),qparams(9),qparams(10),qparams(11),qparams(12),qparams(13),qparams(14)];

% fit params
%umerinit;
ao = getao;
global splitquads
% settings
adddipoles_flag = 1; % add in dipoles
addearthfield_flag = 0; % add 0 length correctors in drifts to mimic earth field
addhh_flag = 1; % add helmholtz coils
addquadrolls = 0;
addquadoffsets = 0;
addbendrolls = 0;
addbendoffsets = 0;
addvcmrolls = 0;
splitquads_flag = splitquads; % split quads in half
nli_flag = 1;

% Currents
% the last values are for Y section, i.e. YQ PD QR1
pmatch = [1.5454,1.806,2.0824,2.3861]; % last 4 quads used to match beam (QR68,69,70,71)
%pmatch = [qparams(14),qparams(13),qparams(14),qparams(13)];
QFc = [repmat([qparams(13)],1,4), qparams(2:2:12), repmat([qparams(13)],1,23), pmatch(2),pmatch(4), qparams(15)];
QDc = [repmat([qparams(14)],1,4), qparams(1:2:12), repmat([qparams(14)],1,23), pmatch(1),pmatch(3), qparams(16)];
%Oc = [1.6321,1.6149,2,1.8035,1.9854,1.6067,1.6072].*0.0;
global Occ
Oc = [1,1,1,1,1,1,1].*Occ;
Dc = [csvread('dvals_nl_ochan.csv'); 14.3]*1.0;
VCMc = csvread('vcm.csv').*0;

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
        VCM_l_eff = ao.VCM.FitParams(mark_idx1,3)*ao.VCM.FitParams(mark_idx1,4);
        ANG = c2a(VCMc(mark_idx1),VCM_l_eff,ao.VCM.FitParams(mark_idx1,1)*ao.VCM.FitParams(mark_idx1,2));
        if addvcmrolls
            MARK = corrector(ao.VCM.CommonNames{mark_idx1},ao.VCM.FamilyName,0.0,[ao.VCM.Rolls(mark_idx1)*ANG,ANG],'CorrectorPass');
        else
            MARK = corrector(ao.VCM.CommonNames{mark_idx1},ao.VCM.FamilyName,0.0,[0.0,ANG],'CorrectorPass');
        end
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
    addearthfield_interp(addhh_flag);
end

% add magnet rolls and misalignments
if 0
    fidx = getfamily('QF',THERING);
    if splitquads_flag
        j=1;i=1;
        while i <= length(fidx)
            if addquadoffsets
                addshift(fidx(i),ao.QF.MisAlign(j,1),ao.QF.MisAlign(j,2));
                addshift(fidx(i+1),ao.QF.MisAlign(j,1),ao.QF.MisAlign(j,2));
            end
            if addquadrolls
                addsrot(fidx(i), ao.QF.Rolls(j));
                addsrot(fidx(i+1), ao.QF.Rolls(j));
            end
            i=i+2;
            j=j+1;
        end
    else
        for i=1:length(fidx)
            if addquadoffsets
                addshift(fidx(i),ao.QF.MisAlign(i,1),ao.QF.MisAlign(i,2));
            end
            if addquadrolls
                addsrot(fidx(i), ao.QF.Rolls(i));
            end
        end
    end
    fidx = getfamily('QD',THERING);
    if splitquads_flag
        j=1;i=1;
        while i <= length(fidx)
            if addquadoffsets
                addshift(fidx(i),ao.QD.MisAlign(j,1),ao.QD.MisAlign(j,2));
                addshift(fidx(i+1),ao.QD.MisAlign(j,1),ao.QD.MisAlign(j,2));
            end
            if addquadrolls
                addsrot(fidx(i), ao.QD.Rolls(j));
                addsrot(fidx(i+1), ao.QD.Rolls(j));
            end
            i=i+2;
            j=j+1;
        end
    else
        for i=1:length(fidx)
            if addquadoffsets
                addshift(fidx(i),ao.QD.MisAlign(i,1),ao.QD.MisAlign(i,2));
            end
            if addquadrolls
                addsrot(fidx(i), ao.QD.Rolls(i));
            end
        end
    end
    fidx = getfamily('BEND',THERING);
    for i=1:length(fidx)
        if addbendoffsets
            addshift(fidx(i),ao.BEND.MisAlign(i,1),ao.BEND.MisAlign(i,2));
        end
        if addbendrolls
            addsrot(fidx(i), ao.BEND.Rolls(i));
        end
    end
end

% add in the misalignments in YQ

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

evalin('caller','global THERING FAMLIST GLOBVAL');
