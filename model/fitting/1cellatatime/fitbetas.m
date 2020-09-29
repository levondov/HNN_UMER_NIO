
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

options = optimset('Display','iter','TolFun',.05,'MaxIter',300);
iters = 1;

idxFF = 1:35;
idxDD = 36:70;

umerinit;umerlat;
for iter = 1:iters
    ao = getao;
    
    for i = 1:1
        p1 = [beta(idxDD(i),1), beta(idxDD(i),2); beta(idxFF(i),1), beta(idxFF(i),2)];
        p2 = i;
        p3 = [idxCenterD(i),idxCenterF(i)];
        params = [ao.QD.FitParams(i,[1,3]),ao.QF.FitParams(i,[1,3])];               
        lb = [0.6,1.0,0.6,1.0];
        up = [0.8,1.2,0.8,1.2];       
        ff = @(x)betagoal2(x,p1,p2,p3);
        fminsearchbnd(ff,params,lb,up,options)      
        clear ff
        fprintf(['CELL: ',num2str(i),' / ',num2str(35),'\n']);
    end
end

%params = [ao.QD.FitParams(i,[1,3]),ao.QF.FitParams(i,[1,3]), ao.QD.MisAlign(i,:), ao.QF.MisAlign(i,:)];        
%lb = [0.65,1.0,0.65,1.0,repmat([-5e-3],1,4)];
%up = [0.75,1.2,0.75,1.2,repmat([5e-3],1,4)];
%% Plot betas
