global tune
% param are [PS, EL] for ring D quads, F quads, dipoles, YQ, QR1, PD (total 12 param)
%params = [0.71564,1.16,0.73401,1.1525,0.91285,0.944,0.66725,1.4069,0.66526,1.4239,0.70542,1.8244]; 10-feb
params = [0.72300481,1.16249681,0.7411129,1.15678401,0.9131622,0.94370828,0.6521052,1.4022054,0.7091683,1.4241122,0.9981881,1.14074698];
for i = 1:length(params)
    params(i) = params(i) + params(i)*rand*0.05;
end
%param = [0.6921,0.7249,1.3500,0.9433,0.7256,0.8887,0.6794,1.5871];
%params = ones(1,10);

global val_its cc
val_its = zeros(200,13);
cc=1;

lb = [repmat([0.5],1,12)];%, repmat([0.9],1,36)];
ub = [repmat([2.0],1,12)];%, repmat([1.1],1,36)];
options = optimset('Display','iter','TolFun',.005,'MaxIter',100);
%fminsearchbnd(@tuneopt,params,lb,ub,options)
[newp,FVAL,EXITFLAG,OUTPUT] = fminsearchbnd(@tuneopt,params,lb,ub,options)
%fminsearch(@tuneopt,params,options);

%% old results
param_oct = newp;
% 5
%fprintf(['[',num2str(param_oct(1)),',',num2str(param_oct(2)),',',num2str(param_oct(3)),',',num2str(param_oct(4)),',',num2str(param_oct(5)),']\n']);
% 10
%fprintf(['[',num2str(param_oct(1)),',',num2str(param_oct(2)),',',num2str(param_oct(3)),',',num2str(param_oct(4)),',',num2str(param_oct(5)),',','0.0,0.0,',num2str(param_oct(6)),',',num2str(param_oct(7)),',',num2str(param_oct(8)),',',num2str(param_oct(9)),',',num2str(param_oct(10)),']\n']);
% 12
fprintf(['[',num2str(param_oct(1)),',',num2str(param_oct(2)),',',num2str(param_oct(3)),',',num2str(param_oct(4)),',',num2str(param_oct(5)),',',num2str(param_oct(6)),',',num2str(param_oct(7)),',',num2str(param_oct(8)),',',num2str(param_oct(9)),',',num2str(param_oct(10)),',',num2str(param_oct(11)),',',num2str(param_oct(12)),']\n']);
% 14
%fprintf(['params_oct = [',num2str(param_oct(1)),',',num2str(param_oct(2)),',',num2str(param_oct(3)),',',num2str(param_oct(4)),',',num2str(param_oct(5)),',',num2str(param_oct(6)),',',num2str(param_oct(7)),',',num2str(param_oct(8)),',',num2str(param_oct(9)),',',num2str(param_oct(10)),',',num2str(param_oct(11)),',',num2str(param_oct(12)),',',num2str(param_oct(13)),',',num2str(param_oct(14)),'];\n']);


%%
%global param_oct
%param_oct = [0.9803,1.6977,1.9715,1.8744,1.3374,1.0129,2.2288,1.807,2.4992,1.3027,1.8948,1.9207,5.529,5.081];
%umerlat_oct;

figure; 
plot(paramgoal,'k'); grid on;
figure;
plot(paramh(:,1:10));
figure;
plot(paramh(:,11:end));


%%

%params = [0.7248,1.1655,0.7348,1.1655,0.9030,1.2150,0.6597,1.4173,0.6597,1.4173,0.7030,1.8150];
params = [0.71564,1.16,0.73401,1.1525,0.91378,1.2341,0.66725,1.4069,0.66526,1.4239,0.70542,1.8244];
params = [0.71965,1.1536,0.72895,1.1749,0.91008,1.303,0.66242,1.26,0.71371,1.3531,0.79404,1.8398];
tuneopt(params); umerlat2;
plottwiss;


%%
ao.QD.FitParams(1,1)*ao.QD.FitParams(1,2)*ao.QD.FitParams(1,3)*ao.QD.FitParams(1,4)*1e4
ao.QF.FitParams(1,1)*ao.QF.FitParams(1,2)*ao.QF.FitParams(1,3)*ao.QF.FitParams(1,4)*1e4
ao.BEND.FitParams(1,1)*ao.BEND.FitParams(1,2)*ao.BEND.FitParams(1,3)*ao.BEND.FitParams(1,4)*1e6
ao.QD.FitParams(end,1)*ao.QD.FitParams(end,2)*ao.QD.FitParams(end,3)*ao.QD.FitParams(end,4)*1e4
ao.QF.FitParams(end,1)*ao.QF.FitParams(end,2)*ao.QF.FitParams(end,3)*ao.QF.FitParams(end,4)*1e4
ao.BEND.FitParams(end,1)*ao.BEND.FitParams(end,2)*ao.BEND.FitParams(end,3)*ao.BEND.FitParams(end,4)*1e6

