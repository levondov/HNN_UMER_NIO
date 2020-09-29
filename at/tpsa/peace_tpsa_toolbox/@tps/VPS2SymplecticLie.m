function sl = VPS2SymplecticLie(vps)
% function sl = VPS2SymplecticLie(vps)
%-------------------------------------------------------------------------------
% Author:
%  Chang, Ho-Ping (also written as Ho-Ping Chang or Peace Chang)
%  National Synchrotron Radiation Research Center
%  101 Hsin-Ann Road, Hsinchu Science-Based Industrial Park
%  Hsinchu 30077, Taiwan
%  E-mail: peace@nsrrc.org.tw
% Created Date: 22-May-2003
% Updated Date:
%  30-May-2003
%  03-Jun-2003
% Source Files:
%  @TPS/VPS2SymplecticLie.m
% Terminology and Category:
%  Truncated Power Series Algebra (TPSA)
%  One-Step Index Pointer (OSIP)
%  Truncated Power Series (TPS)
% Description:
%  In MATLAB, the index of array works FORTRAN-like.
%  Overloading Arithmetic Operators for TPS.
%  sl = M exp(:f:) N
%  tps = h+f where tps.o >= 2
%  h = HomogeneousTPS(tps,2);
%  Basic case: M = N = JacobianMartix of exp(:h:/2) u
%------------------------------------------------------------------------------
global OSIP
h1 = HomogeneousTPS(tps,2);
h2 = h1*0.5;
vps = SingleLieTaylorMapVPS(h2);
%sl.M = JacobianMatrixOfVPS(vps);
sl.M = LinearSquareMatrixOfVPS(vps);
sl.N = sl.M;
sl.f = tps-h1;

clear h1 h2 vps