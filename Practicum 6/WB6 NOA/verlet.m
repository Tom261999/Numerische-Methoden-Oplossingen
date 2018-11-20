function [t,theta,omega] = verlet(theta0,omega0,N,dt)

%ruimte allocatie
theta=zeros(1,N);
omega=zeros(1,N);
t = zeros(1,N);

%beginwaarden
theta(1) = theta0;
omega(1) = omega0;

%1 keer euler om theta(2) te weten te komen
theta(2)=theta(1)+dt*omega(1);
t(2)=t(1)+dt;

%algoritme van verlet
for i=2:N-1
    t(i+1)=t(i)+dt;
    theta(i+1)=2*theta(i)-theta(i-1)+dt^2*( -sin(theta(i)) );
    omega(i)=(theta(i+1)-theta(i-1))/(2*dt);
end
%omega loopt maar tot N-1 waardoor het laatste element 0 is, dit moet nog
%apart berekent worden
figure()
subplot(2,1,1),plot(t(1:N-1),theta(1:N-1),t(1:N-1),omega(1:N-1),"r")
subplot(2,1,2),plot(theta(1:N-1),omega(1:N-1))