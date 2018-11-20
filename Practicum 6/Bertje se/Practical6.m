%% Practical 6
%  Bert Jorissen
%  s0150821@ad.ua.ac.be
set(0,'DefaultFigureWindowStyle','docked')
clear all
close all

%% Exercise 1
% In het bestand 'diffEuler.m' is algemeen een oplosser geschreven die van
% een gegeven probleem de oplossing uitrekend met behulp van de methode van
% Euler. Dit door de functies voor de helling van de verschillende orde
% afgeleiden op te geven in een vectorfunctor, en de beginvoorwaarden in
% een andere vector van dezelfde lengte. (de eerste functie van de functor
% moet 1 zijn). Daarnaast kunnen de stapgrootte en het aantal iteraties
% opgegeven worden. Hierna worden de resultaten teruggegeven in een vector,
% waarbij de verschillende tijen staan voor de verschillende variabelen
% (met op 1 de tijd, op 2 de variabele zelf, 3 de afgeleide hiervan, ...)

L = 1;
g = 9.81;
T = 85;

A = @(X) [1,X(3),-g/L*sin(X(2))];
A0 = [0,1,-1];
dt = 0.01*sqrt(L/g);
N = round(T/dt);
X = diffEuler(A,A0,dt,N);

for i = 1
    t = X(1,:)';
    theta = X(2,:)';
    omega = X(3,:)';
    figure
    plot3(t,sin(theta),-cos(theta))
    xlabel('tijd (s)')
    ylabel('x (m)')
    zlabel('y (m)')
    title('Ex1: Beweging - Euler')
    
    figure
    plot(theta,omega)
    xlabel('\theta (rad)')
    ylabel('\omega (rad/s)')
    title('Ex1: Fasediagram - Euler')
    axis equal
    
    figure
    hold on
    plot(t,theta)
    plot(t,omega)
    legend('\theta (rad)','\omega (rad/s)','location','best')
    xlabel('tijd (s)')
    ylabel('\theta (rad)  /  \omega (rad/s)')
    title('Ex1: \theta(t)--\omega(t) - Euler')
end % Voor de code van de grafieken te verbergen

% De oplossing divergeert. Dit kan gezien worden doordat in het
% fuctiediagram niet steeds dezelfde figuuur doorlopen wordt. Het is reeds
% geweten dat dit geen chaotisch probleem is.

% Nu wordt er nog steeds algemeen gewerkt, maar kan er een matrix worden
% opgegeven die de relatieve posities bevat tov de huidige positie om de
% waarde van de positie uit te rekenen. Verder functioneert het script op
% dezelfde manier.

I = zeros(3,3);
I(3,2) = 1;
X = diffEulerCromer(A,A0,dt,N,I);

for i = 1
    t = X(1,:)';
    theta = X(2,:)';
    omega = X(3,:)';
    
    figure
    plot3(t,sin(theta),-cos(theta))
    xlabel('tijd (s)')
    ylabel('x (m)')
    zlabel('y (m)')
    title('Ex1: Beweging - Euler Cromer')
    
    figure
    plot(theta,omega)
    xlabel('\theta (rad)')
    ylabel('\omega (rad/s)')
    title('Ex1: Fasediagram - Euler Cromer')
    axis equal
    
    figure
    hold on
    plot(t,theta)
    plot(t,omega)
    legend('\theta (rad)','\omega (rad/s)','location','best')
    xlabel('tijd (s)')
    ylabel('\theta (rad)  /  \omega (rad/s)')
    title('Ex1: \theta(t)--\omega(t) - Euler Cromer')
end % Voor de code van de grafieken te verbergen

% Er wordt een betere oplossing bekomen, maar deze is nog steeds niet
% stabiel.

% Met de methode van Vrelet kan enkel één functie ingegeven worden.
B = @(X) -g/L*sin(X);
A0 = [0,1,-1];
X = diffVerlet(B,A0,dt,N);

for i = 1
    t = X(1,:)';
    theta = X(2,:)';
    omega = X(3,:)';
    
    figure
    plot3(t,sin(theta),-cos(theta))
    xlabel('tijd (s)')
    ylabel('x (m)')
    zlabel('y (m)')
    title('Ex1: Beweging - Vrelet')
    
    figure
    plot(theta,omega)
    xlabel('\theta (rad)')
    ylabel('\omega (rad/s)')
    title('Ex1: Fasediagram - Vrelet')
    axis equal
    
    figure
    hold on
    plot(t,theta)
    plot(t,omega)
    legend('\theta (rad)','\omega (rad/s)','location','best')
    xlabel('tijd (s)')
    ylabel('\theta (rad)  /  \omega (rad/s)')
    title('Ex1: \theta(t)--\omega(t) - Vrelet')
end % Voor de code van de grafieken te verbergen

% Deze oplossing is vrij stabiel. Nu wordt het fasediagram geplot

N = round(10/dt);
figure
hold on

for i = 0:1:100
    A0 = [0,i/100*pi,0];
    X = diffVerlet(B,A0,dt,N);
    
    theta = X(2,:)';
    omega = X(3,:)';
    
    plot(theta,omega)
    
    
end % Voor fasediagram

xlabel('\theta (rad)')
ylabel('\omega (rad/s)')
title('Ex1: Fasediagram - Euler')
axis equal

figure
hold on

for i = 0:10:6000
    A0 = [0,i/100*pi,0];
    X = diffVerlet(B,A0,dt,N);
    
    theta = X(2,:)';
    omega = X(3,:)';
    
    plot(theta,omega)
    
    
end % Voor groot fasediagram

xlabel('\theta (rad)')
ylabel('\omega (rad/s)')
title('Ex1: Fasediagram (met grote hoeken) - Euler')

% Het is duidelijk dat het fasediagram bestaat uit een soort uitgrokken
% cirkels. Als de beginvoorwaarden goed gekozen worden kan een fasediagram
% bekomen worden waarbij deze herhaald wordt in een grotere hoek. Dit is te
% verwachten, omdat na 2pi omtrek immers dezelfde waarde wordt verkregen.

%% Excersise 2
K1 = 2;
K2 = 10;
C = 0.001;
D = 0.002;
P0 = 5000;
J0 = 100;
F = @(t,Y) [K1*Y(1)-C*Y(1)*Y(2);-K2*Y(2)+D*Y(1)*Y(2)];
[t,Y] = ode45(F,[0 5],[P0 J0]);

figure
hold on
plot(t,Y(:,1))
plot(t,Y(:,2))
legend('Hazen','Lynxen','location','best')
xlabel('tijd')
ylabel('Populatie')
title('Ex2: Popuatie in de tijd')

% Het verloop van de populatie verloopt vrij periodisch bij de gegeven
% beginvoorwaarde, maar kan wel omslaan naar een bepaalde waarde.

%% Excersice 3

% cirkelvormige baan: a = v²/r en a = GM/r² -> GM/r²=v²/r -> r=GM/v²
% gezien er een uitdrukking voor GM gegeven wordt, kunnen we r=1AU nemen en
% dan v bepalen: v=sqrt(GM) = 2pi

orbe(1,2*pi,0.02);
% deze is niet stabiel

orbeCromer(1,2*pi,0.02);
% nog steeeds niet echt een grote oplichting

orbeCromer(1,pi,0.02);
% doordat de komeet te dicht bij de ster komt is de 2de afgeleide, de
% versnelling, lokaal zeer hoog, en kan de methode van Cromer niet voor de
% fout corrigeren. Een kleinere tussenstap nemen lost het probleem op.

orbeCromer(1,pi,0.005);
% Of zoals dus gegeven wordt in de opgave

orbeRK4(1,pi,0.005);
% dit resultaat is al veel beter

orbeRK4(1,pi/2,0.005);
orbeRK4(1,pi/2,0.0005,20000);
% Runge-Kutta-4 divergeert dus na een bepaalde perioda

% Met een correctie voor de stapgrootte is dit probleem wel op te lossen
% met Runge-Kutta-4
orbeRK4Step(1,pi/2,0.005);
orbeRK4Step(1,pi/2,0.005,10000000,1000); % een zeer grote/kleine stap toegelaten

%% Excersice 4
sigma = 10;
b = 8/3;
r = 25;
F = @(t,Y) [sigma*(Y(2)-Y(1));r*Y(1)-Y(2)-Y(1).*Y(3);Y(1).*Y(2)-b*Y(3)];
[t,Y1] = ode45(F,[0 10],[10 10 9.9]);
[t,Y2] = ode45(F,[0 10],[10 10 10]);
[t,Y3] = ode45(F,[0 10],[10 10 10.1]);

for i=1
    figure
    hold on
    plot3(Y1(:,1),Y1(:,2),Y1(:,3))
    plot3(Y2(:,1),Y2(:,2),Y2(:,3))
    plot3(Y3(:,1),Y3(:,2),Y3(:,3))
    legend('z_0=9.9','z_0=10','z_0=10.1','location','best')
    xlabel('x')
    ylabel('y')
    zlabel('z')
    title('Ex4: x,y,z in de tijd')
    
    figure
    hold on
    plot(Y1(:,2),Y1(:,1))
    plot(Y1(:,3),Y1(:,1))
    plot(Y2(:,2),Y2(:,1))
    plot(Y2(:,3),Y2(:,1))
    plot(Y3(:,2),Y3(:,1))
    plot(Y3(:,3),Y3(:,1))
    legend('z_0 = 9.9: x(y)','z_0 = 9.9: x(z)','z_0 = 10: x(y)','z_0 = 01: x(z)','z_0 = 10.1: x(y)','z_0 = 10.1: x(z)','location','best')
    xlabel('x')
    ylabel('y/z')
    title('Ex4: fasevlak')
end

% Als de beginwaarde een kleine verschuiving krijgt zal de waarde van de
% uiteindelijke baan toch zeer verschillend zijn.

r = 20;
F = @(t,Y) [sigma*(Y(2)-Y(1));r*Y(1)-Y(2)-Y(1).*Y(3);Y(1).*Y(2)-b*Y(3)];
[t,Y1] = ode45(F,[0 10],[10 10 9.9]);

for i=1
    figure
    plot3(Y1(:,1),Y1(:,2),Y1(:,3))
    xlabel('x')
    ylabel('y')
    zlabel('z')
    title('Ex4: x,y,z in de tijd voor r=20')
end

% De grafiek convergeert naar een waarde. Bij een grotere waarde van r zal
% deze niet convergeren maar steeds rond 2 bepaalde waarden ronddraaien in
% de gekende vorm van de attractor. Zie cursus Analytische Mechanica voor
% een beschrijving van een chaotisch probleem in verband met
% beginvoorwaarden