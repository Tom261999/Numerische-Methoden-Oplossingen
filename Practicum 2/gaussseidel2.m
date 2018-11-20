function xj=gaussseidel2(A,b,x0,k)
x(1,:)=x0';
M=triu(A,1);
Lainv=tril(A)\eye(length(A)); %Lainv = L_{A}^{-1}
for i=1:k
   x(i+1,:)=(Lainv*(b-M*x(i,:)'))'; %hier zetten we de resultaten in een kolomvector
end
xj=x;