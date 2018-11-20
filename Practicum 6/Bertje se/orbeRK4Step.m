function orbeRK4Step(r0,v0,tau,preciesieIn,nstepIn)
% orbe - Berekent de baan van een komeet rond de zon met de methode van
% Runge-Kutta-4 waarbij een variabele stapgrootte binnen een opgegeven
% interval kan genomen worden.
% r0 begin positie (op x axis) in Au
% v0 begin snelheid (y richting) in Au/jaar
% tau tijdstap in jaar
if nargin > 4
  nstep = nstepIn;
  preciesie = preciesieIn;
else
    if nargin == 4
        preciesie = preciesieIn;
        nstep = nstepIn;
    else
        nstep = 200;
        preciesie = 100;
    end
end
r=[r0 0];   % Beginpositie wordt op x-as gekozen
v=[0 v0];   % Beginsnelheid wordt in y-richting gekozen
GM=4*pi^2;  % Grav. constante * massa van de zon (AU^3/jaar^2)
mass=1;     % Massa van komeet
%%%%% MAIN LOOP %%%%%
time=0;
X = [r;v];
f = @(X) [X(2,:);-GM.*X(1,:)./norm(X(1,:))^3];
istep = 1;
Period = round(nstep*tau);
tau0 = tau;
while (time < Period)
    rplot(istep)=norm(r);
    thplot(istep)=atan2(r(2),r(1));
    tplot(istep)=time;
    kinetic(istep)=.5*mass*norm(v)^2;
    potential(istep)=-GM*mass/norm(r);
    
    % Bereken nieuwe positie en snelheid
    k1 = f(X);
    k2 = f(X+tau*k1/2);
    k3 = f(X+tau*k2/2);
    k4 = f(X+tau*k3);
    X = X + tau/6*(k1+2*k2+2*k3+k4);
    %Error = (8*(norm(k3)-norm(k2))^3)/(15*(norm(k4)-norm(k1))^2);
    
    tau = tau0*0.9*min(max(norm(r)^3,1/preciesie),preciesie);
    r = X(1,:);
    v = X(2,:);
    time=time+tau;
    istep = istep + 1;
end
% Plot van het traject van de komeet
figure()
subplot(121)
polar(thplot,rplot,'+') % zie help polar
grid
ylabel(' Afstand (AU) ');
title(' Baan van de komeet');
subplot(122)
yyaxis right
totalE=kinetic+potential;   % Totale energie
plot(tplot,kinetic,'-.',tplot,potential,'--',tplot,totalE,'-');
xlabel(' Tijd (jaar) ');
ylabel(' Energie');
title(' KE(dot), PE(dash), Total(solid) ')
yyaxis left
%Error
plot(tplot(1:end-1),min(diff(tplot),1))
ylabel(' Stapgrootte');