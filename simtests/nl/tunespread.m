%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% build the ring
Occc = [0.9654]*1.0;
%Occc_s = [0.9310    0.9713    0.9943    1.0000    0.9884    0.9594    0.9131]*0.10;
ao=getao; ao.O.SetPoints(:) = Occc; setao(ao); pause(1);
umerlat_oct;
%%
% PARTICLE DISTRIBUTION CODE
Np = 1e3; % number of particles

% gaussian distribution in x and y
xmean = 0.0;
ymean = 0.0;
xsigma = 5e-3;
ysigma = 5e-3;
x0 = normrnd(xmean,xsigma,[Np,1]);
y0 = normrnd(ymean,ysigma,[Np,1]);
% random distr in xp,yp
xpmin = -0.01;
xpmax = 0.01;
ypmin = -0.01;
ypmax = 0.01;
xp0 = ((xpmax-xpmin)*rand([Np,1])+xpmin);
yp0 = ((ypmax-ypmin)*rand([Np,1])+ypmin);
% values for chrom and dispersion
c0 = zeros(Np,1);
d0 = zeros(Np,1);

par_initial = [x0,xp0,y0,yp0,c0,d0]'; % initial distirbution, 6xNp
% with rows being
% x,xp,y,yp,chrom,disp

%% plot distribution
if 1
    figure;
    subplot(2,2,1);
    scatter(x0,y0,'.');
    title('y vs x');
    subplot(2,2,2);
    scatter(x0,xp0,'.');
    title('xp vs x');
    subplot(2,2,3);
    scatter(y0,yp0,'.');
    title('yp vs x');
    subplot(2,2,4);
    scatter(xp0,yp0,'.');
    title('yp vs xp');
end

%% Track all particles
% note too many particles will take a long time to track, start with a low
% number first.

% Find the s position for each element
spos = findspos(THERING,1:length(THERING)+1);
turns = 64;
% Track 1 turn around, grab particle positions after 1 turn
T1 = ringpass(THERING,par_initial,turns);
% TT is 6xNp each column is 1 particle x,xp,y,yp,chrom,disp.
%
% if you ran 2 turns (ringpass(THERING,par_initial,2)
% the output would be TT = 6x(Np x turns).
% so the first 1:Np columns will be 1st turn, and columns Np:2Np will be
% 2nd turn.

% track particles at each element within 1 turn
%T2 = linepass(THERING,par_initial,1:length(THERING)+1);
% similar to ringpass, the output is 6 x (Np x # elements)
% e.g. if you have 100 particles and 5 elements in your ring it will be
% TT=6 x (100 x 5) size.
%%
% organize everything into nice arrays
each_element_start = 1:Np:(Np*turns);
xf = zeros(Np,turns);
xpf = zeros(Np,turns);
yf = zeros(Np,turns);
ypf = zeros(Np,turns);

for i = 1:length(each_element_start)
    xf(:,i) = T1(1,each_element_start(i):(each_element_start(i)+Np-1));
    xpf(:,i) = T1(2,each_element_start(i):(each_element_start(i)+Np-1));
    yf(:,i) = T1(3,each_element_start(i):(each_element_start(i)+Np-1));
    ypf(:,i) = T1(4,each_element_start(i):(each_element_start(i)+Np-1));
end
% xf,xpf,yf,ypf are Np vs # number of elements long.
%
% so each row is a particle and each column is that particle's value after
% an element.

%% plotting stuff afterwards
% plot x vs element location through 1 turn for each particle
figure;
subplot(2,1,1); hold on;
ii=0;
for i = 1:Np
    if ~(sum(xf(i,:) > 0.02))
        plot(xf(i,:),'k');
        ii=ii+1;
    end
end
ylim([-0.04,0.04]); title(num2str(ii/Np));
subplot(2,1,2); hold on;
ii=0;
for i = 1:Np
    if ~(sum(yf(i,:) > 0.02))
        plot(yf(i,:),'k');
        ii=ii+1;
    end
end
ylim([-0.04,0.04]); title(num2str(ii/Np));

Qx = zeros(turns,1);
Qy = zeros(turns,1);
for ii = 1:turns
    Qx(ii) = naff(xf(ii,:)');
    Qy(ii) = naff(yf(ii,:)');
end


figure; plot_tunespace(1:3); hold on; scatter(Qx,Qy,5,'k','filled')


%% Tune spread plot
clrs = jet(5);

figure; plot_tunespace(1:3); hold on;
for i = 1:5
    scatter(Q{i}(:,1),Q{i}(:,2),10,clrs(i,:))
end










