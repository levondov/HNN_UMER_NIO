global param
global paramh
global paramgoal
global p1
global p2
global tune
% param are [PS, EL] for ring F quads, d quads, dipoles, QR1, YQ, PD (total 12 param)
%params = [0.8354, 0.9620, 0.8354, 0.9620, 0.9969, 0.8606, 0.8965, 1.1109, 0.8558, 1.0107];%, ones(1,36)];
% best solution so far.
%params = [0.7415,1.1134,0.7752,1.1030,1.1181,1.0715,0.8043,1.1241,0.8970,0.9010,0.6132,1.1959];
params = [0.6921,1.1067,0.7249,1.1410,1.3500,0.9433,0.7256,1.0556,0.8887,0.9591,0.6794,1.5871];
%params = ones(1,10);
param = params;
paramh = params;
paramgoal = [];
p1 = 1.826;
p2 = 1.826;
lb = [repmat([0.5],1,12)];%, repmat([0.9],1,36)];
ub = [repmat([2.0],1,12)];%, repmat([1.1],1,36)];
options = optimset('Display','iter');
%fminsearchbnd(@tuneopt,params,lb,ub,options)
fminsearchbnd(@tuneopt_oct22,params,lb,ub,options)
%fminsearch(@tuneopt,params,options);

global param_oct
param_oct = [0.9803,1.6977,1.9715,1.8744,1.3374,1.0129,2.2288,1.807,2.4992,1.3027,1.8948,1.9207,5.529,5.081];
umerlat_oct;
%%
figure; 
plot(paramgoal,'k'); grid on;
figure;
plot(paramh(:,1:10));
figure;
plot(paramh(:,11:end));