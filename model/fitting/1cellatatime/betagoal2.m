function [goal] = betagoal2(params,betaexp,idxFit,idxRing)
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
ao.QD.FitParams(idxFit,[1,3]) = params(1:2);
ao.QF.FitParams(idxFit,[1,3]) = params(3:4);
%ao.QD.MisAlign(idxFit,:) = params(5:6);
%ao.QF.MisAlign(idxFit,:) = params(7:8);


% set param and grab new thering
setao(ao);
global splitquads
splitquads=1;
umerlat;
splitquads=0;

% grab beta at specific location
[td,tune] = twissring(THERING,0,idxRing);
b1x=td(1).beta(1); b1y=td(1).beta(2);
b2x=td(2).beta(1); b2y=td(2).beta(2);

% rms sum of beta x and y
goal = sqrt((b1x-betaexp(1,1))^2 + (b1y-betaexp(1,2))^2 + (b2x-betaexp(2,1))^2 + (b2y-betaexp(2,2))^2);



end