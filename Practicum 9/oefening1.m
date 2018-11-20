%Jacobi methode
relaxmod(1)
pause(7)
%Gauss-Seidel methode
relaxmod(2)
pause(7)
%SOR methode voor optimale omega
relaxmod(3)

%Met de gekozen beginvoorwaarde lijkt de Jacobi-methode het snelst te
%convergeren naar de oplossing, maar als we beginvoorwaarde 0 gebruiken
%zal Gauss-Seidel sneller convergeren (Of SOR met optimale omega)