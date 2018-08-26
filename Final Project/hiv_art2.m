%HIV model with drug treatment with basic reproduction rate greater than unity
function yp = hiv_art2(t,y)
%[k beta b mu c k1 k2 alpha h r h1]
p = [120 0.0005 0.3 0.02 3 0.01 0.02 0.01 0.01 0.001 0.02];

yp = [p(4)*p(1) - p(5)*p(2)*(y(2)+y(3)+p(3)*y(4))*y(1) - p(4)*y(1); %S
      (1-p(9))*p(5)*p(2)*(y(2)+y(3)+p(3)*y(4))*y(1) - (p(4)+p(6))*y(2) + p(8)*(1-p(11))*y(4);%I
      p(9)*p(5)*p(2)*(y(2)+y(3)+p(3)*y(4))*y(1) - (p(4)+p(6)-p(10))*y(3) + p(8)*p(11)*y(4);%H
      p(6)*y(2) + (p(6)-p(10))*y(3) - (p(4)+p(7)+p(8))*y(4)];%J
end
