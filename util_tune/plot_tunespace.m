function fig = plot_tunespace(order,lines,integers,colorFlag,linewidth_int,axis_FLAG)
% plot resonance diagram up to specified order
% mx + ny = k
% x = (k-ny)/m
% x = 1 where y = (k-m)/n
%
% -- New version by levon
%
% EXAMPLE:
%   plot_tunespace(1:3)
%   plot_tunespace(1:3,[0,0,1,1])
%   plot_tunespace(1:3,[1,1,0,0],[6,7])
%
% INPUT:
%  1. order - array of tune orders to plot. e.g. up to 3rd order, order=1:3
%  2. lines (optional) - a boolean of which resonance lines to plot. e.g. [vertical,horizontal,sum,diff]
%  3. integers (optional) - integer part of the tune to plot in x,y, default is [0,0]
%  4. colorFlag (optional) - flag to plot lines in different colors. default is 0
%       0 - each order is a different color
%       1 - all lines plotted as white
%       2 - all lines plotted as black
%  5. axis_FLAG (optional) - flag to zoom into integer range on plot. default is 1
%
% OUTPUT:
%  1. fig - figure handle
%
%
%fig = figure;

hold on;

if nargin < 2
    lines = [1,1,1,1]; % [vertical,horizontal,sum,diff]
end
if nargin < 3
    integers = [0,0];
end
if nargin < 4
    colorFlag = 0;
end
if nargin < 5
    linewidth_int = 1;
if nargin < 6
    axis_FLAG = 1;
end


% plotting options
linewidth = 1;
%linewidth_int = 2;
colors = {'b','r','g','r','m','y'}; % colors repeat after 6th order
if colorFlag == 1
    colors = {'w--','w--','w--'};
elseif colorFlag == 2
    colors = {'k.-','k.-','k.-'};
end
%colors = {'k--','k--','k--','k.-','k.-','k.-','k.-','k.-','k.-'};
colors = repmat(colors,1,3);
%colors = ['b','r','g',colors];

y_limits = [-2,2]; x_limits = [-2,2]; % the limits to plot +/- the integer parts.
p = linspace(0,20,21); % y offset, e.g. k/n. For higher order this should be larger
N = length(p);

for l = length(order):-1:1 % iterate over order number
    i = order(l); % pick the order
    m = linspace(-i,i,2*i+1); % m can be -order,order
    n1 = (i - abs(m)); % n can be n-m
    n2 = -(i - abs(m)); % n can also be -(n-m)
    
    for j = 1:length(m)
        % vert and horz lines
        if ((n1(j) == 0 && lines(1)) || (m(j) == 0 && lines(1)))
            if n1(j) == 0 && lines(1)
                % vert lines
                for k=1:N
                    if (integers(1)+p(k)/m(j) <= integers(1)+x_limits(2)) && (integers(1)-p(k)/m(j) <= integers(1)+x_limits(2))
                        plot(integers(1)+[p(k)/m(j),p(k)/m(j)],integers(2)+[y_limits(1),y_limits(2)],colors{l},'linewidth',linewidth_int);
                    end
                end
            end
            if m(j) == 0 && lines(2)
                % horz lines
                for k=1:N
                    if (integers(2)+p(k)/n1(j) <= integers(2)+y_limits(2)) && (integers(2)-p(k)/n1(j) <= integers(2)+y_limits(2))
                        plot(integers(1)+[y_limits(1),y_limits(2)],integers(2)+[p(k)/n1(j),p(k)/n1(j)],colors{l},'linewidth',linewidth_int);
                        plot(integers(1)+[y_limits(1),y_limits(2)],integers(2)+[p(k)/n2(j),p(k)/n2(j)],colors{l},'linewidth',linewidth_int);
                    end
                end
            end
            % sum and diff lines
        elseif (n1(j) ~= 0) && (m(j) ~= 0)
            if lines(3)
                % sum lines
                if m(j) > 0
                    for k=1:N
                        if ((integers(2)+p(k)/n2(j)-m(j)*x_limits(1)/n2(j)) <= (integers(2)+y_limits(2)) || (integers(2)+p(k)/n2(j)-m(j)*x_limits(2)/n2(j)) <= (integers(2)+y_limits(2))) ...
                                && ((integers(2)+p(k)/n2(j)-m(j)*x_limits(1)/n2(j)) >= (integers(2)+y_limits(1)) || (integers(2)+p(k)/n2(j)-m(j)*x_limits(2)/n2(j)) >= (integers(2)+y_limits(1)))
                            plot(integers(1)+[x_limits(1),x_limits(2)],integers(2)+[p(k)/n2(j)-m(j)*x_limits(1)/n2(j),p(k)/n2(j)-m(j)*x_limits(2)/n2(j)],colors{l},'linewidth',linewidth)
                        end
                    end
                else
                    for k=1:N
                        if ((integers(2)+p(k)/n1(j)-m(j)*x_limits(1)/n1(j)) <= (integers(2)+y_limits(2)) || (integers(2)+p(k)/n1(j)-m(j)*x_limits(2)/n1(j)) <= (integers(2)+y_limits(2))) ...
                                && ((integers(2)+p(k)/n1(j)-m(j)*x_limits(1)/n1(j)) >= (integers(2)+y_limits(1)) || (integers(2)+p(k)/n1(j)-m(j)*x_limits(2)/n1(j)) >= (integers(2)+y_limits(1)))
                            plot(integers(1)+[x_limits(1),x_limits(2)],integers(2)+[p(k)/n1(j)-m(j)*x_limits(1)/n1(j),p(k)/n1(j)-m(j)*x_limits(2)/n1(j)],colors{l},'linewidth',linewidth)
                        end
                    end
                end
            end
            if lines(4)
                % diff lines
                if m(j) > 0
                    for k=1:N
                        if ((integers(2)+p(k)/n1(j)-m(j)*x_limits(1)/n1(j)) <= (integers(2)+y_limits(2)) || (integers(2)+p(k)/n1(j)-m(j)*x_limits(2)/n1(j)) <= (integers(2)+y_limits(2)) ) ...
                                && ((integers(2)+p(k)/n1(j)-m(j)*x_limits(1)/n1(j)) >= (integers(2)+y_limits(1)) || (integers(2)+p(k)/n1(j)-m(j)*x_limits(2)/n1(j)) >= (integers(2)+y_limits(1)))
                            plot(integers(1)+[x_limits(1),x_limits(2)],integers(2)+[p(k)/n1(j)-m(j)*x_limits(1)/n1(j),p(k)/n1(j)-m(j)*x_limits(2)/n1(j)],colors{l},'linewidth',linewidth)
                        end
                    end
                else
                    for k=1:N
                        if ((integers(2)+p(k)/n2(j)-m(j)*x_limits(1)/n2(j)) <= (integers(2)+y_limits(2)) || (integers(2)+p(k)/n2(j)-m(j)*x_limits(2)/n2(j)) <= (integers(2)+y_limits(2))) ...
                                && ((integers(2)+p(k)/n2(j)-m(j)*x_limits(1)/n2(j)) >= (integers(2)+y_limits(1)) || (integers(2)+p(k)/n2(j)-m(j)*x_limits(2)/n2(j)) >= (integers(2)+y_limits(1)))
                            plot(integers(1)+[x_limits(1),x_limits(2)],integers(2)+[p(k)/n2(j)-m(j)*x_limits(1)/n2(j),p(k)/n2(j)-m(j)*x_limits(2)/n2(j)],colors{l},'linewidth',linewidth)
                        end
                    end
                end
            end
        end
    end
end

if axis_FLAG
    axis([integers(1)-0.1,integers(1)+1.1,integers(2)-0.1,integers(2)+1.1])
end

end