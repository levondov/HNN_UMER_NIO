global THERING
numturns = 1;
[td,tune11] = twissring(repmat(THERING,1,numturns),0,1:length(THERING)*numturns+1,'chrom');

beta = cat(1,td.beta);
s = cat(1,td.SPos);
phase = cat(1,td.mu)./pi;
for i = 1:length(phase(:,1))
   while phase(i,1) > 2
       phase(i,1) = phase(i,1) - 2;
   end
   while phase(i,2) > 2
       phase(i,2) = phase(i,2) - 2;
   end
end
alpha = cat(1,td.alpha);
disp = zeros(length(td),2);
for i=1:length(td)
   disp(i,1:end) = td(i).Dispersion(1:2)';
end

figure('Units','pixels','Position',[300,300,900,400]);

ax1=subplot(7,1,1:3); hold on;
plot(s,beta(:,1),'.-');
plot(s,beta(:,2),'.-');
%plot(s,disp(:,1)*10);
%plot(s,disp(:,2)*10);

% plot(s,alpha(:,1),'--');
% plot(s,alpha(:,2),'--');
grid on;
legend('\beta_x','\beta_y','Location','NorthWest');%,'10*eta x','alpha x','alpha y')
ylabel('\beta (m)'); xlabel('s (m)');
title(['TUNE:',num2str(tune11(1)),' | ',num2str(tune11(2))])

ax2=subplot(7,1,4:6); hold on;
plot(s,phase(:,1),'.-');
plot(s,phase(:,2),'.-');
grid on;
legend('\Psi_x','\Psi_y','Location','NorthWest')
ylabel('\Psi (\pi rad)'); xlabel('s (m)');

ax3=subplot(7,1,7); hold on; axis off;
drawlattice;

linkaxes([ax1,ax2,ax3],'x')
