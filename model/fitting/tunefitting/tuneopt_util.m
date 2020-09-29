function [qx,qy,p11,p22] = tuneopt_util()

global tune
par1 = linspace(1.7814,1.8560,50);
par2 = linspace(1.8060,1.8260,30);

qx = [];
qy = [];
p11 = [];
p22 = [];
x = [6, 10, 17, 25, 35, 40];
y = [1, 25, 25, 5, 25, 5];
for j = 1:length(x)
        tmp1 = tune{x(j),y(j)}(3,:);
        qx = [qx, 7-tmp1(1)];
        qy = [qy, 7-tmp1(2)];
        p11 = [p11,par1(x(j))];
        p22 = [p22,par2(y(j))];
end

end