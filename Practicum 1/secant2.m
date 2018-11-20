function r = secant2(tol,fun,x1,x2,maxiter)
% Secant method
% Tolerance, function, derivative
% and initial value must be given.
% Maximum 50 iterations displayed.
format short e

x(1) = x1; x(2) = x2;
y(1) = feval(fun,x(1));
y(2) = feval(fun,x(2));
for i = 3:maxiter
    x(i) = x(i-1)-y(i-1)*(x(i-1)-x(i-2))/(y(i-1)-y(i-2));
    y(i) = fun(x(i));
    esterr(i-1) = abs(x(i)-x(i-1));
    imax = i;
    if esterr(i-1) < tol
        fprintf('Error tolerance met at i=%2.0f\n',i-1)
        break
    end
end
disp('  i            x(i)         f(x(i))      x(i+1)-x(i)')
for k = 1:imax-1
    disp([k,x(k),y(k),esterr(k)])
end
r = x(imax);
fprintf('Root is approximately %12.6e\n',r)
format short