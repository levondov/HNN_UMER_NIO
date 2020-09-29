function [pos_vals] = getBPM(turn1)
% Returns the closed orbit position at all 18 bpm loations
%
% INPUT:
%   turn1 - which turn to grab bpm data. If left blank we grab closed orbit position
%
% OUTPUT:
%   pos_vals [x,y] values at bpm loation
%
% Written by Levon D.
% April 2019
%
% NOTES
%
%
if nargin < 1
    turn1 = -1;
end

global THERING
ao=getao;

if turn1 == -1
    T = findorbit4(THERING,0,1:length(THERING)+1);
else
    T = linepass(THERING,[0,0,0,0,0,0]',1:length(THERING));
end

% grab raw values
x_vals = T(1,getfamily('BPM',THERING));
y_vals = T(3,getfamily('BPM',THERING));

% apply correction
x_vals1 = x_vals'.*ao.BPM.Gains(:,1) + y_vals'.*ao.BPM.Rolls(:,1);
y_vals1 = y_vals'.*ao.BPM.Gains(:,2) + x_vals'.*ao.BPM.Rolls(:,2);
pos_vals = [x_vals1,y_vals1];


end