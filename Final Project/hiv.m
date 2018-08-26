% lorenz.m
%
% Imlements the Lorenz System ODE
%   dx/dt = sigma*(y-x)
%   dy/dt = x*(rho-z)-y
%   dz/dt = xy-beta*z
%
% Inputs:
%   t - Time variable: not used here because our equation
%       is independent of time, or 'autonomous'.
%   x - Independent variable: has 3 dimensions
% Output:
%   dx - First derivative: the rate of change of the three dimension
%        values over time, given the values of each dimension
%function dx = hiv(t, x)

% Standard constants for the Lorenz Attractor
%sigma = 10; 
%rho = 28;
%beta = 8/3;
%f1 = ((50*x(3))^2)/(4+(50*x(3))^2);
%f2 = 0.8/(1+(50*x(3))^3);


syms x(t) y(t) a(t) z(t) u(t) B v m d p R c l
% I like to initialize my arrays
%dx = [0; 0; 0; 0];
B = 13333.3;
v = 0.2;
m = 1/32;
d = 1;
p = 0.3;
%R = 5.15;
c = 3;
l = 0.3433;


% The lorenz strange attractor
ode1 = diff(x) == B - m*x - (l*c*x*y)/(u);
ode2 = diff(y) ==((l*c*x*y)/(u)) - ((v+m)*y);
ode3 = diff(a) == p*v+y - ((d+m)*a);
ode4 = diff(z) == (1-p)*v*y - m*z;
ode5 = diff(u) == B - (m*u) - (d*a);
odes = [ode1;ode2;ode3;ode4;ode5];

cond1 = x(0) == 50;
cond2 = y(0) == 50;
cond3 = a(0) == 0;
cond4 = z(0) == 0;
cond5 = u(0) == 100;
conds = [cond1; cond2; cond3; cond4; cond5];
[xSol(t),ySol(t),aSol(t),zSol(t),uSol(t)] = dsolve(odes,conds);
fplot(xSol)
hold on
fplot(ySol)
hold on
fplot(aSol)
hold on
fplot(zSol)
hold on
fplot(uSol)
grid on
legend ('x','y','a', 'z','u')