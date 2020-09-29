function umerlat_oct()
% This constructs a single particle simulation of the UMER ring
% everything is stored in the global variable 'THERING'
%
% Notes
%

% fit params
%umerinit_nl;
ao = getao;

global splitquads
% settings
adddipoles_flag = 1; % add in dipoles
addearthfield_flag = 0; % add 0 length correctors in drifts to mimic earth field
addhh_flag = 0; % add helmholtz coils
addhh_bend_flag=0;
addquadrolls = 0;
addquadoffsets = 0;
addbendrolls = 0;
addbendoffsets = 0;
addvcmrolls = 0;
addsextcomp = 0;
global splitquads
splitquads_flag = 0;%splitquads; % split quads in half
nli_flag = 1;


% Currents
% the last values are for Y section, i.e. YQ PD QR1
QFc = ao.QF.SetPoints; 
QDc = ao.QD.SetPoints;
Dc = ao.BEND.SetPoints;
VCMc = ao.VCM.SetPoints;
Oc = 1.0*ao.O.SetPoints;
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
    QD = quadrupole(ao.QD.CommonNames{i},ao.QD.FamilyName,QD_l_eff,KQD,'StrMPoleSymplectic4Pass');
    QDhalf = quadrupole(ao.QD.CommonNames{i},ao.QD.FamilyName,QD_l_eff/2,KQD,'StrMPoleSymplectic4Pass');
    % QF
    if nli_flag && i == 7
        QF_l_eff = ao.QF.FitParams(i+1,3)*ao.QF.FitParams(i+1,4);
        KQF = c2k(QFc(i+1),ao.QF.FitParams(i+1,1)*ao.QF.FitParams(i+1,2));
        QF = quadrupole(ao.QF.CommonNames{i+1},ao.QF.FamilyName,QF_l_eff,KQF,'StrMPoleSymplectic4Pass');
        QFhalf = quadrupole(ao.QF.CommonNames{i+1},ao.QF.FamilyName,QF_l_eff/2,KQF,'StrMPoleSymplectic4Pass');        
    else
        QF_l_eff = ao.QF.FitParams(i,3)*ao.QF.FitParams(i,4);
        KQF = c2k(QFc(i),ao.QF.FitParams(i,1)*ao.QF.FitParams(i,2));
        QF = quadrupole(ao.QF.CommonNames{i},ao.QF.FamilyName,QF_l_eff,KQF,'StrMPoleSymplectic4Pass');
        QFhalf = quadrupole(ao.QF.CommonNames{i},ao.QF.FamilyName,QF_l_eff/2,KQF,'StrMPoleSymplectic4Pass');
    end
    % BEND
    B_l_eff = ao.BEND.FitParams(i,3)*ao.BEND.FitParams(i,4);
    ANG = c2a(Dc(i),B_l_eff,ao.BEND.FitParams(i,1)*ao.BEND.FitParams(i,2));
    BND = rbend(ao.BEND.CommonNames{i},ao.BEND.FamilyName,B_l_eff,ANG,ANG/2,ANG/2,0,'BndMPoleSymplectic4Pass'); % 10 degree nominal bends
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
        MARK2 = marker(ao.BPM.CommonNames{mark_idx2},ao.BPM.FamilyName,'IdentityPass');
        CEL = [MARK, DC_fodo_D QD DC_fodo_D_dipo BND DC_O_1 O1 O2 O3 MARK2 O4 O5 O6 O7 DC_O_2 BND2 DC_fodo_F_dipo QF DC_fodo_F];
        if splitquads_flag
            CEL = [MARK, DC_fodo_D QDhalf QSPLIT QDhalf DC_fodo_D_dipo BND ...
                DC_O_1 O1 O2 O3 MARK O4 O5 O6 O7 DC_O_2 BND2 DC_fodo_F_dipo QFhalf QSPLIT QFhalf DC_fodo_F];            
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
if 1
    fidx = getfamily('QF',THERING);
    if splitquads_flag
        j=1;i=1;
        while i <= length(fidx)
            if addsextcomp
                aa = THERING{fidx(i)}.PolynomB;
                aa(3) = ao.QF.SextupoleC(j);
                THERING{fidx(i)}.PolynomB = aa;
                THERING{fidx(i+1)}.PolynomB = aa;
            end
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
            if addsextcomp
                aa = THERING{fidx(i)}.PolynomB;
                aa(3) = ao.QF.SextupoleC(i);
                THERING{fidx(i)}.PolynomB = aa;
            end            
            if addquadoffsets
                addshift(fidx(i),ao.QF.MisAlign(i,1),ao.QF.MisAlign(i,2));
            end
            if addquadrolls
                addsrot(fidx(i), ao.QF.Rolls(i));
            end
        end
    end
    didx = getfamily('QD',THERING);
    if splitquads_flag
        j=1;i=1;
        while i <= length(didx)
            if addsextcomp
                aa = THERING{didx(i)}.PolynomB;
                aa(3) = ao.QD.SextupoleC(j);
                THERING{didx(i)}.PolynomB = aa;
                THERING{didx(i+1)}.PolynomB = aa;
            end            
            if addquadoffsets
                addshift(didx(i),ao.QD.MisAlign(j,1),ao.QD.MisAlign(j,2));
                addshift(didx(i+1),ao.QD.MisAlign(j,1),ao.QD.MisAlign(j,2));
            end
            if addquadrolls
                addsrot(didx(i), ao.QD.Rolls(j));
                addsrot(didx(i+1), ao.QD.Rolls(j));
            end
            i=i+2;
            j=j+1;
        end
    else
        for i=1:length(didx)
            if addsextcomp
                aa = THERING{didx(i)}.PolynomB;
                aa(3) = ao.QD.SextupoleC(i);
                THERING{didx(i)}.PolynomB = aa;
            end             
            if addquadoffsets
                addshift(didx(i),ao.QD.MisAlign(i,1),ao.QD.MisAlign(i,2));
            end
            if addquadrolls
                addsrot(didx(i), ao.QD.Rolls(i));
            end
        end
    end
    fidx = getfamily('BEND',THERING);
    for i=1:length(fidx)
        if addsextcomp
            aa = THERING{fidx(i)}.PolynomB;
            aa(3) = ao.BEND.SextupoleC(i);
            THERING{fidx(i)}.PolynomB = aa;
        end         
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
