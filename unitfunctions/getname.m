function [magnet,idx] = getname(name,ring)
%
% input:
%   name - a string of the magnet name or a cell of magnet names
% output:
%   magnet - a struct matching the magnet name. If no matching magnet found
%   then return a boolean false.
%   idx - index of the magnet location in thering
%
%
% Created 29 Nov 2016
% Levon D.
%


% grab the ring
if nargin < 2
    global thering
else
    thering = ring;
end
N = length(thering);

if nargin < 1
    % if no input given
    name = 'Q1';
    idx = 1;
end

magnet = {};
idx = [];

if iscell(name)
    for j = 1:length(name)
        for i = 1:N
            if sum(strcmpi(name{j},thering{i}.Name))
                magnet{end+1} = thering{i};
                idx(end+1) = i;
                break
            end
        end
    end
else
    for i = 1:N
        if sum(strcmpi(name,thering{i}.Name))
            magnet = thering{i};
            idx = i;
            break
        end
    end
end