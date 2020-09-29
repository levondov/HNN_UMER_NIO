function fig = plotT(T)
%
% plots the output of linepass,ringpass
%

figure('Units','pixels','Position',[500,100,400,700]);
%global yqc

subplot(411);
plot(T(1,:),'b');  ylabel('X position'); title('X position');
subplot(412);
plot(T(3,:),'r'); ylabel('Y position'); title('Y position');
subplot(413);
plot(T(1,:),T(2,:),'b.'); ylabel('Xp'); xlabel('X'); title('X phase space');
subplot(414);
plot(T(3,:),T(4,:),'r.'); ylabel('Yp'); xlabel('Y'); title('Y phase space');