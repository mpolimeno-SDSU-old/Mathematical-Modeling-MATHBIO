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
function dx = hivhomo(t, x)

% Standard constants for the Lorenz Attractor
%sigma = 10; 
%rho = 28;
%beta = 8/3;
%f1 = ((50*x(3))^2)/(4+(50*x(3))^2);
%f2 = 0.8/(1+(50*x(3))^3);
B = 13333.3;
v = 0.2;
m = 1/32;
d = 1;
p = 0.3;
%R = 5.15;
k = 1.03; %beta*c
%l = 0.343;
%N = 100000;
% I like to initialize my arrays
dx = [0; 0; 0; 0; 0];

% The lorenz strange attractor
dx(1) = B - m*x(1) - ((k*x(2))/x(5))*x(1);
dx(2) = ((k*x(2))/x(5))*x(1) - (v+m)*x(2);
dx(3) = p*v*x(2) - (d+m)*x(3);
dx(4) = (1-p)*v*x(2) -m*x(4);
dx(5) = B - m*x(5) - d*x(3);