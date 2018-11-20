f = @(z) z.*tan(z);
g = @(z) -z.*cot(z);

fplot(f); hold on;
fplot(g,'k');

z0 = 1:20;

for i = 1:20
    h = @ (z) sqrt((i/2)^2-z.^2);
    hold on; fplot(h,'b-')
    j = @(z)f(z)-h(z);
    k = @(z)g(z)-h(z);
    A1(i) = bisect(20,j,0,pi/2);
    A2(i) = bisect(20,k,pi/2,pi);
    A3(i) = bisect(20,j,pi,3*pi/2);
    A4(i) = bisect(20,k,3*pi/2,4*pi/2);
    A5(i) = bisect(20,j,4*pi/2,5*pi/2);
end

axis([0 2*pi 0 2*pi]);

for i = 1:19
    if A2(i) ~= A2(i+1)
        B2 = A2(i+1:end);
        C2 = (i+1:20);
        break
    end
end
for i = 1:19
    if A3(i) ~= A3(i+1)
        B3 = A3(i+1:end);
        C3 = (i+1:20);
        break
    end
end
for i=1:19
    if A4(i) ~= A4(i+1)
        B4 = A4(i+1:end);
        C4 = (i+1:20);
        break
    end
end
for i = 1:19
    if A5(i) ~= A5(i+1)
        B5 = A5(i+1:end);
        C5 = (i+1:20);
        break
    end
end

hold all;
plot (A1,f(A1), 'ro');
plot (B2,g(B2), 'ro');
plot (B3,f(B3), 'ro');
plot (B4,g(B4), 'ro');
plot (B5,f(B5), 'ro')
xlabel('$z = a\cdot\sqrt{E}$','Interpreter','latex')

figure;
hold all;
xlabel('$z_0 = a\cdot\sqrt{V_0}$','Interpreter','latex')
ylabel('$z = a\cdot\sqrt{E}$','Interpreter','latex')
plot(z0,A1,'*-');
plot(C2,B2,'*-');
plot(C3,B3,'*-');
plot(C4,B4,'*-');
plot(C5,B5,'*-')
lev = pi/2:pi/2:5*pi/2;
fplot(lev,'k')
axis([0 20 0 5*pi/2])

clear