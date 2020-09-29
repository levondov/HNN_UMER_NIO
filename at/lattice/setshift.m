function setshift(ELEMINDEX, DX, DY)
%SETSHIFT sets the misalignment vectors T1, T2 for elements
%
% SETSHIFT(ELEMINDEX, DX, DY) sets the entrance and exit misalignment vectors
%  of one element or a group of elements in the globally defined lattice THERING.
%  
%  DX, DY are displacements of the ELEMENT 
%  so the coordinate transformation on the particle at entrance is
%	X  ->  X-DX
%   Y  ->  Y-DY
%  The elements to be modified are given by ELEMINDEX  
%	Previous stored values are overwritten. 
%
% See also SETSHIFT
 
global THERING
numelems = length(ELEMINDEX);

% Remove NaN's
ELEMINDEX(isnan(ELEMINDEX)) = [];

% Match length
if (length(DX))==1
    DX = ones(size(ELEMINDEX)) * DX;
end
if (length(DY))==1
    DY = ones(size(ELEMINDEX)) * DY;
end

if (numelems ~= length(DX)) || (numelems ~= length(DY))
   error('ELEMINDEX, DX, and DY must have the same number of elements');
end

V = zeros(1,6);
for i = 1:length(ELEMINDEX)
   V(1) = -DX(i);
   V(3) = -DY(i);
   THERING{ELEMINDEX(i)}.T1 =  V;
   THERING{ELEMINDEX(i)}.T2 = -V;
end

   
