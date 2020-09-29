function r = BCH99(x,y)
% function r = BCH99(p,q)
% Use the SingleLieTaylor approach to the Baker-Campbell-Hausdorff Theorem of p and q.
%-------------------------------------------------------------------------------------
% Author: Chang, Ho-Ping (also known as Peace Chang)
%  National Synchrotron Radiation Research Center
%  101 Hsin-Ann Road, Hsinchu Science-Based Industrial Park
%  Hsinchu 30077, Taiwan
%  E-mail: peace@nsrrc.org.tw
%-------------------------------------------------------------------------------------
% Created Date: 22-Jul-2002
% Last Updated Date: 07-Jul-2004
% Source Files: /TPSA/@TPS/BCH99.m
%-------------------------------------------------------------------------------------
% Terminology and Category:
%  Truncated Power Series Algebra (TPSA)
%  One-Step Index Pointer (OSIP)
%  Truncated Power Series (TPS)
%-------------------------------------------------------------------------------------
% Description:
%  In MATLAB, the index of array works FORTRAN-like.
%  Overloading Arithmetic Operators for TPS.
%  Baker-Campbell-Hausdorff Theorem
%  log(exp(x)exp(y)) =
%  x+y-[x,y]/2+[x,[x,y]]/12+[[x,y],y]/12-[x,[[x,y],y]]/24
%  .....
%  BCH99(p,q) =>  exp(:p:)exp(:q:) = exp(:r:)
%  r = p+q+[p,q]/2+[p,[p,q]]/12+[q,[q,p]]/12+...
%------------------------------------------------------------------------------
global OSIP

p = TPS2VPSbyLieTransformation(x);
q = TPS2VPSbyLieTransformation(y);
lenq = length(q);
for i=1:lenq
    t(i) = ConcatenateTPSbyVPS(q(i),p,1);
end
r = VPS2SingleLieTPS(t);
clear p q t