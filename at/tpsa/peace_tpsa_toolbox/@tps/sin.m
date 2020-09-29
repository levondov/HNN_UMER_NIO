function r = sin(t)
% function r = sin(tps)
%-------------------------------------------------------------------------------
% Author:
%  Chang, Ho-Ping (also written as Ho-Ping Chang or Peace Chang)
%  National Synchrotron Radiation Research Center
%  101 Hsin-Ann Road, Hsinchu Science-Based Industrial Park
%  Hsinchu 30077, Taiwan
%  E-mail: peace@nsrrc.org.tw
% Created Date: 06-May-2003
% Updated Date:
%  13-May-2003
%  03-Jun-2003
%  15-Jul-2003
% Source Files:
%  @TPS/sin.m
% Terminology and Category:
%  Truncated Power Series Algebra (TPSA)
%  One-Step Index Pointer (OSIP)
%  Truncated Power Series (TPS)
% Description:
%  In MATLAB, the index of array works FORTRAN-like.
%  Overloading Arithmetic Operators for TPS.
%  r = sin(t) = cosTPS(t-t.c(1))*sin(t.c(1))+sinTPS(t-t.c(1))*cos(t.c(1))
%------------------------------------------------------------------------------
global OSIP
[index,order,k] = NonZeroMinOrderTPS(t);
lenk = length(k);
if (index == 0) & (lenk == 0) % TPS t = 0
   r = TPS;
else
    %elseif index == 1 % constant term is not zero
   f = t.c(1);
   s = sin(f);
   c = cos(f);
   r = cosTPS(t)*sin(f)+sinTPS(t)*cos(f);
   clear f s c
end
clear index order k lenk