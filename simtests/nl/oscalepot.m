plottwissnl;

bb=mean(beta(55:62,:)');
bbm = mean([bb(1:end-1);bb(2:end)]);

bbm_inv = [ bbm(1), bbm(1)+diff(bbm([2,1])), bbm(1)+diff(bbm([3,1])), bbm(1)+diff(bbm([4,1])),...
    bbm(1)+diff(bbm([5,1])), bbm(1)+diff(bbm([6,1])), bbm(1)+diff(bbm([7,1])),];


figure; plot(bbm,'.-'); hold on; plot(bbm_inv,'.-');

bbm_inv_norm = bbm_inv/max(bbm_inv);
scalef = 1.0;
bbm_inv_norm = bbm_inv_norm*scalef;