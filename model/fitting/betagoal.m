function [b1,b2] = betagoal(params,betaexp,idxFit,idxRing,FD)
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
if strcmpi(FD,'QF')
    ao.QF.FitParams(idxFit,[1,3]) = params;
elseif strcmpi(FD,'QD')
    ao.QD.FitParams(idxFit,[1,3]) = params;
end

% set param and grab new thering
setao(ao);
global splitquads
splitquads=1;
umerlat;
splitquads=0;

% grab beta at specific location
[td,tune] = twissring(THERING,0,idxRing);
b1=td.beta(1); b2=td.beta(2);
% rms sum of beta x and y
goal = sqrt((td.beta(1)-betaexp(1))^2 + (td.beta(2)-betaexp(2))^2);
%goal = sqrt((td.beta(1)-betaexp(1))^2);

end