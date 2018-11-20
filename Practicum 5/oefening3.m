clear, close all

f = @(t) sin(t.^2).*exp(-t.^2); %0.5703705559915791 is juist antwoord (van - tot + oneindig)

fplot(f)

format long
disp('f(-30)=f(30)=')
disp(f(-30))
disp('We zien dus dat voor f(-30) en f(30) (en waarden verder van het centrum)')
disp('de functie gelijk is aan nul door underflow.')
disp('We zullen dus op het interval [-30,30] integreren.')

x = linspace(-30,30,300);
y = f(x);

spdata = spline(x,y);

[breaks,spcoef,pieces,order,dim] = unmkpp(spdata);
h = diff(x)';
integraal = sum(1/4*spcoef(:,1).*h.^4+1/3*spcoef(:,2).*h.^3+1/2*spcoef(:,3).*h.^2+spcoef(:,4).*h)