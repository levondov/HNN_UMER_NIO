function [T] = plotC(plotFlag)

if nargin < 1
    plotFlag = 1;
end

umerlat;
[O] = findorbit(THERING(1:17),0);
numturns=1;
T = linepass(repmat(THERING,1,numturns),[O;0;0],1:length(THERING)*numturns+1);
idx = getfamily('BPM',THERING);

if plotFlag
    figure; 
    subplot(2,1,1);
    plot(T(1,:),'.-'); hold on;
    plot(idx,T(1,idx),'ro');
    subplot(2,1,2);
    plot(T(3,:),'.-'); hold on;
    plot(idx,T(3,idx),'ro'); ylim([-0.01,0.01]);
end


end

