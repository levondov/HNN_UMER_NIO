function current = calcqr1current(crt)

p1 = 0.03663;
p2 = -0.2052;
p3 = 0.3813;

f = p1*crt^2 + p2*crt + p3;

s1 = 273.9;
s2 = -108.2;
s3 = 14.23;

current = s1*f^2 + s2*f + s3;

end