function flag = setpath()
% Setup controls system directories
%
%
%

% add everything in UMER_CONTROL_2016 to matlab path
UMER_ROOT = fileparts(mfilename('fullpath'));
addpath(genpath(UMER_ROOT),'-begin');

end