function r = BCH(x,y,n)
% function r = BCH(p,q,n)
% Return Baker-Campbell-Hausdorff Theorem of p and q up to n-PB.
% Note: 0 <= n <= 7
%-------------------------------------------------------------------------------
% Author: Chang, Ho-Ping (also known as Peace Chang)
%  National Synchrotron Radiation Research Center
%  101 Hsin-Ann Road, Hsinchu Science-Based Industrial Park
%  Hsinchu 30077, Taiwan
%  E-mail: peace@nsrrc.org.tw
%-------------------------------------------------------------------------------
% Created Date: 06-May-2002
% Last Updated Date: 03-Jun-2003
% Source Files: TPSA/@TPS/BCH.m
%-------------------------------------------------------------------------------
% Terminology and Category:
%  Truncated Power Series Algebra (TPSA)
%  One-Step Index Pointer (OSIP)
%  Truncated Power Series (TPS)
%-------------------------------------------------------------------------------
% Description:
%  In MATLAB, the index of array works FORTRAN-like.
%  Overloading Arithmetic Operators for TPS.
%  Baker-Campbell-Hausdorff Theorem
%  log(exp(x)exp(y)) =
%  x+y-[x,y]/2+[x,[x,y]]/12+[[x,y],y]/12-[x,[[x,y],y]]/24
%  .....
%  BCH(p,q) =>  exp(:p:)exp(:q:) = exp(:r:)
%  r = p+q+[p,q]/2+[p,[p,q]]/12+[q,[q,p]]/12+...
%------------------------------------------------------------------------------
global OSIP

if (n < 0) | (n > 7)
   error('Applying BCH theorem up to n-PB where 0 <= n <= 7 is required.')
end
% 0PB
r = x+y;
if n > 0
% 1PB (Note: [y,x] = -[x,y] and [x,x] = [y,y] = 0)
% (-1/2)*[x,y]
% Define pb1 = [x,y]
pb1 = PoissonBracket(x,y);
r = r+pb1*0.5;
end
if n > 1
% 2PB
% (1/12)*[x,[x,y]]
% Define pb2x = [x,[x,y]] = [x,pb1]
pb2x = PoissonBracket(x,pb1);
% (1/12)*[[x,y],y]
% Define pb2y = [[x,y],y] = [pb1,y]
pb2y = PoissonBracket(pb1,y);
r = r+(pb2x+pb2y)/12;
end
if n > 2
% 3PB
% (-1/24)*[x,[[x,y],y]]
% Define pb3 = [x,[[x,y],y]] = [x,pb2y]
pb3 = PoissonBracket(x,pb2y);
r = r-pb3/24;
% [x,[x,[x,y]]] for 4PB
% Define pb3x = [x,[x,[x,y]]] = [x,pb2x]
pb3x = PoissonBracket(x,pb2x);
% [[[x,y],y],y] for 4PB
% Define pb3y = [[[x,y],y],y] = [pb2y,y]
pb3y = PoissonBracket(pb2y,y);
end
if n > 3
% 4PB
% (-1/720)*[x,[x,[x,[x,y]]]]
% Define pb4xx = [x,[x,[x,[x,y]]]] = [x,pb3x]
pb4xx = PoissonBracket(x,pb3x);
% (1/180)*[x,[x,[[x,y],y]]]
% Define pb4 = [x,[x,[[x,y],y]]] = [x,pb3]
pb4 = PoissonBracket(x,pb3);
% (1/180)*[x,[[[x,y],y],y]]
% Define pb4xy = [x,[[[x,y],y],y]] = [x,pb3y]
pb4xy = PoissonBracket(x,pb3y);
r = r-pb4xx/720+(pb4+pb4xy)/180;
% (1/120)*[[x,y],[[x,y],y]]
% Define pb4y = [[x,y],[[x,y],y]] = [pb1,pb2y]
pb4y = PoissonBracket(pb1,pb2y);
% (1/360)*[[x,[x,y]],[x,y]]
% Define pb4x = -[[x,[x,y]],[x,y]] = [pb1,pb2x]
pb4x = PoissonBracket(pb1,pb2x);
% (-1/720)*[[[[x,y],y],y],y]
% Define pb4yy = [[[[x,y],y],y],y] = [pb3y,y]
pb4yy = PoissonBracket(pb3y,y);
r = r-(pb4xx+pb4yy)/720+(pb4-pb4xy)/180+pb4y/120-pb4x/360;
end
if n > 4
% 5PB
% (1/1440)*[x,[x,[x,[[x,y],y]]]]
% Define pb5 = [x,[x,[x,[[x,y],y]]]] = [x,pb4]
pb54 =  PoissonBracket(x,pb4);
%  (-1/360)*[x,[x,[[[x,y],y],y]]]
% Define pb5xy = [x,[x,[[[x,y],y],y]]] = [x,pb4xy]
pb54xy = PoissonBracket(x,pb4xy);
% (-1/240)*[x,[[x,y],[[x,y],y]]]
% Define pb5y = [x,[[x,y],[[x,y],y]]] = [x,pb4y]
pb54y = PoissonBracket(x,pb4y);
% (-1/720)*[x,[[x,[x,y]],[x,y]]]
% Define pb5x = -[x,[[x,[x,y]],[x,y]]] = [x,pb4x]
pb54x = PoissonBracket(x,pb4x);
% (1/1440)*[x,[[[[x,y],y],y],y]]
% Define pb5yy = [x,[[[[x,y],y],y],y]] = [x,pb4yy]
pb54yy = PoissonBracket(x,pb4yy);
r = r+(pb5+pb5yy)/1440-pb5xy/360-pb5y/240+pb5x/720;
% [x,[x,[x,[x,[x,y]]]]] for 6PB
% Define pb54xx = [x,[x,[x,[x,[x,y]]]]] = [x,pb4xx]
pb54xx = PoissonBracket(x,pb4xx);
% [[x,y],[[[x,y],y],y]] for 6PB
% Define pb513y = [[x,y],[[[x,y],y],y]] = [pb1,pb3y]
pb513y = PoissonBracket(pb1,pb3y);
% [[x,[[x,y],y]],[x,y]] for 6PB
% Define pb531 = [pb3,pb1] (= -pb513)
pb531 = PoissonBracket(pb3,pb1);
% [[x,y],[x,[x,[x,y]]]] for 6PB
% Define pb513x = [[x,y],[x,[x,[x,y]]]] = [pb1,pb3x]
pb513x = PoissonBracket(pb1,pb3x);
% [[[[[x,y],y],y],y],y] for 6PB
% Define pb5yy = [[[[[x,y],y],y],y],y] = [pb4yy,y]
pb5yy =  PoissonBracket(pb4yy,y);
end
if n > 5
% 6PB
% (1/30240)*[x,[x,[x,[x,[x,[x,y]]]]]]
% Define pb654xx = [x,[x,[x,[x,[x,[x,y]]]]]] = [x,pb5xx]
pb654xx = PoissonBracket(x,pb54xx);
% (-1/5040)*[x,[x,[x,[x,[[x,y],y]]]]]
% Define pb654 = [x,[x,[x,[x,[[x,y],y]]]]] = [x,pb54]
pb654 = PoissonBracket(x,pb54);
% (1/3780)*[x,[x,[x,[[[x,y],y],y]]]]
% Define pb654xy = [x,[x,[x,[[[x,y],y],y]]]] = [x,pb54xy]
pb654xy = PoissonBracket(x,pb54xy);
r = r+pb654xx/30240-pb654/5040+pb654xy/3780;
% (1/1680)*[x,[x,[[x,y],[[x,y],y]]]]
% Define pb654y = [x,[x,[[x,y],[[x,y],y]]]] = [x,pb54y]
pb654y = PoissonBracket(x,pb54y);
% (1/10080)*[x,[x,[[x,[x,y]],[x,y]]]]
% Define pb654x = - [x,[x,[[x,[x,y]],[x,y]]]] = [x,pb54x]
pb654x = PoissonBracket(x,pb54x);
% (1/3780)*[x,[x,[[[[x,y],y],y],y]]]
% Define pb654yy = [x,[x,[[[[x,y],y],y],y]]] = [x,pb54yy]
pb654yy = PoissonBracket(x,pb54yy);
% (1/15120)*[x,[[x,y],[[[x,y],y],y]]]
% Define pb6513y = [x,[[x,y],[[[x,y],y],y]]] = [x,pb513y]
pb6513y = PoissonBracket(x,pb513y);
r = r+pb654y/1680+pb654x/10080+pb654yy/3780+pb6513y/15120;
% (1/1260)*[x,[[x,[[x,y],y]],[x,y]]]
% Define pb6531 = [x,[[x,[[x,y],y]],[x,y]]] = [x,pb531]
pb6531 = PoissonBracket(x,pb531);
% (-1/5040)*[x,[[[[[x,y],y],y],y],y]]
% Define pb65yy = [x,[[[[[x,y],y],y],y],y]] = [x,pb5yy]
pb65yy = PoissonBracket(x,pb5yy);
% (1/1260)*[[x,y],[[x,y],[[x,y],y]]]
% Define pb614y = [[x,y],[[x,y],[[x,y],y]]] = [pb1,pb4y]
pb614y = PoissonBracket(pb1,pb4y);
% (-1/2016)*[[x,y],[[[[x,y],y],y],y]]
% Define pb614yy = [[x,y],[[[[x,y],y],y],y]] = [pb1,pb4yy]
pb614yy = PoissonBracket(pb1,pb4yy);
r = r+pb6531/1260-pb65yy/5040+pb614y/1260-pb614yy/2016;
% (1/2016)*[[x,[x,y]],[x,[[x,y],y]]]
% Define pb62x3 = [[x,[x,y]],[x,[[x,y],y]]] = [pb2x,pb3]
pb62x3 = PoissonBracket(pb2x,pb3);
% (-1/5040)*[[[x,y],y],[[[x,y],y],y]]
% Define pb62y3y = [[[x,y],y],[[[x,y],y],y]] = [pb2y,pb3y]
pb62y3y = PoissonBracket(pb2y,pb3y);
% (1/10080)*[[x,[x,[x,y]]],[x,[x,y]]]
% Define pb63x2x = [[x,[x,[x,y]]],[x,[x,y]]] =[pb3x,pb2x]
pb63x2x = PoissonBracket(pb3x,pb2x);
% (1/10080)*[[x,[[x,y],y]],[[x,y],y]]
% Define pb632y = [[x,[[x,y],y]],[[x,y],y]] = [pb3,pb2y]
pb632y = PoissonBracket(pb3,pb2y);
r = r+pb62x3/2016-pb62y3y/5040+(pb63x2x+pb632y)/10080;
% (-1/1512)*[[x,[[[x,y],y],y]],[x,y]]
% Define pb64xy1 = [[x,[[[x,y],y],y]],[x,y]] = [pb4xy,pb1]
pb64xy1 = PoissonBracket(pb4xy,pb1);
% (-1/5040)*[[[x,[x,y]],[x,y]],[x,y]]
% Define pb64x1 = -[[[x,[x,y]],[x,y]],[x,y]] = [pb4x,pb1]
pb64x1 = PoissonBracket(pb4x,pb1);
% (1/30240)*[[[[[[x,y],y],y],y],y],y]
% Define pb6yy = [[[[[[x,y],y],y],y],y],y] = [pb5yy,y]
pb6yy = PoissonBracket(pb5yy,y);
r = r-pb64xy1/1512+pb64x1/5040+pb6yy/30240;
end
clear pb54 pb54xy pb54y pb54x pb54yy pb54xx pb513y pb531 pb513x pb5yy
if n > 6
% 7PB
% (-1/60480)*[x,[x,[x,[x,[x,[[x,y],y]]]]]]
% Define pb7654 = [x,[x,[x,[x,[x,[[x,y],y]]]]]] = [x,pb654]
pb7654 = PoissonBracket(x,pb654);
% (1/10080)*[x,[x,[x,[x,[[[x,y],y],y]]]]]
% Define pb7654xy = [x,[x,[x,[x,[[[x,y],y],y]]]]] = [x,pb654xy]
pb7654xy = PoissonBracket(x,pb654xy);
% (1/20160)*[x,[x,[x,[[x,y],[[x,y],y]]]]]
% Define pb7654y = [x,[x,[x,[[x,y],[[x,y],y]]]]] = [x,pb654y]
pb7654y = PoissonBracket(x,pb654y);
% (1/15120)*[x,[x,[x,[[x,[x,y]],[x,y]]]]]
% Define pb7654x = [x,[x,[x,[[x,[x,y]],[x,y]]]]] = [x,pb654x]
pb7654x = PoissonBracket(x,pb654x);
r = r-pb7654/60480+pb7654xy/10080+pb7654y/20160+pb7654x/15120;
% (-23/120960)*[x,[x,[x,[[[[x,y],y],y],y]]]]
% Define pb7654yy = [x,[x,[x,[[[[x,y],y],y],y]]]] = [x,pb654yy]
pb7654yy = PoissonBracket(x,pb654yy);
% (-13/30240)*[x,[x,[[x,y],[[[x,y],y],y]]]]
% Define pb76513y = [x,[x,[[x,y],[[[x,y],y],y]]]] = [x,pb6513y]
pb76513y = PoissonBracket(x,pb6513y);
% (-1/2520)*[x,[x,[[x,[[x,y],y]],[x,y]]]]
% Define pb76531 = [x,[x,[[x,[[x,y],y]],[x,y]]]] = [x,pb6531]
pb76531 = PoissonBracket(x,pb6531);
% (1/10080)*[x,[x,[[[[[x,y],y],y],y],y]]]
% Define pb765yy = [x,[x,[[[[[x,y],y],y],y],y]]] = [x,pb65yy]
pb765yy = PoissonBracket(x,pb65yy);
r = r-pb7654yy*(23/120960)-pb76513y*(13/30240)
% (-1/2520)*[x,[[x,y],[[x,y],[[x,y],y]]]]
% Define pb7614y = [x,[[x,y],[[x,y],[[x,y],y]]]] = [x,pb614y]
pb7614y = PoissonBracket(x,pb614y);
% (1/4032)*[x,[[x,y],[[[[x,y],y],y],y]]]
% Define pb7614yy = [x,[[x,y],[[[[x,y],y],y],y]]] = [x,pb614yy]
pb7614yy = PoissonBracket(x,pb614yy);
% (-1/4032)*[x,[[x,[x,y]],[x,[[x,y],y]]]]
% Define pb762x3 = [x,[[x,[x,y]],[x,[[x,y],y]]]] = [x,pb62x3]
pb762x3 = PoissonBracket(x,pb62x3);
% (1/10080)*[x,[[[x,y],y],[[[x,y],y],y]]]
% Define pb762y3y = [x,[[[x,y],y],[[[x,y],y],y]]] = [x,pb62y3y]
pb762y3y = PoissonBracket(x,pb62y3y);
r = r-pb7614y/2520+(pb7614yy-pb762x3)/4032+pb762y3y/10080;
% (-1/20160)*[x,[[x,[x,[x,y]]],[x,[x,y]]]]
% Define pb763x2x = [x,[[x,[x,[x,y]]],[x,[x,y]]]] = [x,pb63x2x]
pb763x2x = PoissonBracket(x,pb63x2x);
% (-1/20160)*[x,[[x,[[x,y],y]],[[x,y],y]]]
% Define pb7632y = [x,[[x,[[x,y],y]],[[x,y],y]]] = [x,pb632y]
pb7632y = PoissonBracket(x,pb632y);
% (1/3024)*[x,[[x,[[[x,y],y],y]],[x,y]]]
% Define pb764xy1 = [x,[[x,[[[x,y],y],y]],[x,y]]] = [x,pb64xy1]
pb764xy1 = PoissonBracket(x,pb64xy1);
r = r-(pb763x2x+pb7632y)/20160+pb764xy1/3024;
% (1/10080)*[x,[[[x,[x,y]],[x,y]],[x,y]]]
% Define pb764x1 = -[x,[[[x,[x,y]],[x,y]],[x,y]]] = [x,pb64x1]
pb764x1 = PoissonBracket(x,pb64x1);
% (-1/60480)*[x,[[[[[[x,y],y],y],y],y],y]]
% Define pb76yy = [x,[[[[[[x,y],y],y],y],y],y]] = [x,pb6yy]
pb76yy = PoissonBracket(x,pb6yy);
r = r+pb764x1/10080-pb76yy/60480;
end
if n > 7
% 8PB
% 9PB
disp('Available BCH theorem is developed up to 7-PB.')
end