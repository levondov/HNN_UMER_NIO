ao=getao;
N=25;
Occc = [0.9654]*0.0;
%Occc = bbm_inv_norm*0.5;
ao.O.SetPoints(:) = Occc; setao(ao); pause(1);
umerlat_oct
one_turn_flag = 0;

if one_turn_flag
    dataX = zeros(N*N,1);
    dataXP = zeros(N*N,1);
else
    dataX = zeros(N*N*512,1);
    dataXP = zeros(N*N*512,1);
end
dataXn = dataX;
dataXPn = dataX;

%umerinit;
%umerlat_octi_short

xmin = -15e-3;
xmax = 15e-3;
xpmin = -0.01745*2;
xpmax = 0.01745*2;

%x0 = ((xmax-xmin)*rand([N,1])+xmin);
x0 = linspace(xmin,xmax,N);
p0 = linspace(xpmin,xpmax,N);
%p0 = ((xpmax-xpmin)*rand([N,1])+xpmin);
%x0 = linspace(-6e-3,6e-3,N);
%p0 = linspace(-0.04,0.04,N);

c = 1:length(x0)*length(p0);
tmpx = []; tmpxn = [];
tmpxp = []; tmpxpn = [];
data2x = cell(length(x0),length(p0));
data2xp = cell(length(x0),length(p0));
x0s = zeros(N,N);
p0s = zeros(N,N);

for i=1:length(x0)
    for k=1:length(p0)
        if one_turn_flag
            T = ringpass(THERING(55:62),[x0(i),p0(k),0,0,0,0]',1);
        else
            T = ringpass(THERING,[x0(i),p0(k),0,0,0,0]',256);
        end
        if sum(sum(isnan(T)))
            if one_turn_flag
                tmpxn = cat(1,tmpxn,T(1,end)');
                tmpxpn = cat(1,tmpxpn,T(2,end)');
            else
                tmpxn = cat(1,tmpxn,T(1,:)');
                tmpxpn = cat(1,tmpxpn,T(2,:)');
            end
        else
            if one_turn_flag
                if T(1,end) < 1
                    tmpx = cat(1,tmpx,T(1,end)');
                    tmpxp = cat(1,tmpxp,T(2,end)');
                end
            else
                tmpx = cat(1,tmpx,T(1,:)');
                tmpxp = cat(1,tmpxp,T(2,:)');
            end
        end
        data2x{i,k} = T(1,:);
        data2xp{i,k} = T(2,:);        
        x0s(i,k) =x0(i);
        p0s(i,k) = p0(k);
    end
    fprintf([num2str(i),'/',num2str(length(x0)),'\n']);
end
dataX(1:length(tmpx)) = tmpx;
dataXP(1:length(tmpxp)) = tmpxp;
dataXn(1:length(tmpxn)) = tmpxn;
dataXPn(1:length(tmpxpn)) = tmpxpn;


%%
figure; hold on;
%scatter(x0s(:),p0s(:),100,'r');
scatter(dataX,dataXP,0.5,'k.')
xlim([-0.015,0.015]);
ylim([-0.01745*3,0.01745*3]);
xlabel('X (m)'); ylabel('p_x (m)');
%set(gca,'xtick',[],'ytick',[],'title',[])

%set(gcf,'Units','Inches');
%pos = get(gcf,'Position');
%set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
%print(gcf,'phasespaceplot_1','-dpdf','-r0')

T = ringpass(THERING,[1e-3,0,0,0,0,0]',512);
figure; plot(linspace(0,1,512),abs(fft(T(1,:))));
