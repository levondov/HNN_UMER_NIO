function addearthfield()
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
[Bx,By] = getearthfield;
% grab spos at dipole locations
Dx = getspos('dipole');
tmp = getspos('Y section');

% vertical b field data
ByS = [Dx;tmp(2)]; % add in PD-Rec;
% horizontal field data
BxS = ByS;
%%%%%%%%%%%


%%%%%%%%%%% add in earth field multipoles in dipoles
idxs = getfamily('dipole',THERING);
tmp = getfamily('Y section',THERING);
idxs = [idxs, tmp(2)]; % add in PD-Rec

for i = 1:length(idxs)
    % real elem index since we are splitting elemnts and adding elements, idx location shifts
    j = idxs(i)+(i-1)*2; 
    
    % first set dipole current to that loaded by buildring/thering
    newAngle = current2dipoleangle(get_setpoint(THERING{j}.Name),THERING{j}.Name,0);
    THERING{j}.BendingAngle = newAngle; %THERING{j}.Entrance = newAngle/2; THERING{j}.ExitAngle = newAngle/2; % set dipole bend angle based on loaded settings file current.
    
    % split the element and grab e field index location in the middle
    efidx = splitelem(j);
    
    % measure the iterpolated field at that location
    ringspos = findspos(THERING,1:length(THERING)+1); % grab all ring s position
    efspos = ringspos(efidx); % grab e field s pos
    efBvaly = interp1(ByS,By,efspos);
    efBvalx = interp1(BxS,Bx,efspos); 
    
    % field in G x l_eff in cm assume 32cm effective length from 1 dipole to next
    efBvaly_eff = efBvaly*1e-3*32; 
    efBvalx_eff = efBvalx*1e-3*32;
    
    % finally, add in X/Y earth field kicks in middle of dipoles
    THERING{efidx}.KickAngle = [efBvaly_eff/Bridg, efBvaly_eff/Bridg];
end

%%%%%%%%%%

%%%%%%%%%% Also set vertical corrector strengths?? 
idxvcm = getfamily('VCM',THERING);
idxsvcm = getfamily('SVCM',THERING);
idx = [idxvcm,idxsvcm];

for i = 1:length(idx)
    newAngle = current2rsvangle(THERING{idx(i)}.Name,get_setpoint(THERING{idx(i)}.Name));
    THERING{idx(i)}.KickAngle = [0, newAngle];
end


end
