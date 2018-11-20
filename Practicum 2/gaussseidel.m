function xj=gaussseidel(A,b,x0,k)
% b en x0 moeten kolomvectoren zijn
% k is het aantal iteraties
xi=x0;
M=triu(A,1);
Lainv=tril(A)\eye(length(A)); %Lainv = L_{A}^{-1}
for i=1:k
   xi=Lainv*(b-M*xi);
end
xj=xi;