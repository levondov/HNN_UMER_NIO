function addoctsection()
%
% Add in quad values for octupole section

global param_oct
global THERING
magnets = {'QR10','QR11','QR12','QR13','QR14','QR17','QR18','QR19','QR20','QR21'};

% turn off two quads
[~,idx1] = getname('QR15',THERING);
[~,idx2] = getname('QR16',THERING);
THERING{idx1}.K = 0; THERING{idx1}.PolynomB = [0 0 0 0];
THERING{idx2}.K = 0; THERING{idx1}.PolynomB = [0 0 0 0];

% set the rest of the quads
pol = [-1, 1,-1,1,-1,1,-1,1,-1, 1];
for i = 1:length(magnets)
    [~,idx] = getname(magnets{i},THERING);
    
    knew = current2quadstrength(magnets{i},param_oct(i))*pol(i);
    THERING{idx}.K = knew; THERING{idx}.PolynomB = [0 knew 0 0];

end

% add some 0 length markers in the region for diagnostics
splitdrift(idx1-1,0.5);
splitdrift(idx1+3,0.5);
splitdrift(idx1+7,0.5);
splitdrift(idx1+11,0.5);

