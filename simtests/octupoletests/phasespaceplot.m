ao=getao;
N=15;
Occc = [0.0,0.1,0.2,0.3];
dataX = zeros(N*N*256,length(Occc));
dataXP = zeros(N*N*256,length(Occc));
dataXn = dataX;
dataXPn = dataX;

for j = 1:length(Occc)
    ao.O.SetPoints(:) = Occc(j); setao(ao);
    umerlat_oct
    x0 = linspace(-10e-3,10e-3,N);
    p0 = linspace(-0.01745*2,0.01745*2,N);
    c = 1:length(x0)*length(p0);
    tmpx = []; tmpxn = [];
    tmpxp = []; tmpxpn = [];
    for i=1:length(x0)
        for k=1:length(p0)
            T = ringpass(THERING,[x0(i),p0(k),0,0,0,0]',256);
            if sum(sum(isnan(T)))
                tmpxn = cat(1,tmpxn,T(1,:)');
                tmpxpn = cat(1,tmpxpn,T(2,:)');
                
            else
                tmpx = cat(1,tmpx,T(1,:)');
                tmpxp = cat(1,tmpxp,T(2,:)');
            end        
        end   
        fprintf([num2str(i),'/',num2str(length(x0)),'\n']);    
    end
    dataX(1:length(tmpx),j) = tmpx;
    dataXP(1:length(tmpxp),j) = tmpxp;
    dataXn(1:length(tmpxn),j) = tmpxn;
    dataXPn(1:length(tmpxpn),j) = tmpxpn;    
    
    fprintf(['Frame ',num2str(j),'/',num2str(length(Occc)),'\n']);
end

%save('nl_0to100op.mat','dataX','dataXP')

%% Single phase space plot
umerinit_simple;
ao=getao; ao.O.SetPoints = [0,0,0,0,0,0,0];
ao.O.SetPoints(:) = 2; setao(ao);
umerlat_octi_ideal;
N=10;
x0 = linspace(-11e-3,-9e-3,N);
p0 = linspace(0.055,0.060,N);
c = 1:length(x0)*length(p0);

tmpx = []; tmpxn = [];
tmpxp = []; tmpxpn = [];
figure; hold on;
data = cell(length(x0),length(p0));
for i=1:length(x0)
    for k=1:length(p0)
        T = ringpass(THERING,[x0(i),p0(k),0,0,0,0]',512);
        if sum(sum(isnan(T)))
            tmpxn = cat(1,tmpxn,T(1,:)');
            tmpxpn = cat(1,tmpxpn,T(2,:)');
        else
            tmpx = cat(1,tmpx,T(1,:)');
            tmpxp = cat(1,tmpxp,T(2,:)');
            data{i,k} = [T(1,:)',T(2,:)'];
        end
        fprintf(['Frame ',num2str(i),'/',num2str(N),'\n']);
        if i==5 && k==5
            scatter(T(1,:)',T(2,:)',20,'r')
        else
           scatter(T(1,:)',T(2,:)',1,'k.') 
        end
    end   
end
dataX = tmpx;
dataXP = tmpxp;

%figure; scatter(dataX,dataXP,1,'k.')
%hold on; scatter(tmpxn,tmpxpn,1,'r.')
xlim([-25e-3,25e-3]); ylim([-0.01745*5,0.01745*5]);
%save('nl_0to100op.mat','dataX','dataXP')
%% live plot 1
figure;
i=1;
sp=1;
N = 11;
xr = [-0.05,0.05];
yr = [-0.01745,0.01745].*10;
while i <= N
    subplot(1,2,1);
    scatter(dataX(:,i),dataXP(:,i),1,'k.')
    title(['OCTUPOLE STRENGTH ',num2str(Occc(i))]);    
    xlim(xr);
    ylim(yr);
    subplot(1,2,2);
    scatter(dataX1(:,i),dataXP1(:,i),1,'k.')
    title(['OCTUPOLE STRENGTH ',num2str(Occc(i))]);    
    xlim(xr);
    ylim(yr);    
    k = waitforbuttonpress;
    % 28 leftarrow
    % 29 rightarrow
    % 30 uparrow
    % 31 downarrow
    value = double(get(gcf,'CurrentCharacter'));
    if value == 28
        i = i-sp;
    elseif value == 29
        i = i+sp;
    elseif value == 30
        i = 1;
    elseif value == 31
        i = N;
    else
        i=i+1;
    end
    
    if i < 1
        i = 1;
    end
    if i > N
        i = N;
    end
end

%% live plot 2
figure; hold on;
i=1;
sp=1;
N = 11;
%xr = [-25e-3,25e-3];
%yr = [-0.01745,0.01745].*5;
xr = [-75e-3,75e-3];
yr = [-0.31745,0.31745];
while i <= N
    cla();
    scatter(dataX(:,i),dataXP(:,i),1,'k.'); hold on;
    scatter(dataXn(:,i),dataXPn(:,i),1,'r.')
    title(['OCTUPOLE STRENGTH ',num2str(Occc(i))]);    
    xlim(xr);
    ylim(yr); 
    k = waitforbuttonpress;
    % 28 leftarrow
    % 29 rightarrow
    % 30 uparrow
    % 31 downarrow
    value = double(get(gcf,'CurrentCharacter'));
    if value == 28
        i = i-sp;
    elseif value == 29
        i = i+sp;
    elseif value == 30
        i = 1;
    elseif value == 31
        i = N;
    else
        i=i+1;
    end
    
    if i < 1
        i = 1;
    end
    if i > N
        i = N;
    end
end


%colormap(jet); colorbar;
%%
p1=par1(4);
umerlat_main_1cell;

figure; hold on;
N = 20;
x0 = linspace(-100e-3,100e-3,N);
p0 = linspace(-0.5,0.5,N);

for i=1:length(x0)
    for k=1:length(p0)
        T = ringpass(THERING,[x0(i),p0(k),0,0,0,0]',128);
        if 0%sum(sum(isnan(T)))
            % nothing
        else            
        end
        fprintf([num2str(i),'\n']);
    end
end

%% Y vs X plots
% load a naff s can in
global p1
global p2
global THERING
figure; 
turns = 64;
turns1 = 64;
colors = linspace(1,turns,turns);
colors1 = linspace(1,turns1,turns1);
defocus_idx = 10;
bpmidx = 3;
i = 1;
while 1
    X = []; X1 = [];
    Y = []; Y1 = [];
    % exp
    for t = 1:turns
        for k = 1:length(bpmidx)
            X(end+1) = bpmss{i,defocus_idx}{bpmidx(k)}.X(t);
            Y(end+1) = bpmss{i,defocus_idx}{bpmidx(k)}.Y(t);
        end
    end
    ttunes = 1 - getnaff(bpmss{i,defocus_idx},64);
    % sim
    p1 = crF(i);
    p2 = crD(defocus_idx);
    umerlat_main_1cell;
    T = ringpass(THERING,[1e-3,0,1e-3,0,0,0]',turns1);
    X1 = T(1,:); ttunes_x = 1-naff(X1');
    Y1 = T(3,:); ttunes_y = 1-naff(Y1');
    %X2 = bpmss_warp{i,defocus_idx}{1}.X; ttunesW_x = 1-naff(X2);
    %Y2 = bpmss_warp{i,defocus_idx}{1}.Y; ttunesW_y = 1-naff(Y2);    
    
    subplot(2,3,1);
    scatter(X,Y,25,colors,'filled'); colorbar; 
    if i <= 7
        title(['Y vs X exp | Qx: ',num2str(1-ttunes(bpmidx(k),1)),' | ','Qy: ',num2str(ttunes(bpmidx(k),2))]);
    else
        title(['Y vs X exp | Qx: ',num2str(ttunes(bpmidx(k),1)),' | ','Qy: ',num2str(ttunes(bpmidx(k),2))]);        
    end
    xlim([-9,9]); ylim([-4,4]);
    subplot(2,3,2);
    scatter(X1,Y1,25,colors1,'filled'); colorbar;
    if i <= 7
        title(['Y vs X at | Qx: ',num2str(1-ttunes_x),' | ','Qy: ',num2str(ttunes_y)]);
    else
        title(['Y vs X at | Qx: ',num2str(ttunes_x),' | ','Qy: ',num2str(ttunes_y)]);        
    end
    xlim([-0.01,0.01]); ylim([-0.01,0.01]);
    subplot(2,3,3);
    %scatter(X2,Y2,25,colors1,'filled'); colorbar;
    %if i <= 7
    %    title(['Y vs X warp | Qx: ',num2str(1-ttunesW_x),' | ','Qy: ',num2str(ttunesW_y)]);
    %else
    %    title(['Y vs X warp | Qx: ',num2str(ttunesW_x),' | ','Qy: ',num2str(ttunesW_y)]);        
    %end
    xlim([-0.01,0.01]); ylim([-0.01,0.01]);    
    subplot(2,3,4); plot(X); title('X Exp'); ylim([-3,3]);
    subplot(2,3,5); plot(X1); title('X AT'); ylim([-3e-3,3e-3]);
    %subplot(2,3,6); plot(X2); title('X WARP'); ylim([-3e-3,3e-3]);
    k = waitforbuttonpress;
    
    % 28 leftarrow
    % 29 rightarrow
    % 30 uparrow
    % 31 downarrow
    value = double(get(gcf,'CurrentCharacter'));
    if value == 28
        i = i -1;
        if i == 0
            i=1;
        end
    elseif value == 29
        i = i + 1;
        if i == M+1
            i = M;
        end
    elseif value == 30
        i = 1;
    elseif value == 31
        i = M;
    end

end

%% One large image with 40 subplots

global p1
global p2
global THERING
figure; 
turns = 64;
turns1 = 64;
colors = linspace(1,turns,turns);
colors1 = linspace(1,turns1,turns1);
defocus_idx = 10;
bpmidx = 7;
fig1 = figure;
fig2 = figure;
row = 5;
col = 8;
for i = 1:M
    X = []; X1 = [];
    Y = []; Y1 = [];
    % exp
    for t = 1:turns
        for k = 1:length(bpmidx)
            X(end+1) = bpmss{i,defocus_idx}{bpmidx(k)}.X(t);
            Y(end+1) = bpmss{i,defocus_idx}{bpmidx(k)}.Y(t);
        end
    end
    ttunes = 1 - getnaff(bpmss{i,defocus_idx},64);
    % sim
    p1 = crF(i);
    p2 = crD(defocus_idx);
    umerlat_main_1cell;
    T = ringpass(THERING,[-1e-3,0,1e-3,0,0,0]',turns1);
    X1 = T(1,:); ttunes_x = 1-naff(X1');
    Y1 = T(3,:); ttunes_y = 1-naff(Y1');
    
    figure(fig1);
    subplot(row,col,i);
    scatter(X,Y,15,colors,'filled'); title(['Qx:',num2str(ttunes(bpmidx(k),1)),'|','Qy:',num2str(ttunes(bpmidx(k),2))]);
    %xlim([-4,9]); ylim([-4,4]);
    figure(fig2);
    subplot(row,col,i);
    scatter(X1,Y1,15,colors1,'filled'); title(['Qx: ',num2str(ttunes_x),'|','Qy: ',num2str(ttunes_y)]);
    %xlim([-0.15,0.05]); ylim([-0.1,0.1]);
    
    %subplot(2,2,3); plot(X); title('X'); ylim([-5,5]);
    %subplot(2,2,4); plot(X1); title('X');
    fprintf([num2str(i),'/',num2str(M),'\n'])

end


%% Load warp data
bpmss_warp = cell(M,N);
for i = 1:M
    for j = 1:N
        dt = dlmread([num2str(i),'T',num2str(j),'.txt'],' ');
        tmp.X = dt(:,1);
        tmp.Y = dt(:,2);
        bpmss_warp{i,j} = {tmp};
    end
end