function ionsinit

% at lattice variables
global FAMLIST THERING
FAMLIST = cell(0);
ELIST = [];

QF = quadrupole('Quad1','QF',0.15,100,'StrMPoleSymplectic4Pass');
QD = quadrupole('Quad1','QF',0.15,-100,'StrMPoleSymplectic4Pass');

BND = rbend('dipo1','BND',0.15,pi/2,0,0,0,'BndMPoleSymplectic4Pass');
D1 = drift('drift1','DRFT',0.01,'DriftPass');
    
ELIST = [QF D1 QD D1 BND D1 QF D1 QD D1];

RING = [ELIST,ELIST,ELIST,ELIST];

buildlat(RING);
THERING = setcellstruct(THERING, 'Energy', 1:length(THERING), 10000);


% add in the misalignments in YQ

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

evalin('caller','global THERING FAMLIST GLOBVAL');

end





