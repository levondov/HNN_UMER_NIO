function addearthfield_interp(hh_flag)
% Adds earth's field interpolated between elements.
%
% INPUT:
%

if nargin < 1
    hh_flag = 1;
end

global THERING
ao=getao;
plot_interp_loc_flag = 0;
HHc = ao.HH.SetPoints;
offset = 0.59; % offset for horizontal correction (in amps)

%%%%%%%%%% load data / constants
[Bx,By] = getearthfield;
s = findspos(THERING,1:length(THERING)+1);
N = length(THERING);
idx_drift = getfamily('Drift',THERING);
s_dipo = findspos(THERING,getfamily('BEND',THERING)); 
s_dipo = s_dipo + THERING{4}.Length/2.; % center of dipos
s_drift = findspos(THERING,getfamily('Drift',THERING));

% create basic efield element to be inserted inbetween drifts
CorElem.FamName = 'EFIELD';
CorElem.Name = 'EFIELD';
CorElem.Length = 0;
CorElem.Energy = 10000;
CorElem.PassMethod = 'CorrectorPass';
CorElem.KickAngle = [0,0];

if plot_interp_loc_flag
    bx_d = zeros(length(idx_drift),1);
    by_d = bx_d;
    s_d = bx_d;
end

ii=0; % number of splits
j=1; % count for HH coils
jj=1; % count for HH coils #2 , count drifts
tmpHHx = []; tmpHHy = [];
tmpbxt = []; tmpbyt = [];
for i=1:length(idx_drift)
    % Grab HH coil field value
    if j < 12 && j > 1
        HHbx = -1*ao.HH.FitParams(j,1)*ao.HH.FitParams(j,2)*HHc(j,1); %bx field for vertical
    else
        HHbx = ao.HH.FitParams(j,1)*ao.HH.FitParams(j,2)*HHc(j,1); %bx field for vertical        
    end
    HHby = ao.HH.Rolls(j)*HHbx; % roll/skew error
    %HHby = ao.HH.FitParams(j,1)*ao.HH.FitParams(j,2)*(HHc(j,2)-offset); % 
    % grab drift index (since we split and add new drifts each loop through
    idx_drift_tmp = getfamily('Drift',THERING);
    % interp field location at drift center based on dipole fields
    bx1 = interp1([-0.32,s_dipo(1:35),s(end)+s_dipo(1:35)],[Bx(end);Bx(2:end);Bx(2:end)],s_drift(i)+THERING{idx_drift_tmp(i+ii)}.Length/2);
    by1 = interp1([-0.32,s_dipo(1:35),s(end)+s_dipo(1:35)],[By(end);By(2:end);By(2:end)],s_drift(i)+THERING{idx_drift_tmp(i+ii)}.Length/2);
    % calculate kick angle at drift center
    if hh_flag
        angleX = field2angle(by1+HHby,THERING{idx_drift_tmp(i+ii)}.Length);
        angleY = field2angle(bx1+HHbx,THERING{idx_drift_tmp(i+ii)}.Length);
    else
        angleX = field2angle(by1,THERING{idx_drift_tmp(i+ii)}.Length);
        angleY = field2angle(bx1,THERING{idx_drift_tmp(i+ii)}.Length);        
    end
    % Create efield element
    CorElem.KickAngle = [angleX,angleY]; %
    % split drift and place element in lattice
    splitdrift(idx_drift_tmp(i+ii),0.5,CorElem);
    if plot_interp_loc_flag
        bx_d(i) = bx1; by_d(i) = by1; 
        s_d(i) = s_drift(i)+THERING{idx_drift_tmp(i+ii)}.Length/2;
    end
    ii=ii+1;
    jj=jj+1;
    if jj > 8 % every 8 drifts we switch to the next helmholtz coil
        jj=1;
        j=j+1;
    end
    tmpHHx(end+1) = HHbx;
    tmpHHy(end+1) = HHby;
    tmpbxt(end+1) = bx1+HHbx;
    tmpbyt(end+1) = by1+HHby;
end

if plot_interp_loc_flag
figure; subplot(2,1,1); hold on; title('Bx Field');
plot(s_dipo(1:35),Bx(2:end),'r.','MarkerSize',20);
plot(linspace(0,11.52,8*18),tmpHHx,'.-');
plot(linspace(0,11.52,8*18),tmpbxt,'k.-');
plot(s_d,bx_d,'k.'); ylabel('Magnetic Field (T)');
grid on;
legend('Bx (dipo)','HHbx setpoint','bx Total','interp (drift)','Location','bestoutside')
legend('boxoff')
subplot(2,1,2); hold on; title('By Field');
plot(s_dipo(1:35),By(2:end),'r.','MarkerSize',20);
plot(linspace(0,11.52,8*18),tmpHHy,'.--');
plot(linspace(0,11.52,8*18),tmpbyt,'k.-');
plot(s_d,by_d,'k.');
grid on; xlabel('S position (m)'); ylabel('Magnetic Field (T)');
legend('By (dipo)','HHby setpoint','by Total','interp (drift)','Location','bestoutside')
legend('boxoff')

end



