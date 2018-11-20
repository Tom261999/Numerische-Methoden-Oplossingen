clear, close all %zorgt ervoor dat eerder bestaande figuren gesloten worden en dus niet gaan overschrijven.

T = [45 50 55 60 70 80 90 100]; %temperatuur in °C
V = [3.49 3.17 2.93 2.73 1.76 1.63 1.41 1.36]; %potentiaal in mV

%%Deel a
P = polyfit(T,V,2);

X = 35:2:110; %fijner grid voor polynoom evaluatie
Y = polyval(P,X);
%Wat de polynoom Y(T) als fit van V(T) construeert, op een fijner grid
%geevalueerd.

%%Deel b
plot(T,V,'k.','Markersize',15); hold on
plot(X,Y,'b--')
xlabel('Temperatuur $T \left(^\circ C\right)$','Interpreter','latex')
ylabel('Potentiaal $V \left(mV\right)$','Interpreter','latex')
%Wat het gevraagde plot met de gefitte polynoom geeft.

%%Deel c
dP = polyder(P);

%V(66)
disp('Benaderde waarde V(66)')
disp(polyval(P,66))

%V(76)
disp('Benaderde waarde V(76)')
disp(polyval(P,76))

%dV/dT(66)
disp('Benaderde waarde dV/dT(66)')
disp(polyval(dP,66))

%dV/dT(76)
disp('Benaderde waarde dV/dT(76)')
disp(polyval(dP,76))