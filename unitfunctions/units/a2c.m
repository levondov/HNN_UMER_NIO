function [current] = a2c(angle,l_eff,peak_field)
% Converts from a quad current setting to a quad strength value.
%
% Input:
%   angle - angle in radians
%
% Output:
%   current - current in amps
%

% Notes
% first term in multipole expansion:
% By*Current/Brig = 5.216*2.9694/338.859 = .0457

N = length(angle);
current = zeros(N,1);

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
    current(i) = (angle(i)*Bridg) / (l_eff(i)*peak_field(i));
end

end