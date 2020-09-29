function [ output_args ] = plotsp()
% plot magnet setpoints

ao=getao;

qcrts = zeros(72,1);
dcrts = ao.BEND.SetPoints;
vcmcrts = ao.VCM.SetPoints;
hhcrts = ao.HH.SetPoints;

j=1;
for i = 1:36
    qcrts(j) = ao.QD.SetPoints(i);
    j=j+1;
    qcrts(j) = ao.QF.SetPoints(i);
    j=j+1;
end

figure;
subplot(4,1,1);
plot(qcrts,'.-');
title('Quads');

subplot(4,1,2);
plot(dcrts,'.-');
title('Dipoles');

subplot(4,1,3);
plot(vcmcrts,'.-');
title('VCM');

subplot(4,1,4);
plot(hhcrts,'.-');
title('HH');


end

