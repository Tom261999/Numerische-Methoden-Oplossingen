

f=@(x) sin(x);
a=0;
b=pi/2;
%deel 1
intf=trapiter(f,a,b,0)
intfhalf=trapiter(f,a,b,1)

a0=intf+(intf-intfhalf)/(2^-2-1)
%deel 2
disp('T(0,0)='), disp(T(f,a,b,0,0))
disp('T(1,0)='), disp(T(f,a,b,1,0))
disp('T(1,1)='), disp(T(f,a,b,1,1))

disp('T_V(1,1)='), disp((4^1*t10-t00)/(4^1-1))

