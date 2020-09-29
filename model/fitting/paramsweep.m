N=25;
M=25;

p1 = linspace(0.5,1.5,N);
p2 = linspace(0.5,1.5,M);
bx = zeros(N,M);
by = zeros(N,M);


for i = 1:N
    for j = 1:M
        [bx(i,j),by(i,j)] = betagoal([p1(i),p2(j)],[0,0],1,10,'QF');
    end
    fprintf([num2str(i),'/',num2str(N),'\n'])
end


figure;
pcolor(p1,p2,real(bx)); colorbar;
figure;
pcolor(p1,p2,real(by)); colorbar;
