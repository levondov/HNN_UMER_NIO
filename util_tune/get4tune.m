function [tunex,tuney,stats] = get4tune(bpm,turnidx)
% Calculate the tune using the four turn formula.
%
% INPUT:
%   1. bpm - a bpmObject from 'get_bpm' or cell array of bpm objects from
%   'get_bpms'
%   2. turnidx - range of turns to apply four turn, e.g. 1:4 , 5:8
%       default: 1:4
%
% OUTPUT:
%   1. tunex - horizontal tune
%   2. tuney - vertical tune
%   3. stats - struct object containing stats for tunex and tuney
%       mean_tunex - Final Mean Horiz Tune
%       std_tunex - Final Std Deviation Horiz Tune
%       mean_tuney - Final Mean Vert Tune
%       std_tuney - Final Std Deviation Vert Tune
%
% NOTES
%
%

if nargin < 2
    turnidx = 1:4;
end

N = length(bpm);

tunex = zeros(N,1);
tuney = zeros(N,1);
stats = struct();


try
    if iscell(bpm)
        for i = 1:N
            x = bpm{i}.X(turnidx);
            y = bpm{i}.Y(turnidx);
            tunex(i) = (1/(2*pi))*acos((x(1)-x(2)+x(3)-x(4))/(2*(x(2)-x(3))));
            tuney(i) = 1/(2*pi)*acos((y(1)-y(2)+y(3)-y(4))/(2*(y(2)-y(3))));
        end
    else
        x = bpm.X(turnidx);
        y = bpm.Y(turnidx);
        tunex(1) = 1/(2*pi)*acos((x(1)-x(2)+x(3)-x(4))/(2*(x(2)-x(3))));
        tuney(1) = 1/(2*pi)*acos((y(1)-y(2)+y(3)-y(4))/(2*(y(2)-y(3))));
    end
    
    % check for imaginary values
    for i = 1:length(tunex)
        if ~isreal(tunex(i))
            tunex(i) = 0;
        end
        if ~isreal(tuney(i))
            tuney(i) = 0;
        end
    end
catch
    warning('Something is wrong with your bpm. Make sure you have 4 turns of data measured')
end

% calculate stats
tunex_real = tunex(tunex~=0);
tuney_real = tuney(tuney~=0);

tunex_mean = mean(tunex_real);
tuney_mean = mean(tuney_real);
tunex_std = std(tunex_real);
tuney_std = std(tuney_real);

tunex_real = tunex_real(tunex_real <= tunex_mean+tunex_std);
tunex_real = tunex_real(tunex_real >= tunex_mean-tunex_std);
tuney_real = tuney_real(tuney_real <= tuney_mean+tuney_std);
tuney_real = tuney_real(tuney_real >= tuney_mean-tuney_std);

stats.tunex_mean = mean(tunex_real);
stats.tunex_std = std(tunex_real);
stats.tuney_mean = mean(tuney_real);
stats.tuney_std = std(tuney_real);



end