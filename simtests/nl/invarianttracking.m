
hh_param = linspace(1e-3,5e-3,10);
HH = zeros(2000,length(hh_param));

for kk = 1:length(hh_param)

x0 = hh_param(kk); %5e-3;
y0 = hh_param(kk); %5e-3;
xp0 = 0.0;
yp0 = 0.0;
Occc = 0.0965;
%Occc_s = [0.9310    0.9713    0.9943    1.0000    0.9884    0.9594    0.9131]*0.10;
ao=getao; ao.O.SetPoints(:) = Occc; setao(ao); pause(1);
umerlat_oct;

turns = 2000;
idx = 1;
x = zeros(turns,1);
xp = x;
y = x;
yp =x;
for i = 1:turns
    if i == 1
        T = linepass(THERING,[x0,xp0,y0,yp0,0,0]',1:length(THERING)+1);
    else
        T = linepass(THERING,[xt,xpt,yt,ypt,0,0]',1:length(THERING)+1);
    end
    x(i) = T(1,idx);
    xp(i) = T(2,idx);
    y(i) = T(3,idx);
    yp(i) = T(4,idx);
    xt = T(1,end);
    xpt = T(2,end);
    yt = T(3,end);
    ypt = T(4,end);
end

numturns = 1;
[td,tune] = twissring(repmat(THERING,1,numturns),0,1:length(THERING)*numturns+1,'chrom');
beta = cat(1,td.beta);
alpha = cat(1,td.alpha);
betax = beta(idx,1);
betay = beta(idx,2);
betaa = (betax + betay) / 2.0;
alphax = alpha(idx,1);
alphay = alpha(idx,2);
alphaa = (alphax + alphay) / 2.0;

c = 1;
V = (1/betaa^3)*c*(x.^4 + y.^4 - 6*x.^2.*y.^2);
if Occc == 0
    V = 0;
end
H = 0.5*(x.^2/betaa^2 + y.^2/betaa^2) + 0.5*(xp - (x.*alphaa)/(2.0*betaa)).^2 + 0.5*(yp - (y.*alphaa)/(2.0*betaa)).^2 + V;

if 0
figure;
subplot(2,2,1); plot(0.5*x.^2); 
subplot(2,2,2); plot(0.5*y.^2); 
subplot(2,2,3); plot(0.5*xp.^2); 
subplot(2,2,4); plot(0.5*yp.^2); 
figure;
subplot(2,2,1); hold on; scatter(x,y,5,'r','filled'); title('y vs x');
subplot(2,2,2); hold on; scatter(x,xp,5,'r','filled'); title('xp vs x');
subplot(2,2,3); hold on; scatter(y,yp,5,'r','filled'); title('yp vs y');
subplot(2,2,4); hold on; scatter(xp,yp,5,'r','filled'); title('yp vs xp');
end

HH(:,kk) = H;
end
%%
N_tt = length(hh_param);
clrs = jet(N_tt);
figure; hold on;

for kk = 1:N_tt
scatter(1:turns,HH(:,kk),5,clrs(kk,:),'filled');
end

colormap jet;
caxis([1e-3,5e-3]);
ylim([0,7e-3]);

%save('hhinv2.mat','HH');

