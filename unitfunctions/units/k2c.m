function current = k2c(k,peak_grad)
% Converts from a quad current setting to a quad strength value.
%
% INPUTS:
%
% - k - current in amps
% - peak_grad - peak gradient T/m

% OUTPUTS
%  1. current - quad strength in 1/m^2
%

N = length(k);
current = zeros(N,1);

e         = 1.60217733E-19; %C
m         = 9.1093897E-31; %kg
Energy    = 10000;%9967.08077; % eV
c         = 2.997924E8; % m/s

gamma     = 1+((Energy)/(510998.9461));
beta      = sqrt((gamma*gamma)-1)/gamma;
bg           = beta*gamma;
ridg         = bg*c*(m/e);

for i=1:N    
    current(i) = k(i)*ridg/peak_grad(i);
end

end