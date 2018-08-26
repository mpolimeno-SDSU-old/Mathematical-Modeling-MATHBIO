%Km = (0.00006+0.08)/0.002; = 40.0300 = c2+c3/c1
%Vm = 0.08*50; = 4 = c3+S2 @t=0
%p = [Km Vm];

function yp = hiv2(t,y,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10)
% LV model for ODE
temp1= p1 + p2 - p4*y(1) - p5*y(4); %N
temp2= p2 + (p7*p9)*(y(1)-y(2)-y(3)-y(4))*y(2)/y(1) + (p8*p9)*(y(1)-y(2)-y(3)-y(4))*y(3)/y(1) - (p10+p4)*y(2);%I cioè X
temp3= (p3*p10*y(2)) - (p6+p4)*y(3);%P cioè A
temp4= p6*y3 + (1-p3)*p10*y(2) - (p5+p4)*y(4);%A cioè Z
   
     
%temp1=temp1';
%temp1=temp1(:,1);
%temp2=temp2';
%temp2=temp2(:,1);
yp = [temp1;temp2;temp3;temp4];
end

% function yp = hiv2(t,y)
% %p = [13333.3 0.2 0.03125 1 0.3 1.03];
% p = [13333.3 0.2 0.03125 1 0.3 3 0.34333];
% % LV model for ODE
% yp = [(p(1) - p(3)*y(1))-(p(6)*p(7)*y(1)*y(2))/y(5);
%       (p(6)*p(7)*y(1)*y(2))/(y(5)) - (p(2)+p(3))*y(2);
%       p(5)*p(2)*y(2) - (p(4)+p(3))*y(3);
%       (1-p(5))*p(2)*y(2) - p(3)*y(4);
%       p(1) - p(3)*y(5) - p(4)*y(3)];
% end
