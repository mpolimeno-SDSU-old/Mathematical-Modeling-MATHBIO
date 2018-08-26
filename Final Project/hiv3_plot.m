%plots for HIV model - No drug treatment
%Time scale solutions and equilibrium
clc
clear
[tn,y]=ode45(@hiv3,[0,30],[5000,2000,1000,500]);
[tna,ya]=ode45(@hiv3,[0,30],[15000,8000,2000,200]);
[tnb,yb]=ode45(@hiv3,[0,30],[11000,8000,2000,500]);
[tnc,yc]=ode45(@hiv3,[0,30],[8000,1500,4000,100]);
[tnd,yd]=ode45(@hiv3,[0,30],[5000,300,1000,400]);
[tnf,yf]=ode45(@hiv4,[0,30],[5000,2000,1000,500]);


figure(101)
 plot(tn,y,'Linewidth',1.2);
 hold on
 grid on
xlim([0,30]);
fontlabs = 'Times New Roman';   
xlabel('$t$(years)','FontSize',12,'FontName',fontlabs,...
      'interpreter','latex');  
 ylabel('Population','FontSize',12,'FontName',fontlabs);  
 set(gca,'FontSize',12);
legend('Susceptible','Infectious','Pre-AIDS','AIDS');
title('Variation of Population in Different Classes with respect to Time','Fontsize',12);
 
figure(102)
 plot(tnf,yf,'Linewidth',1.2);
 hold on
 grid on
xlim([0,30]);
fontlabs = 'Times New Roman';   
xlabel('$t$(years)','FontSize',12,'FontName',fontlabs,...
      'interpreter','latex');  
 ylabel('Population','FontSize',12,'FontName',fontlabs);  
 set(gca,'FontSize',12);
legend('Susceptible','Infectious','Pre-AIDS','AIDS');
title('Variation of Population in Different Classes - No Immigration' ,'Fontsize',12);


figure (103)
plot3(y(:,1),y(:,3),y(:,4));
 grid on
 hold on
 plot3(ya(:,1),ya(:,3),ya(:,4));
  hold on
  plot3(yb(:,1),yb(:,3),yb(:,4));
  hold on
  plot3(yc(:,1),yc(:,3),yc(:,4));
  hold on
  plot3(yd(:,1),yd(:,3),yd(:,4))
  hold on
  plot3(9863,2172,1803,'k*'); %equilibrium (9836,4706,2172,1803)
 hold off
 view(-35.5,30)
 xlabel('Susceptibles')
 ylabel('Pre-AIDS')
 zlabel('AIDS')