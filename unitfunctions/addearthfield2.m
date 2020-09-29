function addearthfield2()
% Adds earth's field effects to dipoles
%
% INPUT:
%

global THERING
%%%%%%%%%% Basic Calcs
e         = 1.60217733E-19; %C
m         = 9.1093897E-31; %kg
Energy    = 9967.08077; % eV
c         = 2.997924E8; % m/s

gamma     = 1+((Energy)/(511000));
beta      = sqrt((gamma*gamma)-1)/gamma;
bg           = beta*gamma;
Bridg         = bg*c*(m/e)*1e6; % in G-cm
%%%%%%%%%%


%%%%%%%%%% load earth field data
%[Bx,By] = getearthfield;
% grab spos at dipole locations

%%%%%%%%%%%

global param
global YSECTION
param2 = ones(48,1);
%%%%%%%%%%% add in earth field multipoles in dipoles
idxs = getfamily('dipole',THERING);
ext_dipo = 0;
if YSECTION
    tmp = getfamily('Y section',THERING);
    newCurrent = dipoleangle2current2(param2(end)*6*pi/180,THERING{tmp(2)}.Name);
    efieldCurrent = dipoleangle2current2(param2(end)*6*pi/180,THERING{tmp(2)}.Name,0) - newCurrent;
    newAngle = current2dipoleangle2(newCurrent,THERING{tmp(2)}.Name,0);
    THERING{tmp(2)}.BendingAngle = newAngle;
    THERING{tmp(2)}.EntranceAngle = newAngle/2; 
    THERING{tmp(2)}.ExitAngle = -1*newAngle/2;
    %THERING{tmp(2)}.PolynomB = [current2multipole(efieldCurrent), 0, 0, 0];
    ext_dipo = 1;
end

for i = 1:length(idxs)-ext_dipo
    j = idxs(i);
    % first set dipole current to that loaded by buildring/thering
    newCurrent = dipoleangle2current2(param2(10+i)*10*pi/180,THERING{j}.Name);
    efieldCurrent = dipoleangle2current2(param2(10+i)*10*pi/180,THERING{j}.Name,0) - newCurrent;
    newAngle = current2dipoleangle2(newCurrent,THERING{j}.Name,0);
    THERING{j}.BendingAngle = newAngle;
    THERING{j}.EntranceAngle = newAngle/2; 
    THERING{j}.ExitAngle = -1*newAngle/2; % set dipole bend angle based on loaded settings file current.
    %THERING{j}.PolynomB = [current2multipole(efieldCurrent), 0, 0, 0];
end

%%%%%%%%%%

%%%%%%%%%% Also set interpolat
%idx = getfamily('VCM',THERING);

%for i = 1:length(idx)
%    newAngle = current2rsvangle(THERING{idx(i)}.Name,get_setpoint(THERING{idx(i)}.Name));
%    THERING{idx(i)}.KickAngle = [0, newAngle];
%end


end
