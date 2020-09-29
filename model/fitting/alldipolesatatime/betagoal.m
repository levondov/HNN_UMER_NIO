function [goal] = betagoal(params,Q1exp,idxFit,idxRing,FD)
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
%
global THERING
ao=getao;

% update ao with new fit params
ao.BEND.FitParams(:,1) = params;

% set param and grab new thering
setao(ao);
global splitquads
splitquads=1;
umerlat_oct;
splitquads=0;

% grab new exp beta values
[betaexp] = calc_expbeta(Q1exp,idxFit,FD,0.1);

% grab beta at specific location
[td,tune] = twissring(THERING,0,idxRing);
goal = 0;
for i = 1:length(idxRing)
    b1=td(i).beta(1); b2=td(i).beta(2);
    goal = goal + abs(b1-betaexp(i,1))^2;
end
goal = sqrt(goal);


end

