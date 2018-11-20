function Y = diffEuler(A,A0,dt,N)
% Script dat met een functor waarin de fucnties staan van de ODE, met op de
% eerste plaats een toename voor de tijd (altijd 1), samen met de
% beginvoorwaarde, tijdsstap en aantal iteraties een ODE oplost met de
% methode van Euler.

n = length(A0);
Y = zeros(n,N);
Y(:,1) = A0;
y = zeros(1,n);
for i = 2:N
    F = A(Y(:,i-1));
    for j = 1:n
        y(j) = Y(j,i-1) + dt*F(j);
    end
    Y(:,i) = y;
end
end