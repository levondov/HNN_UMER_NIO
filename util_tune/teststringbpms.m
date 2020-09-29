

figure;
turns = 32*2;
for i = 1:M
    for j = 1:N
        data = stringbpms(bpmss{i,j},[3,2],32);
        [fx,fy,fx1,fy1,fx2,fy2] = calctune(data(1:turns,1),data(1:turns,2));
        subplot(2,1,1); hold on;
        plot(linspace(0,1,turns),fx2);
        subplot(2,1,2); hold on;
        plot(linspace(0,1,turns),fy2);
    end
end
%%
figure;
turns = 64;
for i = 1:M
    for j = 10
        [fx,fy,fx1,fy1,fx2,fy2] = calctune(bpmss{i,j}{3}.X(1:turns),bpmss{i,j}{3}.Y(1:turns));
        subplot(1,2,1); hold on;
        plot(linspace(0,1,turns),fx2);
        subplot(1,2,2); hold on;
        plot(linspace(0,1,turns),fy2);
    end
end

%% no stringing

tuneMM = tune;
figure; plot_tunespace(1:3);
for i = 10:M
    for j = 1:N
        scatter(tuneMM{i,j}(3:8,1),tuneMM{i,j}(3:8,2),5,'k','filled'); hold on;
    end
end

%% stringing
tuneMMM = cell(M,N);
for i = 1:M
    for j = 1:N
        kN = 4;
        tmp = zeros(kN,2);
        for kk=1:kN
            data = stringbpms(bpmss{i,j},[3,kk],32);
            qx=naff(data(1:32*3,1),[0.02,0.32])*3;
            qy=naff(data(1:32*3,2),[0.02,0.3])*3;
            if qx < 0.5
                qx=1-qx;
            end
            if qy < 0.5
                qy = 1-qy;
            end
            tmp(kk,:) = [qx,qy];
        end
        tuneMMM{i,j} = tmp;
    end
end
%% stringing plot
tuneMM = tuneMMM;
figure; plot_tunespace(1:3);
closs = 20;
for i = 10:M
    for j = 1:N
        %scatter(tuneMM{i,j}(:,1),tuneMM{i,j}(:,2),'k.'); hold on;
        scatter(tuneMM{i,j}(:,1),tuneMM{i,j}(:,2),10,repmat(wcms{i,j}(closs_turn)/wcms{i,j}(1),length(tuneMM{i,j}(:,1)),1),'filled')
    end
end

colormap(flipud(jet));
colorbar; caxis([0.45,0.67])