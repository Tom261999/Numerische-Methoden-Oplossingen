function func2 = energy(J,K)
    function [E,gradE] = func(theta)
        N = length(theta);
        E=0;
        for i=1:N-1
            E=E+(-J.*cos(theta(i)-theta(i+1))-K.*(cos(theta(i))^2));
            thetaverschil(i)=theta(i)-theta(i+1);
        end
        gradE=-J.*([0,sin(thetaverschil)]-[sin(thetaverschil),0])+K.*sin(2*theta);
        gradE(1)=0;
        gradE(N)=0;
    end
func2=@func;
end
%We trachten een functie van theta te maken, dus maken we een functie over
%een functie om de functie van theta te genereren!