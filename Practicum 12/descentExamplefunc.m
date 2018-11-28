function descentExamplefunc(gamma)
% In this script we study the gradient descent on myQuadraticFunction
% defined at the bottom of the script.

% clear all

% plot myQuadraticFunction
figure; subplot(121); xlabel('x'); ylabel('y'); hold on
[xGrid,yGrid] = meshgrid(-30:0.5:20,-30:0.5:20);
fValues       = myQuadraticFunction(xGrid,yGrid);
nContours     = 20;
contourf(xGrid, yGrid, fValues, nContours)

% find the minimum of myQuadraticFunction
xInitial  = [-25,-25];
% gamma     = 0.1;
maxSteps  = 1000;
tol       = 1e-5;
[x,xPath] = descent(@myQuadraticFunctionWrapper, xInitial, gamma, tol, maxSteps);

% plot path of descent
plot(xPath(:,1),xPath(:,2),'.-r','MarkerSize',10)

% plot the error on a new subplot
subplot(122);
xMinExact = [4,1]; % calculated analytically
error = sqrt(sum((xPath-xMinExact).^2,2));
semilogy(error,'.-');
xlabel('step'); ylabel('error');



%------------------------------------------------------------------

function [fValue,xDerivative,yDerivative] = myQuadraticFunction(x,y)
fValue      =  x.^2 + 2*y.^2 - x.*y - 7*x;
xDerivative = 2*x - y - 7;
yDerivative = 4*y - x;
end

function [fValue,grad] = myQuadraticFunctionWrapper(q)
% This is a wrapper of the myQuadraticFunction so that it accepts the
% input arguments x and y as a vector q=[x,y], and returns the gradient
% as a vector.
[fValue, xDerivative, yDerivative] = myQuadraticFunction(q(1),q(2));
grad = [xDerivative, yDerivative];
end
end