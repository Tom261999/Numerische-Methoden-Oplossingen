clear, close all

f=@(x) sin(x);
a=0;
b=pi/2;

%Deel 1
intf=trapiter(f,a,b,0)
intfhalf=trapiter(f,a,b,1)

disp('a_0='), disp(intf+(intf-intfhalf)/(2^-2-1))

%Deel 2
t00 = T(f,a,b,0,0);
t10 = T(f,a,b,0,0);

disp('T(0,0)='), disp(t00)
disp('T(1,0)='), disp(t10)
disp('T(1,1)='), disp(T(f,a,b,1,1))



disp('T_V(1,1)='), disp((4^1*t10-t00)/(4^1-1))
