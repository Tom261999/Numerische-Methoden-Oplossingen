function Y = diffVerlet(A,A0,dt,N)
% Script dat met een functor waarin de fucntie staat van de ODE, samen met 
% de beginvoorwaarde, tijdsstap en aantal iteraties een ODE oplost met de
% methode van Vrelet.

Y = zeros(3,N);
Y(:,1) = A0;
Y(1,2) = Y(1,1) + dt;
Y(2,2) = Y(2,1) + dt*Y(3,1);
for i = 3:N
    Y(1,i) = Y(1,i-1) + dt;
    Y(2,i) = 2*Y(2,i-1) - Y(2,i-2)+ dt^2*A(Y(2,i-1));
    Y(3,i-1) = (Y(2,i)-Y(2,i-2))/(2*dt);
end
Y(3,N) = (2*Y(2,N) - Y(2,N-1)+ dt^2*A(Y(2,N))-Y(2,N-1))/(2*dt);
end