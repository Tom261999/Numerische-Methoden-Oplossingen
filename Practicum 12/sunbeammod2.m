function sunbeammod2()

%Speed of light in the atmosphere
c = 1;                   % speed of light in space
cEarth = 0.6*c;          % speed of light in air near the Earth's surface (exaggerated!)
rEarth = 1;              % Radius of the earth measured in radii of the earth
rAtmosphere = 2*rEarth;  % size of the atmosphere
lightSpeed = @(r) c - (c-cEarth)*exp(-(r-rEarth)/rAtmosphere);

%Prepare figure
figure
xmin = -2; xmax = 10; ymin = -2; ymax = 2;
axis([xmin,xmax,ymin,ymax],'equal')
hold on

%Show earth and intensity of the atmosphere
[xGrid,yGrid] = meshgrid( xmin:0.1:xmax, ymin:0.1:ymax );
intensity = 1-lightSpeed( sqrt(xGrid.^2+yGrid.^2) );
contourf(xGrid, yGrid, intensity, 20, 'EdgeColor', 'None'); colormap Bone
rectangle('Position', [-1,-1,2,2], 'Curvature', [1,1], 'FaceColor', 'b' ) %the earth

%Position on the earth with respect to the sun
%On subsolar point phi=0
phi = pi/3;

%Initial (straight) path with N-1 segments
N = 50;
x = linspace(cos(phi),xmax,N);
y0 = linspace(sin(phi),0,N);
dx = x(2)-x(1);

%Now we will minimize the total time (defined at the end)
Yvar = y0(2:end); %The first point is fixed and should not vary
Yvar = fminunc(@totalTime, Yvar);
Yvar(end) = Yvar(end-1); %Neumann
y = [y0(1), Yvar]; 

%Plot path of light
plot(x,y,'.-y')
hold on;

    function T = totalTime(Yvar)
        y = [y0(1), Yvar]; % add the ends so we obtain the full path
        dy = diff(y);
        r = sqrt(x.^2+y.^2);
        v = lightSpeed(r);
        vSegments = (v(1:end-1) + v(2:end))/2;
        T = sum( sqrt(dx^2+dy.^2) ./ vSegments );
    end


%eerste orde
h = dx;
m_first = (y(2)-y(1))/(h);
first = m_first*(x-x(1))+y(1)
first_order = plot(x,first,'--m');

%tweede orde
m_second = (-y(3)+4*y(2)-3*y(1))/(2*h);
second = m_second*(x-x(1))+y(1);
second_order = plot(x,second,'--c');

%axis settings
axis([-2 10 -2 2])

%legendes
legend([first_order second_order],{'First order','Second order'},'location','southeast')
title(legend,'Forward difference')
end