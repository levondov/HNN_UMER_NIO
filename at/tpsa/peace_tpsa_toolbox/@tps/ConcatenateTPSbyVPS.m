function r = ConcatenateTPSbyVPS(t,vps,mode)
%function r = ConcatenateOfTPS(tps,vps,mode)
% 1) mode = 0 (NumberOfVariablesOfTPS equals DimensionOfVPS)
%     Variables x_i  of TPS t is replaced by VPS vps(i).
% 2) mode != 0 (NumberOfVariablesOfTPS > DimensionOfVPS)
%     VPS vps(i) replaces the variable x_i of TPS and the other variables of TPS keep the same.
%-------------------------------------------------------------------------------
% Author:
%  Chang, Ho-Ping (also written as Ho-Ping Chang or Peace Chang)
%  National Synchrotron Radiation Research Center
%  101 Hsin-Ann Road, Hsinchu Science-Based Industrial Park
%  Hsinchu 30077, Taiwan
%  E-mail: peace@nsrrc.org.tw
% Created Date: 08-May-2003
% Updated Date:
%  23-May-2003
%  03-Jun-2003
%  12-Jun-2003
%  08-Jul-2003
% Source Files:
%  @TPS/ConcatenateTPSbyVPS.m
% Terminology and Category:
%  Truncated Power Series Algebra (TPSA)
%  One-Step Index Pointer (OSIP)
%  Truncated Power Series (TPS)
% Description:
%  In MATLAB, the index of array works FORTRAN-like.
%  Overloading Arithmetic Operators for TPS.
%  r = ConcatenateOfTPS(tps,vps)
%------------------------------------------------------------------------------
global OSIP
vlen = length(vps);
if vlen > t.n
   disp('length(vps) is large than the OSIP.NumberOfVariables of TPS')
end
if mode == 0
   if vlen ~= OSIP.NumberOfVariables
      disp('length(vps) is not equal to the OSIP.NumberOfVariables of TPS')
   end
end

Y = VariablesOfTPS(TPS,1:OSIP.NumberOfVariables);
vo = zeros(1,vlen);
for i=1:vlen
    Y(i) = vps(i);
    vo(i) = vps(i).o;
end
order = t.o*max(vo);
order = min(order,OSIP.MaximumOrder);
c = zeros(1,OSIP_NumberOfMonomials(OSIP.NumberOfVariables,order));
r = TPS(order,c);

k = find(t.c); % Calculate the nonzero terms of TPS t only.
lk = length(k);

for m=1:lk
    pv = OSIP.MonomialPowerVector(k(m),:);
    Z = Y(1)^pv(1);
    for i=2:OSIP.NumberOfVariables
         Z = Z*Y(i)^pv(i);
     end
     r = r+Z*t.c(k(m));
end
clear i m k lk order pv vlen Y Z