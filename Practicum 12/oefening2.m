clear, close all

%% Deel a
%Functie energy.m geeft de gevraagde output [E, gradE] met E een scalar en
%gradE een vector waar element gradE(i) overeenkomt met \frac{\partial E}{\partial
%\theta_i}. Nodige input voor de functie energy.m zijn de vector \theta
%(met \theta_i = thetea(i)), de interactisterkte J en de anistropiesterkte
%K.

%% Deel b
N = 50;
for i = 1:N
    theta(i) = pi*(i-1)/(N-1);
end
clear i
figure(1)
plot(1:N,cos(theta(1:N)),'*-')
title('initiele condities')

%% Deel c & d
%Dirichlet randwoorwaarden werden al geimplementeerd in functie energy.m

J = 1;
K = 0.1; %Deze zijn standaard verwerkt in de functie energymod.m

[x,xPath] = descent(@energymod,theta,0.1,10^-5,1000);

figure(2)
plot(1:N,cos(xPath(165,:)),'b.-')
title('na energie optimalisatie')

error('die grafiek is duidelijk niet juist...')

%% Deel e
