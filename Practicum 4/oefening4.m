clear, close all

x = linspace(-20,20,100);
y = linspace(-20,20,100);

[X,Y] = meshgrid(x,y);

Z = sin((sqrt(X.^2+Y.^2)))./(sqrt(X.^2+Y.^2)+eps);

subplot(2,2,1)
mesh(X,Y,Z), title('Mesh')
subplot(2,2,2)
surf(X,Y,Z), title('Surf')
subplot(2,2,3)
contour(X,Y,Z), title('Contour')
axis equal
subplot(2,2,4)
contourf(X,Y,Z), title('Contourf')
axis equal

%Maximaliseer het venster van de plots voor het beste resultaat.