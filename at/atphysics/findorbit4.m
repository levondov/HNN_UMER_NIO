function orbit = findorbit4(RING,dP,varargin);
%FINDORBIT4 finds closed orbit in the 4-d transverse phase 
% space by numerically solving  for a fixed point of the one turn 
% map M calculated with LINEPASS 
%
%         (X, PX, Y, PY, dP2, CT2 ) = M (X, PX, Y, PY, dP1, CT1)
% 
%    under the CONSTANT MOMENTUM constraint, dP2 = dP1 = dP and 
%    there is NO constraint on the 6-th coordinate CT 
%
% IMPORTANT!!! FINDORBIT4 imposes a constraint on dP and relaxes
%    the constraint on the revolution frequency. A physical storage
%    ring does exactly the opposite: the momentum deviation of a
%    particle on the closed orbit settles at the value
%    such that the revolution is synchronous with the RF cavity 
%
%                 HarmNumber*Frev = Frf
%
%    To impose this artificial constraint in FINDORBIT4 
%    PassMethod used for any elemen SHOULD NOT 
%    1. change the longitudinal momentum dP (cavities , magnets with radiation)
%    2. have any time dependence (localized impedance, fast kickers etc)
% 
% FINDORBIT4(RING,dP) is 4x1 vector - fixed point at the 
%    entrance of the 1-st element of the RING (x,px,y,py)
%
% FINDORBIT4(RING,dP,REFPTS) is 4-by-Length(REFPTS)
%     array of column vectors - fixed points (x,px,y,py)
%     at the entrance of each element indexed  REFPTS array. 
%     REFPTS is an array of increasing indexes that  select elements 
%     from the range 1 to length(RING)+1. 
%     See further explanation of REFPTS in the 'help' for FINDSPOS  
%
% FINDORBIT4(RING,dP,REFPTS,GUESS) - same as above but the search
%     for the fixed point starts at the initial condition GUESS
%     Otherwise the search starts from [0 0 0 0 0 0]'.
%     GUESS must be a 6-by-1 vector;
%
% [ORBIT, FIXEDPOINT] = FINDORBIT4( ... )
%     The optional second return parameter is 
%     a 6-by-1 vector of initial conditions 
%     on the closed orbit at the entrance to the RING.
%
% See also FINDORBIT, FINDSYNCORBIT, FINDORBIT6.

if ~iscell(RING)
   error('First argument must be a cell array');
end

%d = sqrt(eps);	% step size for numerical differentiation
d = 1e-8;
D5 = d*eye(4);

max_iterations = 20;
J = zeros(4);

% Check if guess argument wass supplied
if nargin==4
    if isnumeric(varargin{2}) & all(eq(size(varargin{2}),[6,1]))
       Ri=varargin{2};
    else
       error('The last argument GUESS must be a 6-by-1 vector');
    end        
else
    Ri = zeros(6,1);
end
% Set the momentum component of Ri to the specified dP
Ri(5) = dP;

%Fist iteration
RMATi= Ri*ones(1,5);
for k = 1:4
    RMATi(k,k)=RMATi(k,k)+d;
end
RMATf = linepass(RING,RMATi);
Rf = RMATf(:,5);
% compute the transverse part of the Jacobian 
J4 =  [RMATf(1:4,1:4)-RMATf(1:4,5)*ones(1,4)]/d;
% Replace matrix inversion with \
% B4 = inv(eye(4) - J4);
% Ri_next = Ri +  [B4*(Rf(1:4)-Ri(1:4)); 0; 0];

Ri_next = Ri +  [(eye(4) - J4)\(Rf(1:4)-Ri(1:4)); 0; 0];

change = norm(Ri_next - Ri);
Ri = Ri_next;


itercount = 1;

while (change>eps) & (itercount < max_iterations)
    RMATi=[Ri Ri Ri Ri Ri];
    for k = 1:4
        RMATi(k,k)=RMATi(k,k)+d;
    end
    RMATf = linepass(RING,RMATi,'reuse');
    Rf = RMATf(:,5);
    
    % compute the transverse part of the Jacobian 
    J4 =  [RMATf(1:4,1:4)-RMATf(1:4,5)*ones(1,4)]/d;
% Replace matrix inversion with \
%     B4 = inv(eye(4) - J4);
%     Ri_next = Ri +  [B4*(Rf(1:4)-Ri(1:4)); 0; 0];
    
    Ri_next = Ri +  [(eye(4) - J4)\(Rf(1:4)-Ri(1:4)); 0; 0];
    change = norm(Ri_next - Ri);
    Ri = Ri_next;
    itercount = itercount+1;
end;

if(nargin<3) | (varargin{1}==(length(RING)+1))  
    % return only the fixed point at the entrance of RING{1}
   orbit=Ri(1:4,1);
else            % 3-rd input argument - vector of reference points along the RING
                % is supplied - return orbit            
   orb6 = linepass(RING,Ri,varargin{1},'reuse'); 
   orbit = orb6(1:4,:); 
end

if nargout==2
    varargout{1}=Ri;
end