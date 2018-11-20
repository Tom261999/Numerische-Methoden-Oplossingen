clear, close all

% Beginvoorwaarden
K_1 = 2;
K_2 = 10;
C = 0.001;
D = 0.002;
% Variabelen klaar maken voor ode45
t=[0;15];
f = @(t,P) [K_1.*P(1)-C.*P(1).*P(2) ; -K_2.*P(2)+D.*P(1).*P(2)];
y = [5000;100];


ode45(f,t,y)
legend('Prooien','Roofdieren')
xlabel('Tijd'), ylabel('Populaties')
%De grafiek toont de (vrij logische) relatie tussen prooi- en roofdieren.
%We zien ook een periodisch verband, het aantal roofdieren zal natuurlijk
%het aantal prooidieren volgen (veel eten -> aangroei, weinig eten ->
%dalende populatie). Wanneer na verloop van tijd het aantal prooien laag is
%en de roofdieren ook sterk verminderd zijn (omwille van voedsel tekorten)
%kunnen de prooidieren terug ten volle kweken door de verminderde gevaren
%van roofdieren. Zo word de cyclus in stand gehouden!