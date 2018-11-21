function findiffho(n)
%Parameters initialiseren
omega = 0.015; %Deze waarde geeft mooie grafieken, andere waarden voor omega zullen enkel een versmalling/verbreding vand e curves opleveren.
h_bar = 1;  mass = 1; % Natural units
N = 1000;
L = sqrt(h_bar/(mass*omega));
h = L/(N-1);          % Grid size
x = h*(0:(N-1))-L/2;

%Opstellen van Hamiltoniaanse matrix
ham = sparse(N);  %Sparse nulmatrix met dimensies (N,N)
coeff = -h_bar^2/(2*mass*h^2);
ham = spdiags(ones(N,1)*[1 -2 1]*coeff,[-1 0 1],N,N) + spdiags(1/2*x'.^2,0,N,N);
[V, D] = eigs(ham,n,'smallestabs');
E = diag(D); %De eigenwaarden van de Hamiltoniaalse matrix <=> energieÃ«n van de eogenfuncties

%Plot
figure(1)
plot([[1:N]./N],-V) %-V opdat het teken klopt

%Legende, titels, assenbenoeming
legend(num2str(round(E,1)))
title('Eigenfuncties van \psi')
title(legend,'Eigenwaarden')
xlabel('Lengte L')
ylabel('\psi voor verschillende energieën')
axis([0 1 -0.08 0.08])
end