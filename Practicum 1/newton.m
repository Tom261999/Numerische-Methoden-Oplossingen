function r = newton(tol,fun,funp,x1)
% Newton Method
% Tolerance, function, derivative
% and initial value must be given.
% Maximum 50 iterations displayed.
format short e
maxiter = 500; x(1) = x1;
y(1) = fun(x(1));
yp(1) = funp(x(1));
for i = 2:maxiter
    x(i) = x(i-1)-y(i-1)/yp(i-1);
    y(i) = fun(x(i));
    yp(i) = funp(x(i));
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