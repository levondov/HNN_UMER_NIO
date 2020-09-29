% setup lattice -- need to just run this part once.
umerinit2; pause(0.1);
params_oct = [1.6616,1.1212,1.5696,1.7478,1.3598,1.1707,1.7881,2.3313,1.461,2.4709,1.9986,1.974,4.5662,4.6686];
tuneopt_oct3(params_oct);
%%

ao=getao;
ao.O.SetPoints(:) = 0.2; % strength of the nonlinear octupole magnet (decides how much tune shift occurs)
setao(ao);
umerlat_oct;
xamp = 0:0.4e-3:10e-3; % number of amplitude steps to scan in x
yamp = 0:0.4e-3:10e-3; % number of aplitude steps to scan in y
M = length(yamp);
N = length(xamp);
Qx0 = zeros(N,N);
Qx1 = zeros(N,N);
Qy0 = zeros(N,N);
Qy1 = zeros(N,N);
D = zeros(N,N);

% run simulation of frequency map + dynamic aperture scan
% calculate tunse at 1-64 turns and 65-128 turns.
for i = 1:N
    for j = 1:N
        T = ringpass(THERING,[xamp(i),0.0,yamp(j),0.0,0,0]',128);
        if sum(sum(isnan(T))) == 0
            %Qx0(i,j) = naff(T(1,1:256)');
            %Qx1(i,j) = naff(T(1,257:512)');
            %Qy0(i,j) = naff(T(3,1:256)');
            %Qy1(i,j) = naff(T(3,257:512)');
            Qx0(i,j) = naff(T(1,1:64)');
            Qx1(i,j) = naff(T(1,65:128)');
            Qy0(i,j) = naff(T(3,1:64)');
            Qy1(i,j) = naff(T(3,65:128)');            
            D(i,j) = log( abs(Qx1(i,j)-Qx0(i,j))+abs(Qy1(i,j)-Qy0(i,j)) );
            if D(i,j) < -15
                D(i,j) = -15;
            end
        else
            D(i,j) = NaN;
        end
        fprintf([num2str(i),'|',num2str(j),'\n'])
    end
end

%save('fmap1t2_nooct.mat','Qx0','Qx1','Qy0','Qy1','D','N','xamp','yamp')

%% recalculate diffusion

D = repmat([NaN],N,M);
for i = 1:N
    for j = 1:M
        if Qx0(i,j) ~= 0 && Qy0(i,j) ~= 0
            D(i,j) = log (sqrt( (Qx1(i,j)-Qx0(i,j))^2+(Qy1(i,j)-Qy0(i,j))^2 ));
            if D(i,j) < -7
                D(i,j) = -7;
            end
        end
    end
end
%% Plot

figure('Units','pixels','Position',[100,100,800,300]);  subplot(1,2,1);
%pcolor(xamp(1:2:end)*1e3,yamp(1:2:end)*1e3,D(1:2:end,1:2:end)); colormap(jet); caxis([-20,-5]); shading interp;
pcolor(xamp*1e3,yamp*1e3,D); colormap(jet); shading interp; %caxis([-20,-5]);
xlabel('X amplitude (mm)'); ylabel('Y amplitude (mm)'); title('Dynamic Aperture Map');
caxis([-7,-2])
subplot(1,2,2);
%figure('Units','pixels','Position',[100,100,350,300]);
plot_tunespace(1:4,[1,1,1,1],[7,7]);
scatter(7+Qx0(:),7+Qy0(:),5,D(:),'filled'); colormap(jet); %caxis([-20,-5]);
%xlim([0.25,0.5]); ylim([0.25,0.5]);
%xlim([0.0,0.25]); ylim([0.0,0.25]);
xlim([6.99,7.26]); ylim([6.99,7.26]);
xlabel('Q_x'); ylabel('Q_y'); title('Frequency Map');
%print(gcf,'-dpdf', '-r0', 'fmap2.pdf')
caxis([-7,-2])

set(gcf,'Units','Inches');
pos = get(gcf,'Position');
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
%print(gcf,'fmap1','-dpng','-r0')

