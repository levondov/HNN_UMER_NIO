function [idx_x0,idx_xp0,xxp0_bins,x_bins,xp_bins] = binparticles(x0,xp0,Nx_bins,Nxp_bins,range)
%CALC_DMAT Summary of this function goes here

Np = length(x0);
% Manually decide limits of bins
maxx = range(2);
minx = range(1);
maxxp = range(4);
minxp = range(3);

% create bin range
x_bins = linspace(minx - abs(0.01*minx),maxx + abs(0.01*maxx),Nx_bins); % x bins
xp_bins = linspace(minxp - abs(0.01*minxp),maxxp + abs(0.01*maxxp),Nxp_bins); % xp bins
xxp0_bins = zeros(Nxp_bins,Nx_bins); % bins in a grid format, x vx xp, that will be filled in.

% bin particles
idx_x0 = discretize(x0,x_bins);
idx_xp0 = discretize(xp0,xp_bins);

% calculate density matrix
if 1
    % for each particle see which bin it falls into.
    for k = 1:Np % this will fail if x/xp bin sizes are different
        
        % if particle is outside the boundary limits, don't count it.
        % boundary limits apply to particles before and after running through
        % oscillator
        if ~isnan(idx_xp0(k)) && ~isnan(idx_x0(k))
            xxp0_bins(idx_xp0(k),idx_x0(k)) = xxp0_bins(idx_xp0(k),idx_x0(k)) + 1;
        end
    end
end


end

