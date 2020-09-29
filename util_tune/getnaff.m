function [tunes,stats] = getnaff(bpms,turns,startidx,window)
% Calculate the tune using the four turn formula.
%
% INPUT:
%   1. bpms - a bpmObject from 'get_bpm' or cell array of bpm objects from
%   'get_bpms'
%   2. turns - number of turns to run naff with.
%       default: 32
%   2. startidx - index of the starting turn to use. e.g. startidx at 5
%   will run 5:37 turns
%       default: 1
%
% OUTPUT:
%   1. tunes - a Nx2 array of tune values. [tunex,tuney]
%   2. stats - struct object containing stats for tunex and tuney
%       mean_tunex - Final Mean Horiz Tune
%       std_tunex - Final Std Deviation Horiz Tune
%       mean_tuney - Final Mean Vert Tune
%       std_tuney - Final Std Deviation Vert Tune
%
% NOTES
%
%
if nargin < 2
    turns = 32;
end
if nargin < 3
    startidx = 1;
end
if nargin < 4
    window = [0.05,0.5];
end

N = length(bpms);
stats = zeros(4,1);

if iscell(bpms)
    tunes = zeros(N,2);
    for i = 1:N
        try
            tunes(i,1) = naff(bpms{i}.X(startidx:startidx+turns-1),window);
            tunes(i,2) = naff(bpms{i}.Y(startidx:startidx+turns-1),window);
        catch
            warning('Not enough turns in your bpm data to run naff.');
        end
    end
else
    tunes = zeros(1,2);
    try
        tunes(1,1) = naff(bpms.X(startidx:startidx+turns-1),window);
        tunes(1,2) = naff(bpms.Y(startidx:startidx+turns-1),window);
    catch
        warning('Not enough turns in your bpm data to run naff.');
    end
end

stats(1:2) = mean(tunes)';
stats(3:4) = std(tunes)';