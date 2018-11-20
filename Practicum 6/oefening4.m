clear, close all

%Parameters
sigma=10;
r=24.7;
b=8/3;

%Beginvoorwaarden
Xinitial=15;
Yinitial=12;
Zinitial=10;

%Tijd
t=[0 15];

f=@(t,X) [sigma*(X(2)-X(1)), r*X(1)-X(2)-X(1).*X(3), X(1).*X(2)-b*X(3)]';

y0=[Xinitial Yinitial Zinitial];

[T, Y]=ode45(f,t,y0);
[T2, Y2]=ode45(f,t,[15-0.0214 12+0.12 10-(pi/exp(1)-1)]);


%Figuren
figure('name',"X(Y) & X'(Y')")
subplot(1,2,1),plot(Y(:,1),Y(:,2))
title("X(Y)")
subplot(1,2,2),plot(Y2(:,1),Y2(:,2))
title("X'(Y')")

figure('name',"X(Z) & X'(Z')")
subplot(1,2,1),plot(Y(:,1),Y(:,3))
title("X(Z)")
subplot(1,2,2),plot(Y2(:,1),Y2(:,3))
title("X'(Z')")

figure('name','3D plot: (X,Y,Z)')
plot3(Y(:,1),Y(:,2),Y(:,3))
title("X Y Z")

figure('name',"3D plot: (X',Y',Z')")
plot3(Y2(:,1),Y2(:,2),Y2(:,3))
title("X' Y' Z'")

figure('name','X(t) & Y(t) & Z(t)')
subplot(1,3,1),plot(T,Y(:,1))
title("X(t)")
subplot(1,3,2),plot(T,Y(:,2))
title("Y(t)")
subplot(1,3,3),plot(T,Y(:,3))
title("Z(t)")

figure('name',"X'(t) & Y'(t), Z'(t)")
subplot(1,3,1),plot(T2,Y2(:,1))
title("X'(t')")
subplot(1,3,2),plot(T2,Y2(:,2))
title("Y'(t')")
subplot(1,3,3),plot(T2,Y2(:,3))
title("Z'(t')")
%We zien dus dat voor heel gelijkaardige beginvoorwaarden we al sterk
%verschillende uitkomsten vinden.

r2=1;
f2=@(t,X) [sigma*(X(2)-X(1)); r2*X(1)-X(2)-X(1).*X(3); X(1).*X(2)-b*X(3)];
[T3, Y3]=ode45(f2,t,[15 12 10]);

figure('name','X(Y) voor kleine r')
plot(Y3(:,1),Y3(:,2))
title("Xr(Yr)")

figure('name','X(Z) voor kleine r')
plot(Y3(:,1),Y3(:,3))
title("Xr(Zr)")

figure('name','3D plot (X,Y,Z) voor kleine r')
plot3(Y3(:,1),Y3(:,2),Y3(:,3))
title("Xr Yr Zr")
%We zien dat voor kleinere waarden van r we dus minder/vrijwel geen chaos
%hebben.
