function [tx,ty,fftx1,ffty1,fftx2,ffty2, fftx1Img, ffty1Img, fftx2Img, ffty2Img] = calctune(xdata,ydata)
% calculates tune using fft technique
%
% INPUT:
%   xdata - a set of evenly spaced points , preferrably in powers of 2
%   ydata (optional) - a set of evenly spaced points
%
% OUTPUT:
%   tx,ty - tune values
%   fftx1,ffty1 - fft of data with average removed
%   fftx2,ffty2 - fft of data with average removed and hanning window
%   fftx1Img ffty1Img - fft with average removed in x + iy form
%   fftx2Img ffty2Img - fft with average removed and hanning window in the
%     form x + iy
%
%
% written by Levon
%
if nargin < 2
    ydata = xdata;
end

option = 'fftw';


if strcmp(option,'fftw')
    
    % grab lengths
    sfx = length(xdata);
    sfy = length(ydata);
    
    % subtract mean from data
    mxdata = xdata - ones(length(xdata),1)*mean(xdata);
    mydata = ydata - ones(length(ydata),1)*mean(ydata);
    
    % fft for xdata/ydata
    fftxdata = abs(fft(mxdata));
    fftydata = abs(fft(mydata));
    
    % return this as fft of the data with average removed
    fftx1 = fftxdata;
    ffty1 = fftydata;
    
    fftx1Img = fft(mxdata);
    ffty1Img = fft(mydata);
    
    % get half the size of the data
    dmaxx = round(sfx/2);
    dmaxy = round(sfy/2);
    
    % look for max peak in half the data
    % note we skip first X points because there is an initial peak in the beginning of the data
    [~,indx] = max(fftxdata(3:dmaxx));
    [~,indy] = max(fftydata(3:dmaxy));
    indx=indx+2;
    indy=indy+2;
    
    % make the window between the peak 5 elements long
    dmaxx = indx + 2;
    dminx = indx - 2;
    dmaxy = indy + 2;
    dminy = indy - 2;
    
    
    % Hanning-like sine filter window
    % i.e. -> X(n) = A*sin^2(pi*n/N) -> A = amplitude of original data, N is # of turns/data
    sxdata = mxdata.*sin(pi*[0:1/(sfx-1):1]).^2';
    sydata = mydata.*sin(pi*[0:1/(sfy-1):1]).^2';
    
    % fft of the data with the sine filter window
    fftxdata = abs(fft(sxdata));
    fftydata = abs(fft(sydata));
    
    fftx2Img = fft(sxdata);
    ffty2Img = fft(sydata);
    
    fftx2 = fftxdata;
    ffty2 = fftydata;
    
    % find the max again
    [~,indx] = max(fftxdata(dminx:dmaxx));
    [~,indy] = max(fftydata(dminy:dmaxy));
    indx = indx + dminx;
    indy = indy + dminy;
    
    % Ignore the rest of the stuff below this point
    % Code below was used at ALS to find the correct phase of tune, i.e.
    % 0.5 or 1-0.5
    if indx == 1
        indx1=2; indx3=2;
    elseif indx == sfx/2
        indx1=sfx/2-1; indx3 = sfx/2-1;
    else
        indx1=indx-1; indx3=indx+1;
    end
    
    if (fftxdata(indx3)>fftxdata(indx1))
        ampx = fftxdata(indx); ampx2 = fftxdata(indx3);
        idx = indx;
    else
        ampx = fftxdata(indx1); ampx2 = fftxdata(indx);
        if indx ~= 1
            idx = indx1;
        else
            idx = 0;
        end
    end
    
    tx = 1/sfx * (idx-1 + (2*ampx2./(ampx+ampx2)) - 0.5);
    
    if indy == 1
        indy1=2; indy3=2;
    elseif indy == sfy/2
        indy1=sfy/2-1; indy3 = sfy/2-1;
    else
        indy1=indy-1; indy3=indy+1;
    end
    
    if (fftydata(indy3)>fftydata(indy1))
        ampy = fftydata(indy); ampy2 = fftydata(indy3);
        idy = indy;
    else
        ampy = fftydata(indy1); ampy2 = fftydata(indy);
        if indy ~= 1
            idy = indy1;
        else
            idy = 0;
        end
    end
    
    ty = 1/sfy * (idy-1 + (2*ampy2./(ampy+ampy2)) - 0.5);
    
end



end