function dftcsfunctau(tau)
% dftcs - Program to solve the diffusion equation
% using the Forward Time Centered Space (FTCS) scheme.
%==========================================================================
%* Initialize parameters (time step, grid spacing, etc.).
%tau = 1e-4;
N = 61;
L = 1.;             % The system extends from x=-L/2 to x=L/2
h = L/(N-1);        % Grid size
kappa = 1.;         % Diffusion coefficient
nstep = 300;        % Maximum number of iterations
%==========================================================================
%* Test if the algorithm is expected to be stable
coeff = kappa*tau/h^2;
if( coeff < 0.5 )
  disp('Solution is expected to be stable');
else
  disp('WARNING: Solution is expected to be unstable');
end
%==========================================================================
%* Set initial and boundary conditions.
tt = zeros(N,1);           % Initialize temperature to zero at all points
tt(round(N/2)) = 1/h;      % Initial cond. is delta function in center
%tt(round(N/4)) = 1/h;     % Initial cond. is delta function at L/4

% The boundary conditions are tt(1) = tt(N) = 0

%==========================================================================
%* Set up plot variables.
xplot = (0:N-1)*h - L/2;   % Record the x scale for plots
iplot = 1;                 % Counter used to count plots
nplots = 50;               % Number of snapshots (plots) to take
plot_step = nstep/nplots;  % Number of time steps between plots

%==========================================================================
%* Loop over the desired number of time steps.
for istep=1:nstep  %% MAIN LOOP %%

  %* Compute new temperature using FTCS scheme.
  tt(2:(N-1)) = tt(2:(N-1)) + ...
      coeff*(tt(3:N) + tt(1:(N-2)) - 2*tt(2:(N-1)));

  %* Periodically record temperature for plotting.
  if( rem(istep,plot_step) < 1 )   % Every plot_step steps
    ttplot(:,iplot) = tt(:);       % record tt(i) for plotting
    tplot(iplot) = istep*tau;      % Record time for plots
    iplot = iplot+1;
  end
end
%==========================================================================
%* Plot temperature versus x and t as wire-mesh and contour plots.
figure(1); clf;
mesh(tplot,xplot,ttplot);  % Wire-mesh surface plot
xlabel('Time');  ylabel('x');  zlabel('T(x,t)');
title('Diffusion of a delta spike');
pause(1);
figure(2); clf;
contourLevels = 0:0.5:10;  contourLabels = 0:5;
cs = contour(tplot,xplot,ttplot,contourLevels);  % Contour plot
clabel(cs,contourLabels);  % Add labels to selected contour levels
xlabel('Time'); ylabel('x');
title('Temperature contour plot');
end

