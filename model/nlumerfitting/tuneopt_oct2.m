function goal = tuneopt_oct2(params)

%
% QR10,QR11,QR12,QR13,QR14,QR17,QR18,QR19,QR20,QR21,QD,QF,YQ,QR1
%
% load params
ao=getao;
% set all quads
ao.QD.SetPoints(1:end) = params(11);
ao.QF.SetPoints(1:end) = params(12);
% set quads before and after
ao.QD.SetPoints(5) = params(1);
ao.QD.SetPoints(6) = params(3);
ao.QD.SetPoints(7) = params(5);
ao.QD.SetPoints(8) = 0;
ao.QD.SetPoints(9) = params(7);
ao.QD.SetPoints(10) = params(9);
ao.QD.SetPoints(end) = params(13);
ao.QF.SetPoints(5) = params(2);
ao.QF.SetPoints(6) = params(4);
ao.QF.SetPoints(7) = 0;
ao.QF.SetPoints(8) = params(6);
ao.QF.SetPoints(9) = params(8);
ao.QF.SetPoints(10) = params(10);
ao.QF.SetPoints(end) = params(14);
setao(ao);

umerlat_oct;


[td,tune] = twissring(THERING,0,1:length(THERING)+1);

beta = cat(1,td.beta);
s = cat(1,td.SPos);
alpha = cat(1,td.alpha);
phase = cat(1,td.mu)./pi;
%% 22-21-23
alpha_goal = abs(alpha(1,1)-alpha(end,1)) + abs(alpha(1,2)-alpha(end,2));
alpha_goal2 = abs(alpha(43,1)-alpha(79,1)); abs(alpha(43,2)-alpha(79,2));
beta_goal = abs(beta(57,1) - beta(57,2)) ...
    + abs(beta(56,1) - beta(56,2))...  
    + abs(beta(55,1) - beta(55,2))...   
    + abs(beta(58,1) - beta(58,2))...  
    + abs(beta(59,1) - beta(59,2))...      
    + abs(beta(60,1) - beta(60,2))...
    + abs(beta(61,1) - beta(61,2))...
    + abs(beta(62,1) - beta(62,2));
amp_goal = sum((beta(:,1)) + beta(:,2));
amp_goal2 = beta(47,1) + beta(47,2) + beta(48,1) + beta(48,2) + beta(69,1) + beta(69,2) + beta(70,1) + beta(70,2);
tune_goal = abs(7.13-tune(1)) + abs(7.13-tune(2));
tune_goal2 = tune(1)-tune(2);

phase_goal1 = phase(end,1) - (phase(62,1)-phase(55,1));
phase_goal2 = phase(end,2) - (phase(62,2)-phase(55,2));
phase_goal1 = abs(floor(phase_goal1) - phase_goal1);
phase_goal2 = abs(floor(phase_goal2) - phase_goal2);
phase_goal = phase_goal1 + phase_goal2;

goal = 0;
%goal = goal + alpha_goal;
%goal = goal + alpha_goal2;
%goal = goal + beta_goal*15;
goal = goal + tune_goal*30;
%goal = goal + phase_goal*20;
%goal = goal + amp_goal2*1;

%goal = goal + 5.0*amp_goal2;
%goal = goal + 0.5*amp_goal;



fprintf(['                                                                     ',num2str(beta(22,1)),'|',num2str(beta(22,2)),'\n'])
fprintf(['                                                                     ',num2str(alpha(1,1)),'|',num2str(alpha(end,1)),'\n'])
fprintf(['                                                                     ',num2str(alpha(1,2)),'|',num2str(alpha(end,2)),'\n'])
fprintf(['                                                                     ',num2str(tune(1)),'|',num2str(tune(2)),'\n'])

end
