function [goal,dq_sim,dq_exp] = runopt_goal(params)
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

dq_exp = [
   -0.0223   -0.0084
   -0.0124   -0.0085
    0.0113    0.0001
    0.0283    0.0106
    0.0214    0.0081
    0.0315    0.0075
    0.0063   -0.0020
   -0.0081   -0.0040
   -0.0066   -0.0031
    0.0202    0.0049
    0.0093    0.0018
   -0.0038   -0.0025
   -0.0134   -0.0060
    0.0114    0.0008
    0.0281    0.0076
    0.0095    0.0028
   -0.0088   -0.0025
   -0.0162   -0.0084
    0.0136    0.0024
    0.0308    0.0085
    0.0227    0.0031
   -0.0100   -0.0040
   -0.0221   -0.0102
    0.0134    0.0017
    0.0347    0.0090
    0.0245    0.0051
   -0.0131   -0.0031
   -0.0230   -0.0081
    0.0177    0.0009
    0.0350    0.0081
    0.0223    0.0075
   -0.0122   -0.0006
   -0.0215   -0.0080
    0.0151   -0.0001
    0.0268    0.0047];

% set param and grab new thering
global THERING
[td,tune0] = twissring(THERING,0,1:length(THERING)+1,'chrom');
bidx = getfamily('BEND',THERING);
for i = 1:35
    THERING{bidx(i)}.PolynomB = [params(1),params(2),0,0];  
end

dq_sim = zeros(35,2);
perturb_c = 0.1;
for i = 1:35
    %fprintf([num2str(i),'/',num2str(35),'\n']);
    ao.BEND.SetPoints(i) = ao.BEND.SetPoints(i) - perturb_c;
    setao(ao);
    umerlat_oct;
    [td,tune] = twissring(THERING,0,1:length(THERING)+1,'chrom');
    dq_sim(i,:) = tune - tune0;
    ao.BEND.SetPoints(i) = ao.BEND.SetPoints(i) + perturb_c;
    setao(ao);    
end

goal = rms(rms(dq_sim-dq_exp))*100;

end