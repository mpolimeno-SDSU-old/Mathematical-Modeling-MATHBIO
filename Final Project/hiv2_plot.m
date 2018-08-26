% Simulate LV Model
% Requires Stiff Solver ode15s
%p = [13333.3 0.2 0.03125 1 0.3 1.03];
%n = 0:1:20;
clear
clc
[t1,y]=ode15s(@hiv2,0:1:200,[5000,2000,0,0]);
%  s1=y(1:20:201,1)';
%  s4=y(1:20:201,4)';
 
data = zeros(31,4);
data(1,:) = [5000 2000 0 0];
for i = 1:30
    data(i+1,:) = y(((i)*10+1),:);
end
I = data(:,1)';
A = data(:,4)';
tdata=[0 1:1:30];

p0 = [1000 1000 0.6 0.02 1 0.5 0.15 0.05 10 0.4]; %[Q1 Q2 epsilon d alpha alpha1 beta betaprime c delta]
 %tdata=[0:20:200];
[p,fval,exitflag]=fminsearch(@hiv_leastcomplv,p0,[],tdata,s1,s4);
hiv2([0:1:30],p,I,A)
[t2,z]=ode15s(@hiv2,[0:1:30],[2000,0],[],p(1),p(2),p(3),p(4),p(5),p(6),p(7),p(8),p(9),p(10));
plot(t2,z)
hold on
% 
% %disp(y);
% figure(101)
% plot(tn,y);grid;
% xlim([0,30]);
% fontlabs = 'Times New Roman';   
% xlabel('$t$(years)','FontSize',14,'FontName',fontlabs,...
%     'interpreter','latex');  
% ylabel('Population','FontSize',14,'FontName',fontlabs);  
% set(gca,'FontSize',12);
% legend('Susceptibles','Infectious','AIDS','HIV-Positive','Susc+Inf');
%title('ODE simulation for Michaelis-Menten, quasi-steady state approximations');
%print -depsc lv_newode_ts.eps

%    figure(102)
%   plot(y(:,1),y(:,2),'b-');grid; %oscillations of Enzyme and Substrate Concentration
%   xlim([0,30]); 
%   xlabel('$Y_1$','FontSize',14,'FontName',fontlabs,...
%        'interpreter','latex');  
%    ylabel('$Y_2$','FontSize',14,'FontName',fontlabs,...
%       'interpreter','latex');
%  title('Oscillations of Substrate vs. Product Concentration');
% print -depsc lv_ode_pp.eps

 