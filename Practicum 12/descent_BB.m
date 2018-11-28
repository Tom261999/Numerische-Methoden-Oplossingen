function [x,xPath] = descent_BB(fun,x0,tol,maxSteps)
% An implementation of the gradient descent method
%
% Return values:
%   x        Computed position of a local minimum of function fun
%   xPath    All intermediate points on the path of descent
gamma=0.1;
x = x0;
xPath = x0;
for n = 1:maxSteps
    [fvalue,grad] = fun(x);
    G(n,:)=grad;
    if n>1
        s=xPath(n,:)-xPath(n-1,:);
        y=G(n,:)-G(n-1,:);
        alpha=sum(s.*s)/sum(s.*y);
    else
        alpha=gamma;
    end
    x = x - alpha*grad;
    xPath(n+1,:) = x;
    if norm(grad)<tol
        disp(sprintf("Tollerance reached after %d steps",n))
        return
    end
end
disp(sprintf("Reached maximum number of steps"))
end