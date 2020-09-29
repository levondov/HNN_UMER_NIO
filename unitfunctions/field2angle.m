function [angleR,angleD] = field2angle(field,l_eff)
% Calculate kick angle in radians for a given field
%
% field - magnetic field in units of Gauss (G)
% l_eff - effective length of kick in meters (m)

e         = 1.60217733E-19; %C
m         = 9.1093897E-31; %kg
Energy    = 9967.08077; % eV 
c         = 2.997924E8; % m/s

gamma     = 1+((Energy)/(511000));
beta      = sqrt((gamma*gamma)-1)/gamma;
bg           = beta*gamma;
Bridg         = bg*c*(m/e); % in G-cm

angleR = l_eff*field/Bridg;
angleD = angleR*180/pi;


end