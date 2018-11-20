function Y = diffEulerCromer(A,A0,dt,N,I)
% Script dat met een functor waarin de fucnties staan van de ODE, met op de
% eerste plaats een toename voor de tijd (altijd 1), samen met de
% beginvoorwaarde, tijdsstap en aantal iteraties met de methode van
% Euler-Cromer. Daarnaast bevat het een ingave voor de toename van het
% hoeveelheid stappen tov de huidige positie.

n = length(A0);
Y = zeros(n,N);
Y(:,1) = A0;
M = zeros(1,n);
for i = 2:N
    for j = n:-1:1
        k = i+I(:,j)-1;
        for l = 1:n
            M(l) = Y(l,k(l));
        end
        F = A(M);
        Y(j,i) = Y(j,i-1) + dt*F(j);
    end
end
end