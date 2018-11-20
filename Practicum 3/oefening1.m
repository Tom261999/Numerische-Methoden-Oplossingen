f = @(z) 1./(1+z.^2);
x1 = -5:5;
x2 = -5:0.01:5; %fijner grid voor evaluatie van de fits
y = feval(f,x1);

%%Deel 1: fitten van polynoom
ypoly = polyval(polyfit(x1,y,10),x2);

plot(x1,y,'k*'); hold on;
plot(x2,ypoly)
title('10de graads polynoom')


%%Deel 2: spline
yspline = spline(x1,y,x2);

figure
plot(x1,y,'k*'); hold on;
plot(x2,yspline)
title('spline')

clear