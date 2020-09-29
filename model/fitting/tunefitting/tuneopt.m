function goal = tuneopt(params)

% grab fit tune values
%[qx,qy,p11,p22] = tuneopt_util(); % normal
qx = [6.5194    6.5286    6.5845    6.6746    6.7361    6.8198];
qy = [6.7895    6.8791    6.8576    6.7543    6.8096    6.7122];
p11 = [1.7890    1.7951    1.8058    1.8179    1.8332    1.8408];
p22 = [1.8060    1.8226    1.8226    1.8088    1.8226    1.8088];

% apply new params
ao=getao;
ao.QD.FitParams(1:35,1) = params(1);
ao.QD.FitParams(1:35,3) = params(2);
ao.QF.FitParams(1:35,1) = params(3);
ao.QF.FitParams(1:35,3) = params(4);
ao.BEND.FitParams(1:35,1) = params(5);
ao.BEND.FitParams(1:35,3) = params(6);
ao.QD.FitParams(end,1) = params(7);
ao.QD.FitParams(end,3) = params(8);
ao.QF.FitParams(end,1) = params(9);
ao.QF.FitParams(end,3) = params(10);
ao.BEND.FitParams(end,[1,3]) = [params(11),params(12)];


% new tunes
global THERING
tunesk = zeros(length(qx),1);
for k = 1:length(qx)
    p1 = p11(k);
    p2 = p22(k);
    ao.QF.SetPoints(1:35) = p1;
    ao.QD.SetPoints(1:35) = p2;
    setao(ao); pause(0.025);
    % regular lattice
    umerlat2;
    %T1 = ringpass(THERING,[1e-3,0,1e-3,0,0,0]',64);
    numturns = 1;
    [td,tune11] = twissring(repmat(THERING,1,numturns),0,1:length(THERING)*numturns+1,'chrom');
    qx_new = tune11(1);%;1-naff(T1(1,1:64)');
    qy_new = tune11(2);%1-naff(T1(1,1:64)');
    tunesk(k) = sqrt((qx(k)-qx_new)^2 + (qy(k)-qy_new)^2);
end
istr_fit_d = abs((ao.BEND.FitParams(1,1)*ao.BEND.FitParams(1,2)*ao.BEND.FitParams(1,3)*ao.BEND.FitParams(1,4)*1e6) - 19.9133);
istr_fit_qd = abs((ao.QD.FitParams(1,1)*ao.QD.FitParams(1,2)*ao.QD.FitParams(1,3)*ao.QD.FitParams(1,4)*1e4) - 13.50);
istr_fit_qf = abs((ao.QF.FitParams(1,1)*ao.QF.FitParams(1,2)*ao.QF.FitParams(1,3)*ao.QF.FitParams(1,4)*1e4) - 13.50);
istr_fit_pd = abs((ao.BEND.FitParams(end,1)*ao.BEND.FitParams(end,2)*ao.BEND.FitParams(end,3)*ao.BEND.FitParams(end,4)*1e6) - 1.913);
istr_fit_yq = abs((ao.QD.FitParams(1,1)*ao.QD.FitParams(1,2)*ao.QD.FitParams(1,3)*ao.QD.FitParams(1,4)*1e4) - 5.541);
istr_fit_qr1 = abs((ao.QF.FitParams(1,1)*ao.QF.FitParams(1,2)*ao.QF.FitParams(1,3)*ao.QF.FitParams(1,4)*1e4) - 5.446);

tunes = sum(tunesk);

% reset setpoints
ao.QF.SetPoints(1:35) = 1.826;
ao.QD.SetPoints(1:35) = 1.826;
setao(ao);

%qr1g = abs(param(1)*param(2) - param(7)*param(8));
%yqg = abs(param(3)*param(4) - param(9)*param(10));
%qrqfg = abs(param(1)*param(2) - param(3)*param(4));
%tunes = tunes + qr1g + yqg;
goal = 3*tunes + istr_fit_d + 1.2*istr_fit_qd + 1.2*istr_fit_qf + istr_fit_yq + istr_fit_qr1 + istr_fit_pd;

global val_its cc
val_its(cc,:) = [params,goal];
cc = cc + 1;
if 1
    fprintf(['                                                                     ',num2str(qx_new),'|',num2str(qy_new),'\n'])
    fprintf(['                                                                     ',num2str(istr_fit_d),'|',num2str(istr_fit_qd),'|',num2str(istr_fit_qf),'\n'])
end


end
