%Exercise4
s=10;
r=24.7;
b=8/3;
Xinit=15;
Yinit=12;
Zinit=10;
Tspan=[0 15];
f=@(t,X) [s*(X(2)-X(1)); r*X(1)-X(2)-X(1).*X(3); X(1).*X(2)-b*X(3)];
y0=[Xinit Yinit Zinit];
[Tout Yout]=ode45(f,Tspan,y0);
[Tout2 Yout2]=ode45(f,Tspan,[15+0.1 12+0.1 10-0.1]);

figure()
subplot(1,2,1),plot(Yout(:,1),Yout(:,2))
title("X(Y)")
subplot(1,2,2),plot(Yout2(:,1),Yout2(:,2))
title("X'(Y')")

figure()
subplot(1,2,1),plot(Yout(:,1),Yout(:,3))
title("X(Z)")
subplot(1,2,2),plot(Yout2(:,1),Yout2(:,3))
title("X'(Z')")

figure()
plot3(Yout(:,1),Yout(:,2),Yout(:,3))
title("X Y Z")

figure()
plot3(Yout2(:,1),Yout2(:,2),Yout2(:,3))
title("X' Y' Z'")

figure()
subplot(1,3,1),plot(Tout,Yout(:,1))
title("X(t)")
subplot(1,3,2),plot(Tout,Yout(:,2))
title("Y(t)")
subplot(1,3,3),plot(Tout,Yout(:,3))
title("Z(t)")

figure()
subplot(1,3,1),plot(Tout2,Yout2(:,1))
title("X'(t')")
subplot(1,3,2),plot(Tout2,Yout2(:,2))
title("Y'(t')")
subplot(1,3,3),plot(Tout2,Yout2(:,3))
title("Z'(t')")

r2=5;
f2=@(t,X) [s*(X(2)-X(1)); r2*X(1)-X(2)-X(1).*X(3); X(1).*X(2)-b*X(3)];
[Tout3 Yout3]=ode45(f2,Tspan,[15 12 10]);

figure()
plot(Yout3(:,1),Yout3(:,2))
title("Xr(Yr)")

figure()
plot(Yout3(:,1),Yout3(:,3))
title("Xr(Zr)")

figure()
plot3(Yout3(:,1),Yout3(:,2),Yout3(:,3))
title("Xr Yr Zr")
