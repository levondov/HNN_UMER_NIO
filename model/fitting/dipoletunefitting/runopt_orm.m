
% grab current fit data
umerinit;
params_oct = [1.9807,1.0062,2.482,1.952,1.6792,1.2091,1.802,2.2876,1.4074,2.4494,1.9361,1.9411,5.3847,5.928];
tuneopt_oct2(params_oct); umerlat_oct; plottwissnl
params = zeros(35,1);
lb = repmat([-0.1],35,1);
ub = repmat([0.1],35,1);
options = optimset('Display','iter','TolFun',.05,'MaxIter',1000);
%%
fminsearchbnd(@runopt_goal_orm,params,lb,ub,options)