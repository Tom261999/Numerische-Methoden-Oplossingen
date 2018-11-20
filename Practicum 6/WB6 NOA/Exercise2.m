%Starting conditions
K1 = 2;
K2 = 10;
C = 0.001;
D = 0.002;
%Preparing the variables for ode45
Tspan=[0;10];
f=@(t,P) [K1*P(1)-C*P(1)*P(2) ; -K2*P(2)+D*P(1)*P(2)]
Y0=[5000;100]
%Applying ode45
ode45(f,Tspan,Y0)
%The graph shows us the logical relationship between predator and prey.
%We notice how it is periodic because a large concentration of pref causes
%an increase in predators, which in turn causes a decrease in prey, which
%causes a decrease in predators, which causes an increase in prey, etc...
