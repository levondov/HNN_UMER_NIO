global splitquads
splitquads = 0;
global g1 g2 g3 g4 g5 g6 g7
g1 = [];
g2 = [];
g3 = [];
g4 = [];
g5 = [];
g6 = [];
g7 = [];

fname='datas2.mat';
% New values at 7.20
if 1
    params_oct = [1.959,1.0841,1.9069,1.707,1.083,0.81508,1.5258,2.2801,1.7142,2.4965,2.0584,2.0541,2.4371,2.135];
end

if 1
    %params_oct = [2.0135,1.4275,2.4886,1.8185,1.2281,0.623,1.6242,2.2916,1.9138,2.4667,1.9487,1.9931,5.9498,5.663];
    %params_oct = [2.1447,1.299,2.3571,1.8103,1.2261,0.63142,1.6098,2.2282,1.7211,2.4862,1.9453,1.994,5.6817,5.4459];
    % 7.13
    %params_oct = [2.1157,1.2976,2.3615,1.8014,1.234,0.63863,1.6103,2.2228,1.695,2.496,1.9451,1.9915,5.7478,5.3314];
    % 7.16
    %params_oct = [1.8681,1.1087,2.49,1.9633,1.6902,1.2185,1.7686,2.2774,1.4281,2.4998,1.9558,1.976,5.4296,5.85];
    % 7.16 w/ new fitting
    %params_oct = [2.048,1.1376,2.4736,1.9188,1.6383,1.2799,1.8289,2.3399,1.4493,2.4952,1.9303,1.9464,5.362,5.9966];
    % WITH OLD UMERINIT (e.g. dipole wrong bend angles)
    %params_oct = [2.3091,1.1357,2.413,2.0562,2.0102,1.5574,1.9275,2.2269,1.4181,2.4459,1.9466,1.9837,5.7429,5.1619];
    % WITH NEW UMERINIT (e.g. corrent dipoles)
    params_oct = [1.6736,1.1566,1.7884,1.5742,1.2138,0.73729,1.5599,2.1255,1.6194,2.4905,2.0232,1.9113,5.538,5.0222];
    %params_oct = [1.9807,1.0062,2.482,1.952,1.6792,1.2091,1.802,2.2876,1.4074,2.4494,1.9361,1.9411,5.3847,5.928];
    % new with flipped dipole exit angle
    params_oct = [1.6616,1.1212,1.5696,1.7478,1.3598,1.1707,1.7881,2.3313,1.461,2.4709,1.9986,1.974,4.5662,4.6686];

end



lb = [repmat([-2.5],1,12), 0, 0];%, repmat([0.9],1,36)];
ub = [repmat([2.5],1,12), 6, 6];%, repmat([1.1],1,36)];
options = optimset('Display','iter','MaxIter',400);
newp = fminsearchbnd(@tuneopt_oct3,params_oct,lb,ub,options)
%fminsearch(@tuneopt,params,options);

%%
plottwissnl
%%
T = ringpass(THERING,[1e-3,0,1e-3,0,0,0]',1024);
plotT(T);
%% old results
param_oct = newp;
% 5
%fprintf(['[',num2str(param_oct(1)),',',num2str(param_oct(2)),',',num2str(param_oct(3)),',',num2str(param_oct(4)),',',num2str(param_oct(5)),']\n']);
% 10
%fprintf(['[',num2str(param_oct(1)),',',num2str(param_oct(2)),',',num2str(param_oct(3)),',',num2str(param_oct(4)),',',num2str(param_oct(5)),',','0.0,0.0,',num2str(param_oct(6)),',',num2str(param_oct(7)),',',num2str(param_oct(8)),',',num2str(param_oct(9)),',',num2str(param_oct(10)),']\n']);
% 12
%fprintf(['[',num2str(param_oct(1)),',',num2str(param_oct(2)),',',num2str(param_oct(3)),',',num2str(param_oct(4)),',',num2str(param_oct(5)),',','0.0,0.0,',num2str(param_oct(6)),',',num2str(param_oct(7)),',',num2str(param_oct(8)),',',num2str(param_oct(9)),',',num2str(param_oct(10)),',',num2str(param_oct(11)),',',num2str(param_oct(12)),']\n']);
% 14
fprintf(['params_oct = [',num2str(param_oct(1)),',',num2str(param_oct(2)),',',num2str(param_oct(3)),',',num2str(param_oct(4)),',',num2str(param_oct(5)),',',num2str(param_oct(6)),',',num2str(param_oct(7)),',',num2str(param_oct(8)),',',num2str(param_oct(9)),',',num2str(param_oct(10)),',',num2str(param_oct(11)),',',num2str(param_oct(12)),',',num2str(param_oct(13)),',',num2str(param_oct(14)),'];\n']);

%save(fname,'g1','g2','g3','g4','g5','g6','g7','beta','s')










