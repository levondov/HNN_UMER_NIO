function [Cxs,Cys,Css] = StepFuncShift(Cxm,Cym,Csm,Cxp,Cyp,Csp)
% [Cxs,Cys,Css] = StepFuncShift(Cxm,Cym,Csm,Cxp,Cyp,Csp)
% For NSRRC/TLS ID modelling purpose, it checks the vector potential besides the interface.
%-------------------------------------------------------------------------------
% Author: Chang, Ho-Ping (also known as Peace Chang)
%  National Synchrotron Radiation Research Center
%  101 Hsin-Ann Road, Hsinchu Science-Based Industrial Park
%  Hsinchu 30077, Taiwan
%  E-mail: peace@nsrrc.org.tw
%-------------------------------------------------------------------------------
% Created Date: 02-Sep-2003
% Updated Date: 09-Jul-2004
%-------------------------------------------------------------------------------
% Terminology and Category:
%  Truncated Power Series Algebra (TPSA)
%  One-Step Index Pointer (OSIP)
%  Truncated Power Series (TPS)
%------------------------------------------------------------------------------
t = HomogeneousTPS(Cxm,0); [n,o,Cxm0] = GetTPS(t);
t = HomogeneousTPS(Cym,0); [n,o,Cym0] = GetTPS(t);
t = HomogeneousTPS(Csm,0); [n,o,Csm0] = GetTPS(t);
t = HomogeneousTPS(Cxp,0); [n,o,Cxp0] = GetTPS(t);
t = HomogeneousTPS(Cyp,0); [n,o,Cyp0] = GetTPS(t);
t = HomogeneousTPS(Csp,0); [n,o,Csp0] = GetTPS(t);
Cxs = Cxm0-Cxp0;
Cys = Cym0-Cyp0;
Css = Csm0-Csp0;

clear t Cxm0 Cym0 Csm0 Cxp0 Cyp0 Csp0