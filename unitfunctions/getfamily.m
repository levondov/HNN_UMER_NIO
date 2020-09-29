function family_loc = getfamily(fam,ring)
%
% INPUT:
%   1. fam - a string or cell array of the family name(s)
%   2. ring - temporary field for a given ring
% OUTPUT:
%   1. family_loc - an array containing index locations to magnet objects with
%   same family name
%
%
%
% Created 27 Nov 2016
% Levon D.
%
%


% grab the ring
if nargin < 2
    global thering
    flag = 0;
else
    thering = ring;
    flag = 1;
end
N = length(thering);

if nargin < 1
    % if no input given
    family_loc = 1:N;
    return;
end

family_loc = [];

for i = 1:N
    if flag
        try
            if strcmp(fam,thering{i}.FamName)
                family_loc = [family_loc i];
            end
        catch
            if strcmp(fam,thering{i}.Family)
                family_loc = [family_loc i];
            end
        end
    else
        try
            if strcmp(fam,thering{i}.Family)
                family_loc = [family_loc i];
            end
        catch
            if strcmp(fam,thering{i}.Family)
                family_loc = [family_loc i];
            end
        end
    end
end

end