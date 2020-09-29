function [Bx,By] = getearthfield()
% Returns the latest Earth's field data measurements
%   Latest: Dave Stutter data 2018
%
% Output: (36x1 arrays)
%   Bx - horizontal earth field data
%	By - vertical earth field data
%
% e.g. (format):
%   magnet | Bx | By
%   ----------------
%   PD  | val | val
%   D1  | val | val
%   D2  | val | val
%   ...
%   ...
%   D34 | val | val
%   D35 | val | val
%
%
% Written by Levon Sep 2018
%
% Notes
%
global efield_data

if isempty(efield_data)
    data = csvread('earth_field_data_2018.csv',1,1); % skip header row/col 1
    efield_data = data;
else
    data = efield_data;
end
% turn milliGauss to Tesla
Bx = data(:,2)*1e-3*1e-4;
By = data(:,4)*1e-3*1e-4;
