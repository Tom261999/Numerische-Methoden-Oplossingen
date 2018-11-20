clear, close all
%Data electron
load dataelectron.dat
x = dataelectron(:,1);
y = dataelectron(:,2);
z = dataelectron(:,3);

[X,Y] = meshgrid([min(x):0.5:max(x)],[min(y):0.5:max(y)]);

Z = griddata(x,y,z,X,Y,'cubic');

mesh(X,Y,Z), title('Dataelectron')

%Data hole
load datahole.dat
x = datahole(:,1);
y = datahole(:,2);
z = datahole(:,3);

[X,Y] = meshgrid([min(x):0.5:max(x)],[min(y):0.5:max(y)]);

Z = griddata(x,y,z,X,Y,'cubic');

figure
mesh(X,Y,Z), title('Datahole')