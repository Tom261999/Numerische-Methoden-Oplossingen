function r = modnewton2(tol,fun,funp,x1,maxiter)

format short e
x(1) = x1;
y(1) = feval(fun,x(1));
yp(1) = feval(funp,x(1));

for i = 2:10
    x(i) = x(i-1)-y(i-1)/yp(i-1);
    y(i) = feval(fun,x(i));
    yp(i) = feval(funp,x(i));
    esterr(i-1) = abs(x(i)-x(i-1));
end

m = round(1/(1-esterr(i-1)/esterr(i-2)))

for j = 2:maxiter
    x(j) = x(j-1)-m*y(j-1)/yp(j-1);
    y(j) = feval(fun,x(j));
    yp(j) = feval(funp,x(j));
    esterr(j-1) = abs(x(j)-x(j-1));
    imax = j;
    if esterr(j-1) < tol
        break;
    end
end

r = x(imax);
fprintf('Root is approximately %12.6e\n',r)
format short
