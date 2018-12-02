clear, close all

%% Deel a
%Functie energy.m geeft de gevraagde output [E, gradE] met E een scalar en
%gradE een vector waar element gradE(i) overeenkomt met \frac{\partial E}{\partial
%\theta_i}. Nodige input voor de functie energy.m zijn de vector \theta
%(met \theta_i = theta(i)), de interactisterkte J en de anistropiesterkte
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
ylabel('S_z')

%% Deel c & d
%Dirichlet randwoorwaarden werden al geimplementeerd in functie energy.m
N = 50;
J = 1;
K = 0.1; 

[x,xPath] = descent(energy(J,K),theta,0.1,10^-5,10000);

figure(2)
plot(1:N,cos(x),'b.-')
title('na energie optimalisatie')
ylabel('S_z')

%% Deel e
N = 50;
J = 1;
K = [0.0001 0.001 0.01 0.1 1];

figure(3), hold all
for k = K
    [x,xPath] = descent(energy(J,k),theta,0.1,10^-5,10000);
    plot(1:N,cos(x),'x-')
end
hold off
title('Effect van variaties in K')
legend(string(K))
ylabel('S_z')