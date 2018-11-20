function orbe(r0,v0,tau)
% orbe - Berekent de baan van een komeet rond de zon
% r0 begin positie (op x axis) in Au
% v0 begin snelheid (y richting) in Au/jaar
% tau tijdstap in jaar

r=[r0 0];   % Beginpositie wordt op x-as gekozen
v=[0 v0];   % Beginsnelheid wordt in y-richting gekozen
GM=4*pi^2;  % Grav. constante * massa van de zon (AU^3/jaar^2)
mass=1;     % Massa van komeet
%%%%% MAIN LOOP %%%%%
time=0;
nstep=200;  % Aantal tijdsstappen
for istep=1:nstep
    rplot(istep)=norm(r);
    thplot(istep)=atan2(r(2),r(1));
    tplot(istep)=time;
    kinetic(istep)=.5*mass*norm(v)^2;
    potential(istep)=-GM*mass/norm(r);
    % Bereken nieuwe positie en snelheid
    accel=-GM*r/norm(r)^3;
    r=r+tau*v;
    v=v+tau*accel;
    time=time+tau;
end
% Plot van het traject van de komeet
figure()
subplot(121)
polar(thplot,rplot,'+') % zie help polar
grid
ylabel(' Afstand (AU) ');
title(' Baan van de komeet');
subplot(122)
totalE=kinetic+potential;   % Totale energie
plot(tplot,kinetic,'-.',tplot,potential,'--',tplot,totalE,'-');
xlabel(' Tijd (jaar) ');
ylabel(' Energie');
title(' KE(dot), PE(dash), Total(solid) ')

