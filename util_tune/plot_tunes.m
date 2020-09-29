function [tunes] = plot_tunes(bpms)
% Plot relevant tune information
%
% INPUT:
%   1. bpms - a cell array of bpm objects with atleast 100 turns
%
%   2. tunes - a Nx12 array of calculated tunes
%       [naff16-Qx,naff16-Qy,naff32-Qx,naff32-Qy,naff64-Qx,naff64-Qy,
%           fft16-Qx,fft16-Qy,fft32-Qx,fft32-Qy,fft64-Qx,fft64-Qy]
%
% Written by Levon
% August 2018
%
% Notes
%
%

if length(bpms{1}.X) < 64
    error('I need atleast 64 turns to do tune measurements');
end
global THERING
N = length(bpms);
spos = getspos();
bpmxticks = spos(getfamily('BPM',THERING))';
bpmxlabels = {'RC1','RC2','RC3','RC5','RC6','RC7','RC8','RC9','RC11','RC12','RC13','RC14','RC15','RC17'};
tunes = zeros(N,12);

% do 4 turn calculations
[tunex,tuney,stats] = get4tune(bpms);


% do and plot fft calculations
figure('Units','pixels','Position',[500,100,1000,800])

subplot(4,2,1); hold on;
for i = 1:N
    plot(bpms{i}.X);
end
title('X Position');
ylabel('mm'); xlabel('turns'); ylim([-10,10]);
subplot(4,2,2); hold on;
for i = 1:N
    plot(bpms{i}.Y);
end
title('Y Position');
ylabel('mm'); xlabel('turns'); ylim([-10,10]);

for i = 1:N
    [tx,ty,~,~,fx,fy] = calctune(bpms{i}.X(1:16),bpms{i}.Y(1:16));
    tunes(i,7:8) = [tx,ty];
    subplot(4,2,3); hold on;
    plot(linspace(0,1,16),fx);
    subplot(4,2,4); hold on;
    plot(linspace(0,1,16),fy);    
end
subplot(4,2,3); hold on;
title('FFT Qx 16 turn');
xlabel('Tune'); ylabel('a.u.');
subplot(4,2,4); hold on;
title('FFT Qy 16 turn');
xlabel('Tune'); ylabel('a.u.');

for i = 1:N
    [tx,ty,~,~,fx,fy] = calctune(bpms{i}.X(1:32),bpms{i}.Y(1:32));
    tunes(i,9:10) = [tx,ty];
    subplot(4,2,5); hold on;
    plot(linspace(0,1,32),fx);
    subplot(4,2,6); hold on;
    plot(linspace(0,1,32),fy);    
end
subplot(4,2,5); hold on;
title('FFT Qx 32 turn');
xlabel('Tune'); ylabel('a.u.');
subplot(4,2,6); hold on;
title('FFT Qy 32 turn');
xlabel('Tune'); ylabel('a.u.');

for i = 1:N
    [tx,ty,~,~,fx,fy] = calctune(bpms{i}.X(1:64),bpms{i}.Y(1:64));
    tunes(i,11:12) = [tx,ty];
    subplot(4,2,7); hold on;
    plot(linspace(0,1,64),fx);
    subplot(4,2,8); hold on;
    plot(linspace(0,1,64),fy);    
end
subplot(4,2,7); hold on;
title('FFT Qx 64 turn');
xlabel('Tune'); ylabel('a.u.');
subplot(4,2,8); hold on;
title('FFT Qy 64 turn');
xlabel('Tune'); ylabel('a.u.');

% Calculate naff
tunes(:,1:2) = getnaff(bpms,16);
tunes(:,3:4) = getnaff(bpms,32);
tunes(:,5:6) = getnaff(bpms,64);

figure('Units','pixels','Position',[500,100,900,600])
subplot(2,1,1); title('Tunes - Qx'); xlabel('BPMs'); ylabel('Horz. Tune'); hold on;
set(gca,'xtick',bpmxticks,'xticklabel',bpmxlabels,'XTickLabelRotation',45);
plot(bpmxticks,tunex,'o-');
plot(bpmxticks,tunes(:,1),'o-');
plot(bpmxticks,tunes(:,3),'o-');
plot(bpmxticks,tunes(:,5),'o-');
plot(bpmxticks,tunes(:,7),'o-');
plot(bpmxticks,tunes(:,9),'o-');
plot(bpmxticks,tunes(:,11),'o-');
legend('4turn','Naff16','Naff32','Naff64','FFT16','FFT32','FFT64','Location','NorthEastOutside')

subplot(2,1,2); title('Tunes - Qy'); xlabel('BPMs'); ylabel('Vert. Tune'); hold on;
set(gca,'xtick',bpmxticks,'xticklabel',bpmxlabels,'XTickLabelRotation',45);
plot(bpmxticks,tuney,'o-');
plot(bpmxticks,tunes(:,2),'o-');
plot(bpmxticks,tunes(:,4),'o-');
plot(bpmxticks,tunes(:,6),'o-');
plot(bpmxticks,tunes(:,8),'o-');
plot(bpmxticks,tunes(:,10),'o-');
plot(bpmxticks,tunes(:,12),'o-');
legend('4turn','Naff16','Naff32','Naff64','FFT16','FFT32','FFT64','Location','NorthEastOutside')




