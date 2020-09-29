
% grab current fit data
umerinit;
params_oct = [1.9807,1.0062,2.482,1.952,1.6792,1.2091,1.802,2.2876,1.4074,2.4494,1.9361,1.9411,5.3847,5.928];
tuneopt_oct2(params_oct); umerlat_oct; plottwissnl
params = zeros(2,1);
lb = repmat([-1],2,1);
ub = repmat([1],2,1);
options = optimset('Display','iter','TolFun',.001,'MaxIter',1000);
%%
fminsearchbnd(@runopt_goal,params,lb,ub,options)


%% Plot betas

% new vals:
pp=[
    1.4962
    0.9066
    1.4719
    0.9066
    0.9000
    0.9048
    1.4908
    0.9234
    1.0897
    0.9001
    1.4215
    1.3892
    1.4587
    1.4732
    0.9009
    1.4907
    0.9695
    1.4206
    1.4974
    0.9018
    0.9330
    0.9433
    1.5000
    0.9504
    0.9000
    0.9277
    0.9242
    1.4533
    0.9014
    0.9029
    0.9014
    0.9261
    1.4875
    1.0756
    0.9015];
