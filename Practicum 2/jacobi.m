function xj=jacobi(A,b,x0,k)
% Jacobi iteratie methode
% b en x0 moeten kolomvectoren zijn
% k is het aantal iteraties
xi=x0;
D=diag(diag(A));
M=A-D;
Dinv=diag(1./diag(A));
for i=1:k
   xi=Dinv*(b-M*xi);
   disp([i,xi']);
end;
xj=xi;
