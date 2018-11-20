function [t,theta,omega] = slinger_Euler(theta0,omega0,dt,N)

% space allocation
theta = zeros(1,N);
omega = zeros(1,N);
t = zeros(1,N);

% initial conditions
theta(1) = theta0;
omega(1) = omega0;

% time step
dt = 0.01;

% number of steps
N = 5000;

% Euler algorithm
for i = 1:N-1
    t(i+1) = t(i) + dt;
    omega(i+1) = omega(i) + dt * ( -sin(theta(i)) );
    theta(i+1) = theta(i) + dt * omega(i);
end;

