% Time scale solutions for HIV model with drug treatment, R0<1
clc
clear
[tn,y]=ode45(@hiv_art,[0,600],[150,75,50,30]);

figure(101)
 plot(tn,y(:,1),'b','Linewidth',1.2);
 hold on
 plot(tn,y(:,2),'g','Linewidth',1.2);
 hold on
 plot(tn,y(:,3),'r','Linewidth',1.2);
 hold on
 plot(tn,y(:,4),'k--','Linewidth',1.2);
 hold off
 grid on
fontlabs = 'Times New Roman';   
xlabel('$t$(days)','FontSize',12,'FontName',fontlabs,...
      'interpreter','latex');  
 ylabel('Population','FontSize',12,'FontName',fontlabs);  
 set(gca,'FontSize',12);
legend('S','I','H','J','location','best');
title('Population dynamic of HIV, R_{0}<1','Fontsize',12);