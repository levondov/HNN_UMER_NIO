function [angleR,angleD] = c2a(current,l_eff,peak_field)
% Converts from a quad current setting to a quad strength value.
%
% Input:
%   current - the current in A
%
% Output:
%   angleR - dipole bend angle in radians
%   angleD - dipole bend angle in degrees
%

% Notes
% first term in multipole expansion:
% By*Current/Brig = 5.216*2.9694/338.859 = .0457

N = length(current);
angleR = zeros(N,1);
angleD = angleR;
%% calculate

e         = 1.60217733E-19; %C
m         = 9.1093897E-31; %kg
Energy    = 10000;%9967.08077; % eV
c         = 2.997924E8; % m/s

gamma     = 1+((Energy)/(511000));
beta      = sqrt((gamma*gamma)-1)/gamma;
bg           = beta*gamma;
Bridg         = bg*c*(m/e);

for i = 1:N
    angleR(i) = (l_eff(i)*peak_field(i)*current(i))/Bridg; % bend
    angleD(i) = angleR(i)*180/pi;
end

end