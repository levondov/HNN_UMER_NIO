function [ridg] = ridg()
%GETRHO Summary of this function goes here
%   Detailed explanation goes here

e         = 1.60217733E-19; %C
m         = 9.1093897E-31; %kg
Energy    = 10000;%9967.08077; % eV
c         = 2.997924E8; % m/s

gamma     = 1+((Energy)/(510998.9461));
beta      = sqrt((gamma*gamma)-1)/gamma;
bg           = beta*gamma;
ridg         = bg*c*(m/e);


end

