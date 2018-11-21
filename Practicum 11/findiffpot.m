function findiffpot(U,n)
% % %Parameters initialiseren
% % N = 1000;
% % L = 100;              % System extends from -L/2 to L/2
% % h = L/(N-1);          % Grid size
% % h_bar = 1;  mass = 1; % Natural units
% % 
% % %Opstellen van Hamiltoniaanse matrix
% % ham = sparse(N);  %Sparse nulmatrix met dimensies (N,N)
% % coeff = -h_bar^2/(2*mass*h^2);
% % ham = spdiags(ones(N,1)*[1 -2 1]*coeff,[-1 0 1],N,N); %Zet -2*coeff op hoofdiagonaal en 1*coeff op de twee nevendiagonalen
% % [V, D] = eigs(ham,n,'smallestabs');
% % E = diag(D); %De eigenwaarden van de Hamiltoniaalse matrix <=> energieën van de eogenfuncties
% % 
% % %Plot
% % figure(1)
% % plot([[1:N]./N],V)
% % 
% % %Legende, titels, assenbenoeming
% % legend(num2str(round(E,6)))
% % title('Eigenfuncties van \psi')
% % title(legend,'Eigenwaarden')
% % xlabel('Lengte L')
% % ylabel('\psi voor verschillende energieën')
% % axis([0 1 -0.05 0.05])

%--------------------------------------------------------------------------
%Parameters initialiseren
N = 1000;
L = 1;              % System extends from -L/2 to L/2
h_bar = 1;  mass = 1; % Natural units
b = 2/10; %breedte van de put
xx = L/(1-2*b);
h = xx/(N-1);
x = h*(0:N-1)-xx/2; 
coeff = -1/(h*pi)^2;
ham = spdiags(ones(N,1)*[1 -2 1]*coeff,[-1 0 1],N,N)+spdiags([U*ones(round(N*b),1);zeros(round(N*(1-2*b)),1); U*ones(N-round(N*b)-round(N*(1-2*b)),1)],0,N,N);
[V,D] = eigs(ham,n,'SM');
E = spdiags(D);

%Plot
figure(1)
plot([[1:N]./N],-V)

%Legende, titels, assenbenoeming
legend(num2str(round(E)))
title('Eigenfuncties van \psi')
title(legend,'Eigenwaarden')
xlabel('Lengte L')
ylabel('\psi voor verschillende energieën')
axis([0 1 -0.07 0.07])
end