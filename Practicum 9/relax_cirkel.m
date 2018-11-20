function relax_cirkel(method)
% relax - Program to solve the Laplace equation using
% Jacobi, Gauss-Seidel and SOR methods on a square grid
%clear all; %help relax;  % Clear memory and print header

%* Initialize parameters (system size, grid spacing, etc.)
%method = menu('Numerical Method','Jacobi','Gauss-Seidel','SOR');
%N = input('Enter number of grid points on a side: ');
N = 100
L = 1;          % System size (length)
h = L/(N-1);    % Grid spacing
x = (0:N-1)*h;  % x coordinate
y = (0:N-1)*h;  % y coordinate

%* Select over-relaxation factor (SOR only)
if( method == 3 )
%   omegaOpt = 2/(1+sin(pi/N));  % Theoretical optimum
%   fprintf('Theoretical optimum omega = %g \n',omegaOpt);
  omega = 1.5
end

%* Set initial guess as first term in separation of variables soln.
phi = zeros(length(x),length(y));

%Create grid defining the geometry of the sample
% % ggrid = zeros(length(x),length(y));
% % ggrid( round(N/3):round(2*N/3),: ) = 1;
% % ggrid( :,round(N/3):round(2*N/3) ) = 1;
r = 0.1; R = 0.4;
[X,Y] = meshgrid(linspace(-R,R,N));
rgrid = sqrt(X.^2+Y.^2);
ggrid = rgrid .*(rgrid < R);
ggrid = (r < ggrid)*1;

%* Set boundary conditions
% % phi(1,round(N/3):round(2*N/3)) = 1;
% % phi(end,round(N/3):round(2*N/3)) = -1;
% % phi(round(N/3):round(2*N/3),end) = 1/2;
phi = (R <= rgrid)*1

%* Loop until desired fractional change per iteration is obtained
newphi = phi;           % Copy of the solution (used only by Jacobi)
iterMax = N^2;          % Set max to avoid excessively long runs
changeDesired = 1e-4;   % Stop when the change is given fraction
fprintf('Desired fractional change = %g\n',changeDesired);
for iter=1:iterMax
  changeSum = 0;

  if( method == 1 )      %% Jacobi method %%
    for i=2:(N-1)        % Loop over interior points only
     for j=2:(N-1)
         if ggrid(i,j) == 1
            newphi(i,j) = .25*(phi(i+1,j)+phi(i-1,j)+ ...
                                phi(i,j-1)+phi(i,j+1));
            changeSum = changeSum + abs(1-phi(i,j)/newphi(i,j));
         end
     end
    end
    phi = newphi;

  elseif( method == 2 )  %% G-S method %%
    for i=2:(N-1)        % Loop over interior points only
     for j=2:(N-1)
         if ggrid(i,j) == 1
            newphi = .25*(phi(i+1,j)+phi(i-1,j)+ ...
                                phi(i,j-1)+phi(i,j+1));
            changeSum = changeSum + abs(1-phi(i,j)/newphi);
            phi(i,j) = newphi;
         end
     end
    end

  else                   %% SOR method %%
    for i=2:(N-1)        % Loop over interior points only
     for j=2:(N-1)
         if ggrid(i,j) == 1
            newphi = 0.25*omega*(phi(i+1,j)+phi(i-1,j)+ ...
                    phi(i,j-1)+phi(i,j+1))  +  (1-omega)*phi(i,j);
            changeSum = changeSum + abs(1-phi(i,j)/newphi);
            phi(i,j) = newphi;
         end
     end
    end
  end

  %* Check if fractional change is small enough to halt the iteration
  change(iter) = changeSum/(N-2)^2;
  if( rem(iter,10) < 1 )
    fprintf('After %g iterations, fractional change = %g\n',...
                            iter,change(iter));
  end
  if( change(iter) < changeDesired )
    fprintf('Desired accuracy achieved after %g iterations\n',iter);
	fprintf('Breaking out of main loop\n');
    break;
  end
end

meshphi = phi;
meshphi(ggrid == 0) = NaN;

%* Plot final estimate of potential as contour and surface plots
figure(1); clf;
cLevels = 0:(0.1):1;    % Contour levels
cs = contour(x,y,flipud(rot90(phi)),cLevels);
xlabel('x'); ylabel('y'); clabel(cs);
title(sprintf('Potential after %g iterations',iter));
figure(2); clf;
mesh(x,y,flipud(rot90(meshphi)));
xlabel('x'); ylabel('y'); zlabel('\Phi(x,y)');

%* Plot the fractional change versus iteration
figure(3); clf;
semilogy(change);
xlabel('Iteration');  ylabel('Fractional change');
figure(4); clf;
mesh(ggrid)
end