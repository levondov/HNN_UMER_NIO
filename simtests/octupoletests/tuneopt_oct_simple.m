function goal = tuneopt_oct2(params)

% load params
%umerlat_oct(params);
umerlat_octi_ideal(params);

[td,tune] = twissring(THERING,0,1:length(THERING)+1);

beta = cat(1,td.beta);
s = cat(1,td.SPos);
alpha = cat(1,td.alpha);
phase = cat(1,td.mu)./pi;
%% 22-21-23
alpha_goal = abs(alpha(1,1)-alpha(end,1)) + abs(alpha(1,2)-alpha(end,2));
alpha_goal2 = abs(alpha(43,1)-alpha(79,1)); abs(alpha(43,2)-alpha(79,2));
beta_goal = abs(beta(58,1) - beta(58,2)) ...
    + abs(beta(57,1) - beta(57,2))...     
    + abs(beta(56,1) - beta(56,2))...  
    + abs(beta(55,1) - beta(55,2))...  
    + abs(beta(58,1) - beta(58,2))...  
    + abs(beta(59,1) - beta(59,2))...      
    + abs(beta(60,1) - beta(60,2))...     
    + abs(beta(61,1) - beta(61,2))...     
    + abs(beta(62,1) - beta(62,2));
amp_goal = abs(max(beta(:,1)) + max(beta(:,2)));
amp_goal2 = beta(58,1) + beta(58,2);
tune_goal = abs(6.68-tune(1)) + abs(7.25-tune(2));

phase_goal1 = phase(end,1) - (phase(62,1)-phase(55,1));
phase_goal2 = phase(end,2) - (phase(62,2)-phase(55,2));
phase_goal1 = abs(floor(phase_goal1) - phase_goal1);
phase_goal2 = abs(floor(phase_goal2) - phase_goal2);
phase_goal = phase_goal1 + phase_goal2;

goal = 0;
%goal = goal + alpha_goal;
%goal = goal + alpha_goal2;
goal = goal + beta_goal*10;
goal = goal + tune_goal*0;
goal = goal + phase_goal*10;
goal = goal + amp_goal2*10;

goal = goal + 0.75*amp_goal;

fprintf(['                                                                     ',num2str(beta(22,1)),'|',num2str(beta(22,2)),'\n'])
fprintf(['                                                                     ',num2str(alpha(1,1)),'|',num2str(alpha(end,1)),'\n'])
fprintf(['                                                                     ',num2str(alpha(1,2)),'|',num2str(alpha(end,2)),'\n'])
fprintf(['                                                                     ',num2str(tune(1)),'|',num2str(tune(2)),'\n'])

end
