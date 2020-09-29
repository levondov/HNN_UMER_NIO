function [beta] = calc_expbeta(Q1,idxFit,QForQD,dcs)
%CALC_EXPBETA Summary of this function goes here
%   Detailed explanation goes here

if nargin < 4
    dcs = 0.1; % same for all quads
end

% bare tune
%Q0 = [7.15,7.17];
Q0 = [7.12,7.1505];
% fit params
ao = getao;
[N,M] = size(Q1);
beta = zeros(N,M);

for i = 1:N
    if strcmpi(QForQD{i},'QD')
        dk = c2k(dcs,ao.QD.FitParams(idxFit(i),1)*ao.QD.FitParams(idxFit(i),2));
        l_eff = ao.QD.FitParams(idxFit(i),3)*ao.QD.FitParams(idxFit(i),4);
        beta(i,1) = (4 * pi * abs(Q1(i,1)-Q0(1))) / (dk * l_eff);
        beta(i,2) = (4 * pi * abs(Q1(i,2)-Q0(2))) / (dk * l_eff);        
    elseif strcmpi(QForQD{i},'QF')
        dk = c2k(dcs,ao.QF.FitParams(idxFit(i),1)*ao.QF.FitParams(idxFit(i),2));
        l_eff = ao.QF.FitParams(idxFit(i),3)*ao.QF.FitParams(idxFit(i),4);
        beta(i,1) = (4 * pi * abs(Q1(i,1)-Q0(1))) / (dk * l_eff);         
        beta(i,2) = (4 * pi * abs(Q1(i,2)-Q0(2))) / (dk * l_eff);
    end    
end



end

