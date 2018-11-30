function [x,xPath] = descent(fun,x0,gamma,tol,maxSteps)
% An implementation of the gradient descent method
%
% Return values:
%   x        Computed position of a local minimum of function fun
%   xPath    All intermediate points on the path of descent
x = x0;
xPath = x0;
for n = 1:maxSteps
    [fvalue,grad] = fun(x);
    x = x - gamma*grad;
    xPath(n+1,:) = x;
    if norm(grad)<tol
        disp(sprintf("Tollerance reached after %d steps",n))
        return
    end
end
disp(sprintf("Reached maximum number of steps"))
end