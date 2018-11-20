%deel 1 integraal exact
a=-1; 
b=3;
c=(a+b)/2;
h=(b-a)/2;
f=@(x) x.^3-x+5;
fint=@(x) 1/4.*x.^4-1/2.*x.^2+5.*x;
integexact=feval(fint,b)-feval(fint,a);
simpsoninteg=1/3*h*(feval(f,a)+4*feval(f,c)+feval(f,b));
lagrpoly=@(x) feval(f,a).*((x-b).*(x-c))./((a-b).*(a-c))+feval(f,c).*((x-a).*(x-b))./((c-a).*(c-b))+feval(f,b).*((x-a).*(x-c))./((b-a).*(b-c));
dif=@(x)feval(f,x)-feval(lagrpoly,x);
figure(1)
fplot(f)
hold on
fplot(lagrpoly)
hold on
fplot(dif)
axis([a-1 b+1 -5  35])
legend('P_2=lagrpoly','f(x)= x^3-x+5','f(x)-P_2','location','best')

Integp1=integspl(dif,a,c,5)
Integp1=integspl(dif,c,b,5)
