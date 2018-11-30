function [E,gradE] = energymod(theta)
%Theta is een vector met de staten van de dipoolmomenten weergegeven door
%de hoek theta_i = theta(i), J de interactiesterkte en K de anistropie
%sterkte. Merk op dat er Dirichlet randvoorwaarden gelden op gradE.
J = 1;
K = 0.1;
N = length(theta);
for i = 2:N-1
    cos_verschil(i) = cos(theta(i)-theta(i+1));
    gradE(i) = -J*sin(theta(i-1)*theta(i)) + J*sin(theta(i)-theta(i+1)) + ...
        2*K*sin(theta(i))*cos(theta(i));
end
gradE(1) = 0;
gradE(N) = 0;
for i = 1:N
    cos_quad(i) = (cos(theta(i))).^2;
end
E = -J.*sum(cos_verschil)-K.*sum(cos_quad);
end