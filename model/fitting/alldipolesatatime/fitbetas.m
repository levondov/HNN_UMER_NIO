
% grab current fit data
ao = getao;
global splitquads
splitquads = 0;
umerlat_oct;
idxF = getfamily(ao.QF.FamilyName,THERING);
idxD = getfamily(ao.QD.FamilyName,THERING);
splitquads = 1;
umerlat;
idxCenter = getfamily('QuadCenter',THERING);


options = optimset('Display','iter','TolFun',.05);
iters = 1;
idxrange = [1:58,60:72];

%umerinit%
for iter = 1:iters
    ao = getao;
    
    p1 = Q1s_new;
    p2 = repelem(1:36,2);
    p3 = idxCenter;
    p4 = repmat({'QD','QF'},1,36);
    params = ao.BEND.FitParams(:,1);
    lb = [repmat([1.0],1,35),0.1]; ub = [repmat([1.5],1,35),1.5];
    ff = @(x) betagoal(x,p1(idxrange,:),p2(idxrange),p3(idxrange),p4(idxrange));
    fminsearchbnd(ff,params,lb,ub,options)
    clear ff    
end


% do QF and QD separately
%    if runQF
%        p1 = Q1s_new(idxexpF,:);
%        p2 = 1:36';
%        p3 = idxCenterF;
%        p4 = repmat({'QF'},1,36);
%        ff1 = @(x) betagoal(x,p1,p2,p3,p4);
%        fminsearchbnd(ff1,ao.QF.FitParams(1:36,3),repmat([0.9],1,36),repmat([1.35],1,36),options)
%        clear ff1
%    end
%    % QD
%    if runQD
%        p1 = Q1s_new(idxexpD,:);
%        p2 = 1:36';
%        p3 = idxCenterD;
%        p4 = repmat({'QD'},1,36);
%        ff2 = @(x) betagoal(x,p1,p2,p3,p4);
%        fminsearchbnd(ff2,ao.QD.FitParams(1:36,3),repmat([0.9],1,36),repmat([1.35],1,36),options)
%        clear ff2
%    end

%% Plot betas
