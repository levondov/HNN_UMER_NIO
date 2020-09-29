function umerlat_simple2
% This constructs a single particle simulation of the UMER ring
% everything is stored in the global variable 'THERING'
%
% written by Levon
% updated May 2017
% updated April 2019
%
% Notes
d1 = 0.08;
q1 = 0.0452/ridg;
ql=0.04;

% at lattice variables
global FAMLIST THERING
FAMLIST = cell(0);
ELIST = [];
%% START LATTICE BUILDING
for i = 1:36 % 36 cells (last one is Y section)
    
    % QD
    QD = quadrupole('Q1','QD',ql,-q1,'StrMPoleSymplectic4Pass');
    % QF
    QF = quadrupole('Q2','QF',ql,q1,'StrMPoleSymplectic4Pass');
    % DRIFTS
    D1 = drift('D1','Drift',d1,'DriftPass');
    
    % build cell
    CEL = [D1 QD D1 D1 QF D1];
    
    ELIST = [ELIST, CEL];
end

buildlat(ELIST);
THERING = setcellstruct(THERING, 'Energy', 1:length(THERING), 10000);

% add in the misalignments in YQ

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

evalin('caller','global THERING FAMLIST GLOBVAL');

end





