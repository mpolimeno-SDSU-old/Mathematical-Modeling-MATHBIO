% LV_gill.M
% Simple implementation of the Stochastic Simulation Algorithm
% (or Gillespie’s algorithm) for the Lotka-Volterra system.
%
% rand('state',100) % Can fix rand # pattern
% stoichiometric matrix for rxs
V = [-1 1 0;-1 1 1;1 -1 -1;0 0 1];
%%%%%%% Parameters and Initial Conditions
X = zeros(4,1);
X(1) = 500;   % initial molecules of X1
X(2) = 50;   % initial molecules of X2
X(3) = 0;   % initial molecules of X3
X(4) = 0;   % initial molecule of X4

Y1(1) = X(1);  % store # of molecules
Y2(1) = X(2);
Y3(1) = X(3);
Y4(1) = X(4);

% set chem rx coefficients
c(1) = 0.002; c(2) = 0.00006; c(3) = 0.08;
t = 0;         % initial time
T(1) = t;
tfinal = 200;   % final time
i = 1;
while t < tfinal
  % rx combination functions
  a(1) = c(1)*X(1)*X(2);
  a(2) = c(2)*X(3);
  a(3) = c(3)*X(3);
  asum = sum(a);  % total a
  % generate rand # and find rx occurring
  j = min(find(rand<cumsum(a/asum)));
  % 2nd rand # for time until rx
  tau = log(1/rand)/asum;
  X = X + V(:,j); % Stochastic matrix adjusts X
  t = t + tau;
  i = i + 1;
  T(i) = t;
  Y1(i) = X(1);
  Y2(i) = X(2);
  Y3(i) = X(3);
  Y4(i) = X(4);
end

[t1,y]=ode15s(@lv_newode,[0,200],[500,50,0,0]);

figure(101)
plot(T,Y1,'b-',T,Y2,'r-',T,Y3,'m-',T,Y4,'g-');grid;
xlim([0,200]);
hold on
plot(t1,y);
hold off
fontlabs = 'Times New Roman'; % Font type used in labels
xlabel('$t$','FontSize',14,'FontName',fontlabs,...
    'interpreter','latex');  
ylabel('Molecules','FontSize',14,'FontName',fontlabs);  
set(gca,'FontSize',12);
legend('S1-Gillespie','S2-Gillespie','S3-Gillespie','S4-Gillespie','S1-ODE','S2-ODE','S3-ODE','S4-ODE','location','best');
title('ODE simulation overlayed with Gillespie simulation');

 figure(102)
 plot(y(:,1),y(:,2),'b-');grid; %oscillations of Enzyme and Substrate Concentration - ODE
 hold on
 xlabel('$Y_1$','FontSize',14,'FontName',fontlabs,...
     'interpreter','latex');  
 ylabel('$Y_2$','FontSize',14,'FontName',fontlabs,...
    'interpreter','latex');
 plot(Y1,Y2,'r-');grid; %oscillations of Enzyme and Substrate Concentration -Gillespie
 hold off
 xlabel('$Y_1$','FontSize',14,'FontName',fontlabs,...
     'interpreter','latex');  
 ylabel('$Y_2$','FontSize',14,'FontName',fontlabs,...
    'interpreter','latex');
legend('ODE','Gillespie');
title('Oscillations of Enzyme and Substrate Concentration - Gillespie vs. ODE');
% figure(102)
% plot(Y1,Y2,Y3,Y4,'b-');grid;
% xlabel('$Y_1$','FontSize',14,'FontName',fontlabs,...
%     'interpreter','latex');  
% ylabel('$Y_2$','FontSize',14,'FontName',fontlabs,...
%     'interpreter','latex');

%------------------------------------------------------------------------
% Simulate LV Model
% Requires Stiff Solver ode15s
%[t1,y]=ode15s(@lv_newode,[0,200],[500,50,0,0]);

% figure(101)
% plot(t1,y);
% hold off
%legend('S1-ODE','S2-ODE','S3-ODE','S4-ODE');
% xlim([0,200]);
% %hold on
% fontlabs = 'Times New Roman';   
% xlabel('$t$','FontSize',14,'FontName',fontlabs,...
%     'interpreter','latex');  
% ylabel('Molecules','FontSize',14,'FontName',fontlabs);  
% set(gca,'FontSize',12);
% hold off
%legend('S1','S2','S3','S4');
%print -depsc lv_ode_ts.eps

% figure(102)
% plot(y(:,1),y(:,2),'b-');grid;
% xlabel('$Y_1$','FontSize',14,'FontName',fontlabs,...
%     'interpreter','latex');  

function yp = lv_newode(t,y)
% LV model for ODE
yp = [-0.002*y(1)*y(2) + 0.00006*y(3);
      -0.002*y(1)*y(2) + ((0.0006+0.08)*y(3));
       0.002*y(1)*y(2) - ((0.0006+0.08)*y(3));
       0.08*y(3)];
end

% ylabel('$Y_2$','FontSize',14,'FontName',fontlabs,...
%     'interpreter','latex');
% print -depsc lv_ode_pp.eps