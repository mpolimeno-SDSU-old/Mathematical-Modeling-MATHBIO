%HIV model with no drug treatment
%Constant inflow of susceptibles and infected individuals
%numerical analysis - Equilibrium stability
clc
clear
syms N I P A
Q1=1000;
Q2=1000;
u=0.6;%epsilon
d=0.02;
a=1; %alpha
a1=0.5; %alpha'
b=0.15; %beta
b1=0.05; %beta'
c=10;
r=0.4;%delta
eqn1 = Q1 + Q2 - (d*N) - (a*A);
eqn2 =  Q2 + ((b*c*(N-I-P-A)*I)/N) + ((b1*c*(N-I-P-A)*P)/N) - (r+d)*I;
eqn3 = u*r*I - (a1+d)*P;
eqn4 = (1-u)*r*I + a1*P - (a+d)*A;
eqns = [eqn1==0,eqn2==0,eqn3==0,eqn4==0];
vars = [N,I,P,A];
[solN,solI,solP,solA] = solve(eqns,vars);
Ne = double(solN)
Ie = double(solI)
Pe = double(solP)
Ae = double(solA)
J = jacobian([eqn1,eqn2,eqn3,eqn4],[N,I,P,A]);
Jeq = subs(J,[N,I,P,A],[Ne(2),Ie(2),Pe(2),Ae(2)]);
Jeq = double(Jeq)
lambda = eig(Jeq)