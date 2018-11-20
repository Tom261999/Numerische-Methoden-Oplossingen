figure
[x,y]=ginput;

close all

t = [1:length(x)]'; %x en y functies van t
t2 = [1:0.01:length(x)]; %fijner grid voor variabele t

%%Deel 1: fit met polynoom
xpoly = polyval(polyfit(t,x,length(x)-1),t2);
ypoly = polyval(polyfit(t,y,length(x)-1),t2);

plot(xpoly,ypoly)
title('Polynoom')
axis equal

%%Deel 2: fit met spline
xspline = spline(t,x,t2);
yspline = spline(t,y,t2);

figure
plot(xspline,yspline)
title('Spline')
axis equal

clear

%We merken duidelijk op dat de spline een betere kopie van een hand maakt
%dan de polynoom. (Wat niet zo verwonderlijk is...)