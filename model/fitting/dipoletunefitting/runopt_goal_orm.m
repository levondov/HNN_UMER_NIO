function [goal] = runopt_goal_orm(params)
% fit goal for beta function at a specfic quad location
%
% INPUT:
%
% params - fit parameters
% betaexp - values fitting to
% idxFit - idx in ao.magnet.FitParams
% idxRing - idx in THERING
% FD - 'QF' or 'QD' for correct magnet
%
% OUTPUT:
%   goal - sqrt((beta_model - beta_exp)^2)
%
%

% set param and grab new thering
global THERING R
[td,tune0] = twissring(THERING,0,1:length(THERING)+1,'chrom');
bidx = getfamily('BEND',THERING);
for i = 1:35
    THERING{bidx(i)}.PolynomB = [params(i),0,0,0];  
end
C=findrespm(THERING,getfamily('BPM',THERING),getfamily('BEND',THERING),0.006620508321407,'PolynomB',1,1);
RR=R(1,1).Data-C{1}([1,2,3,5,6,7,8,9,11,12,13,14,15,17],1:35).*1e3;

goal = sum(sum(RR.^2));

end