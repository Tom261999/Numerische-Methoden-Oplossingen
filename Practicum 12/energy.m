function [E,gradE] = energy(theta,J,K)
%Theta is een vector met de staten van de dipoolmomenten weergegeven
%door de hoek theta_i = theta(i), J de interactiesterkte en K de
%anistropie sterkte.

N = length(theta);
for i = 1:N-1
    cos_verschil(i) = cos(theta(i)-theta(i+1));
    gradE(i) = J.*sin(theta(i)-theta(i+1))+2.*K.*sin(theta(i)).*cos(theta(i));
end
gradE(N) = J.*sin(theta(N-1)-theta(N))+2.*K.*sin(theta(N)).*cos(theta(N));
for i = 1:N
    cos_quad(i) = (cos(theta(i))).^2;
end
E = -J.*sum(cos_verschil)-K.*sum(cos_quad);
end