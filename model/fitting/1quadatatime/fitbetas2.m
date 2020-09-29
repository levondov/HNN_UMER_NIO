
% grab current fit data
ao = getao;
global splitquads
splitquads = 0;
umerlat;
idxF = getfamily(ao.QF.FamilyName,THERING);
idxD = getfamily(ao.QD.FamilyName,THERING);
splitquads = 1;
umerlat;
idxCenter = getfamily('QuadCenter',THERING);
idxCenterF = idxCenter(2:2:end);
idxCenterD = idxCenter(1:2:end);
idxexpF = 2:2:72;
idxexpD = 1:2:72;
options = optimset('Display','final','TolFun',.05,'MaxIter',100);
runQF = 1;
runQD = 1;
iters = 1;

umerinit% QF
for iter = 1:iters
    ao = getao;
    if runQF
        for i = 1:36
            p1 = [Q1s_new(idxexpF(i),1), Q1s_new(idxexpF(i),2)];
            p2 = i;
            p3 = idxCenterF(i);
            p4 = 'QF';
            ff1 = @(x) betagoal(x,p1,p2,p3,p4);
            fminsearchbnd(ff1,ao.QF.FitParams(i,[1,3]),[0.5,0.5],[1.5,1.5],options)
            %fminsearch(ff1,ao.QF.FitParams(i,[1,3]),options)
            clear ff1
            fprintf(['QF: ',ao.QF.CommonNames{i},'\n'])
        end
    end
    % QD
    if runQD
        for i = 1:36
            p1 = [Q1s_new(idxexpD(i),1), Q1s_new(idxexpD(i),2)];
            p2 = i;
            p3 = idxCenterD(i);
            p4 = 'QD';
            ff2 = @(x)betagoal(x,p1,p2,p3,p4);
            fminsearchbnd(ff2,ao.QD.FitParams(i,[1,3]),[0.5,0.5],[1.5,1.5],options)
            %fminsearch(ff2,ao.QD.FitParams(i,[1,3]),options)
            clear ff2
            fprintf(['QD: ',ao.QD.CommonNames{i},'\n'])
        end
    end
end


%% Plot betas
