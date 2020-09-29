global THERING
numturns = 1;
[td,tune] = twissring(repmat(THERING,1,numturns),0,1:length(THERING)*numturns+1,'chrom');

% Use MATLAB function CAT to get the data from fields of TwissData into MATLAB arrays.
%     Example: 
%     >> TD = twissring(THERING,0,1:length(THERING));
%     >> BETA = cat(1,TD.beta);
%     >> S = cat(1,TD.SPos);
%     >> plot(S,BETA(:,1))

beta = cat(1,td.beta);
s = cat(1,td.SPos);
phase = cat(1,td.mu)./pi;
alpha = cat(1,td.alpha);
disp = zeros(length(td),2);
for i=1:length(td)
   disp(i,1:end) = td(i).Dispersion(1:2)';
end

fig=figure;

ax1=subplot(7,1,1:3); hold on;
plot(s,beta(:,1),'.-');
plot(s,beta(:,2),'.-');
%plot(s,disp(:,1)*10);
%plot(s,disp(:,2)*10);

% plot(s,alpha(:,1),'--');
% plot(s,alpha(:,2),'--');
grid on;
legend('beta x','beta y');%,'10*eta x','alpha x','alpha y')
ylabel('beta (m)'); xlabel('s (m)');
title(['TUNE:',num2str(tune(1)),' | ',num2str(tune(2))])

ax2=subplot(7,1,4:6); hold on;
plot(s,phase(:,1),'.-');
plot(s,phase(:,2),'.-');
grid on;
legend('phase x','phase y')
ylabel('phase (pi rad)'); xlabel('s (m)');
phase_goal1 = phase(end,1) - (phase(63,1)-phase(55,1));
phase_goal2 = phase(end,2) - (phase(63,2)-phase(55,2));
ph1 = (phase(63,1)-phase(55,1));
ph2 = (phase(63,2)-phase(55,2));
title(['n\pi:',num2str(phase_goal1),' | ',num2str(phase_goal2), ' || octu: ',num2str(ph1),' | ',num2str(ph2)])

ax3=subplot(7,1,7); hold on; axis off;
drawlattice;

linkaxes([ax1,ax2,ax3],'x')

orient(fig,'landscape')
print(fig,'optex1_result.pdf','-dpdf')
