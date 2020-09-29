function z = octupole(name, fname, L, S, method)
%OCTUPOLE('FAMILYNAME', Length [m], S, 'METHOD')
%	Creates a new family in the FAMLIST - a structure with fields
%	FamName			family name
%	Length			length[m]
%	S					S-strngth of the octupole
%	NumIntSteps		Number of integration steps
%	MaxOrder
%	R1				6 x 6 rotation matrix at the entrance
%	R2            	6 x 6 rotation matrix at the entrance
%	T1				6 x 1 translation at entrance 
%	T2				6 x 1 translation at exit4
%	ElemData.PolynomA = [0 0 0 0];	 
%	ElemData.PolynomB = [0 0 0 S]; 
%	PassMethod      name of the function to use for tracking
%   Returns assigned address in the FAMLIST that is uniquely identifies the family

ElemData.Name = name;
ElemData.FamName = fname;  % add check for identical family names
ElemData.Length = L;
ElemData.MaxOrder = 5;
ElemData.NumIntSteps = 20;
ElemData.R1 = diag(ones(6,1));
ElemData.R2 = diag(ones(6,1));
ElemData.T1 = zeros(1,6);
ElemData.T2 = zeros(1,6);
ElemData.PolynomA= [0 0 0 0];	 
ElemData.PolynomB= [0 0 0 S]; 
ElemData.PassMethod=method;

global FAMLIST
z = length(FAMLIST)+1; % number of declare families including this one
FAMLIST{z}.FamName = fname;
FAMLIST{z}.NumKids = 0;
FAMLIST{z}.KidsList= [];
FAMLIST{z}.ElemData= ElemData;

