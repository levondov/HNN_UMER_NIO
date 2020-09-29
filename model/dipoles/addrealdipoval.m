function addrealdipoval()
% add in dipole values from machine


vals = csvread('dvals_rcds.csv');

global THERING
idx = getfamily('dipole',THERING);

for i = 1:length(idx)
    newAngle = current2dipoleangle2(vals(i),'D2',0);
    THERING{idx(i)}.BendingAngle = newAngle;
    THERING{idx(i)}.EntranceAngle = newAngle/2; 
    THERING{idx(i)}.ExitAngle = -1*newAngle/2; 
end

end