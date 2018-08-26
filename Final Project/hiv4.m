%HIV model, no drug treatment
%No immigration of infected and susceptibles
function yp = hiv4(t,y)
%[Q1 Q2 epsilon d alpha alpha1 beta beta' c delta]
p = [0 0 0.6 0.02 1 0.5 0.15 0.05 10 0.4]; % Q1=Q2=0
yp = [p(1) + p(2) - p(4)*y(1) - p(5)*y(4); %N
      p(2) + (p(7)*p(9))*(y(1)-y(2)-y(3)-y(4))*y(2)/y(1)...
      + (p(8)*p(9))*(y(1)-y(2)-y(3)-y(4))*y(3)/y(1) - (p(10)+p(4))*y(2);%I
      (p(3)*p(10)*y(2)) - (p(6)+p(4))*y(3);%P
      p(6)*y(3) + (1-p(3))*p(10)*y(2) - (p(5)+p(4))*y(4)];%A
end
