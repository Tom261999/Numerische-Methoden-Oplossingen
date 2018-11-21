function findiff(n)
%Parameters initialiseren
N = 1000;
L = 1;              % System extends from -L/2 to L/2
h = L/(N-1);          % Grid size
h_bar = 1;  mass = 1; % Natural units

%Opstellen van Hamiltoniaanse matrix
ham = sparse(N);  %Sparse nulmatrix met dimensies (N,N)
coeff = -h_bar/(h*pi*mass*L)^2;
ham = spdiags(ones(N,1)*[1 -2 1]*coeff,[-1 0 1],N,N); %Zet -2*coeff op hoofdiagonaal en 1*coeff op de twee nevendiagonalen
[V, D] = eigs(ham,n,'smallestabs');
E = diag(D); %De eigenwaarden van de Hamiltoniaalse matrix <=> energieën van de eigenfuncties

%Plot
figure(1)
plot([[1:N]./N],V)

%Legende, titels, assenbenoeming
legend(num2str(round(E)))
title('Eigenfuncties van \psi')
title(legend,'Eigenwaarden')
xlabel('Lengte L')
ylabel('\psi voor verschillende energieën')
axis([0 1 -0.05 0.05])
end