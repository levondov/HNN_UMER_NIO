function umerlat
% This constructs a single particle simulation of the UMER ring
% everything is stored in the global variable 'THERING'
%
% written by Levon
% updated May 2017
% updated April 2019
%
% Notes
%

% fit params
%umerinit;
ao = getao;

% settings
adddipoles_flag = 1; % add in dipoles
addearthfield_flag = 0; % add 0 length correctors in drifts to mimic earth field 
addhh_flag = 0; % add helmholtz coils
addquadrolls = 0;
addquadoffsets = 0;
addbendrolls = 0;
addbendoffsets = 0;
addvcmrolls = 0;
addsextcomp = 0;
global splitquads
splitquads_flag = splitquads;%splitquads; % split quads in half for better resolution

% Currents
% the last values are for Y section, i.e. YQ PD QR1
QFc = ao.QF.SetPoints; 
QDc = ao.QD.SetPoints;
Dc = ao.BEND.SetPoints;
VCMc = zeros(length(ao.VCM.SetPoints),1); %ao.VCM.SetPoints.*1;

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
    QF_l_eff = ao.QF.FitParams(i,3)*ao.QF.FitParams(i,4);
    KQF = c2k(QFc(i),ao.QF.FitParams(i,1)*ao.QF.FitParams(i,2));
    QF = quadrupole(ao.QF.CommonNames{i},ao.QF.FamilyName,QF_l_eff,KQF,'StrMPoleSymplectic4Pass');
    QFhalf = quadrupole(ao.QF.CommonNames{i},ao.QF.FamilyName,QF_l_eff/2,KQF,'StrMPoleSymplectic4Pass');
    % BEND
    B_l_eff = ao.BEND.FitParams(i,3)*ao.BEND.FitParams(i,4);
    ANG = c2a(Dc(i),B_l_eff,ao.BEND.FitParams(i,1)*ao.BEND.FitParams(i,2));
    BND = rbend(ao.BEND.CommonNames{i},ao.BEND.FamilyName,B_l_eff,ANG,ANG/2,ANG/2,0,'BndMPoleSymplectic4Pass'); % 10 degree nominal bends
    %BND = rbend(ao.BEND.CommonNames{i},ao.BEND.FamilyName,B_l_eff,10*pi/180,ANG/2,ANG/2,0,'BndMPoleSymplectic4Pass'); % 10 degree nominal bends    
    %FAMLIST{BND}.ElemData.PolynomB(1) = -1*(10*pi/180 - ANG)*ridg;
    if ~adddipoles_flag
        BND = drift('B1','Drift',B_l_eff,'DriftPass');
    end
    % DRIFTS
    DC_fodo_D = drift('D1','Drift',.08-QD_l_eff/2,'DriftPass');
    DC_fodo_F = drift('D1','Drift',.08-QF_l_eff/2,'DriftPass');
    DC_fodo_D_dipo = drift('D1','Drift',.08-QD_l_eff/2-B_l_eff/2,'DriftPass');
    DC_fodo_F_dipo = drift('D1','Drift',.08-QF_l_eff/2-B_l_eff/2,'DriftPass');
    
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
    CEL = [MARK, DC_fodo_D QD DC_fodo_D_dipo BND DC_fodo_F_dipo QF DC_fodo_F];
    if splitquads_flag
        CEL = [MARK, DC_fodo_D QDhalf QSPLIT QDhalf DC_fodo_D_dipo BND DC_fodo_F_dipo QFhalf QSPLIT QFhalf DC_fodo_F];
    end
    
    ELIST = [ELIST, CEL];
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

end





