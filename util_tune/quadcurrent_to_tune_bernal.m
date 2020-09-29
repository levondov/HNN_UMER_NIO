function [nu_x,nu_y]=quadcurrent_to_tune_bernal(focus_current,defocus_current)
% Originally written by Brian B. off calculation by Santiago Bernal
% Modified 3/16/17 to return tune value for single operating point,
% Kiersten R

%gradient and magnet parameters
gx=3.93; %gauss/cm-amp
gy=3.93; %gauss/cm-amp
lqx=5.164; %cm
lqy=5.164; %cm
S=32.0; %cm
Lq=(S/2)-lqx; %cm
pm=(3.389E-4)*(100); %mKg/A-s^2
pi_180=1;


%0.7249    1.1876    0.7694    1.1276

sbfactx = 0.7208; %sbx;
sbfacty = 0.7208; %sby;
%sbfactx = 0.7147; 
%sbfacty = 0.7213;

theta_x=sqrt((gx/pm)*focus_current*sbfactx)*lqx*(1/100);
theta_y=sqrt((gy/pm)*defocus_current*sbfacty)*lqy*(1/100);
phaseadv_x=(180/pi)*acos((cosh(theta_y*pi_180)*cos(theta_x*pi_180))-(Lq/lqx)*(theta_x*cosh(theta_y*pi_180)*sin(theta_x*pi_180)-theta_y*sinh(theta_y*pi_180)*cos(theta_x*pi_180))-(0.5*((Lq/lqx)^2)*theta_x*theta_y*sinh(theta_y*pi_180)*sin(theta_x*pi_180))+(0.5*((theta_y/theta_x)-(theta_x/theta_y))*sinh(theta_y*pi_180)*sin(theta_x*pi_180)));
phaseadv_y=(180/pi)*acos((cosh(theta_x*pi_180)*cos(theta_y*pi_180))+(Lq/lqy)*(theta_x*cos(theta_y*pi_180)*sinh(theta_x*pi_180)-theta_y*sin(theta_y*pi_180)*cosh(theta_x*pi_180))-(0.5*((Lq/lqy)^2)*theta_x*theta_y*sinh(theta_x*pi_180)*sin(theta_y*pi_180))-(0.5*((theta_y/theta_x)-(theta_x/theta_y))*sinh(theta_x*pi_180)*sin(theta_y*pi_180)));


nu_x=phaseadv_x/10;
nu_y=phaseadv_y/10;

end

