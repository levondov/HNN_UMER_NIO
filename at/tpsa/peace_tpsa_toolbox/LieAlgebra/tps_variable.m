function x = tps_variable(n)
% function x = tps_variable(n)
% Return the variable of TPS x_n.
%-------------------------------------------------------------------------------
% Author: Chang, Ho-Ping (also known as Peace Chang)
%  National Synchrotron Radiation Research Center
%  101 Hsin-Ann Road, Hsinchu Science-Based Industrial Park
%  Hsinchu 30077, Taiwan
%  E-mail: peace@nsrrc.org.tw
%-------------------------------------------------------------------------------
% Created Date: 02-Dec-2002
% Updated Date: 01-Jul-2004
% Source Files: TPSA/LieAlgebra/tps_variable.m
%-------------------------------------------------------------------------------
% Terminology and Category:
%  Truncated Power Series Algebra (TPSA)
%  One-Step Index Pointer (OSIP)
%  Truncated Power Series (TPS)
%  Lie Algebra (LA)
%-------------------------------------------------------------------------------
% Description:
%  In MATLAB, the index of array works FORTRAN-like.
%  Overloading Arithmetic Operators for TPS.
%  tps_variable(n) == x(n), i.e. x_n
%------------------------------------------------------------------------------
global OSIP
if n > OSIP.NumberOfVariables
   error('Argument n > OSIP.NumberOfVariables.')
else
   x = TPS(1,[0 OSIP.UnitVectors(n,:)]);
end