function S = getspos()

global THERING

S = zeros(length(THERING)+1,1);

for i=2:length(S)
    S(i) = THERING{i-1}.Length + S(i-1);
end

end