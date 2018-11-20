function xj=jacobi2(A,b,x0,k)
% Jacobi iteratie methode
% b en x0 moeten kolomvectoren zijn
% k is het aantal iteraties
% hierbij worden tussenstappen teruggegeven
x(1,:)=x0';
D=diag(diag(A));
M=A-D;
Dinv=diag(1./diag(A));
for i=1:k
   x(i+1,:)=(Dinv*(b-M*x(i,:)'))';
end
xj=x;