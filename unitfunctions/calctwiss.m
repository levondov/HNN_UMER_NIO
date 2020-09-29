function  [beta,gamma,phase,M] = calctwiss(X0,X1)
% Testing matrix calculation
%
% INPUT:
%   X0 = x0,x0',x1,x1' - initial conditions for 2 particles
%   X1 = - same as X0, but final conditions of particles
%

m11 = (X0(2)*X1(3) - X1(1)*X0(4)) / (X0(2)*X0(3) - X0(1)*X0(4));
m12 = (X0(1)*X1(3) - X1(1)*X0(3)) / (X0(1)*X0(4) - X0(2)*X0(3));
m21 = (X0(2)*X1(4) - X1(2)*X0(4)) / (X0(2)*X0(3) - X0(1)*X0(4));
m22 = (X0(3)*X1(2) - X1(4)*X0(1)) / (X0(2)*X0(3) - X0(1)*X0(4));

M = [m11,m12;m21,m22];

phase = acos(0.5*(m11+m22));
beta = m12/sin(phase);
gamma = -m21/sin(phase);

