function X = nonlinnewton(f,j,X,k)
%De Newton methode voor niet-lineaire systemen met n vergelijkingen, een
%opgegeven fucntie 'f' en zijn jacobiaan 'J' (met k iteraties)
for i=1:k
    Y = -feval(f,X);
    Yp = feval(j,X);
    dX = Yp\Y;
    X = X+dX';
end