A = [-7 2 5;0.2 16 0;6 -11 23];
b = [5;7;-3];
c = rand(3,1); %%We gebruiken gewoon een willekeurig beginpunt

n = 50; %Aantal iteraties voor ...2 functies

GS = gaussseidel(A,b,c,500); %We gebruiken deze als referentie oplossing, 
%we zullen de iteraties van GS2 en J2 dus vergelijken met GS om te bepalen 
%hoe groot de fout is
J2 = jacobi2(A,b,c,n);
GS2 = gaussseidel2(A,b,c,n);

x = 1:(n+1); %constructie van de x-as

%kwadratische sommen van de elementen om de afstand van het resultaat tot 
%het juiste antwoord (aka de error) te berekenen
dJ2GS = sqrt(sum((J2-(GS*ones(1,length(J2)))').^2'));
dGS2GS = sqrt(sum((GS2-(GS*ones(1,length(J2)))').^2'));

%plots om errors te bekijken (log plots om alles lineair te tonen
semilogy(x,dJ2GS);
hold on;
semilogy(x,dGS2GS)
legend('jacobi','Gauss-Seidel')
xlabel('aantal iteraties')
ylabel('logaritme van de euclidische norm op de error')
%De methode van Gauss-Seidel convergeert sneller naar het juiste resultaat
%dan Jacobi
