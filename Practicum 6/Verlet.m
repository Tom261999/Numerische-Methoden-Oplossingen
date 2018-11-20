function [t,theta,omega] = Verlet(theta0,omega0)

% number of steps
N = 5000;

% time step
dt = 0.01;

% space allocation
theta=zeros(1,N);
omega=zeros(1,N);
t = zeros(1,N);

% intial conditions
theta(1) = theta0;
omega(1) = omega0;

%1 keer Euler toepassen om Theta(2) te bepalen.
theta(2)=theta(1)+dt*omega(1);
t(2)=t(1)+dt;

% algoritme van Verlet
for i=2:N-1
    t(i+1)=t(i)+dt;
    theta(i+1)=2*theta(i)-theta(i-1)+dt^2*( -sin(theta(i)) );
    omega(i)=(theta(i+1)-theta(i-1))/(2*dt);
end
%Omega zal tot N-1 lopen, het laatste element (0) zal dus appart berekend
%meoten worden!

% Figure
figure('Name','Verlet')
subplot(2,1,1),plot(t,theta,'b-'), hold on, plot(t,omega,'r--')
subplot(2,1,2),plot(theta,omega,'k-')