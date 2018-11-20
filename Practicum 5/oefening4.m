clear, close all

f = @(x) x.^3-x+5; 
Intexact = 36; %Juiste waarde integraal = 36

a = -1; b = 3;
c = (b+a)/2;
h = (b-a)/2;

x = [a c b];

S2 = 1/3*h*(f(a)+4*f(c)+f(b)); %Simpson 2 (zie cursus)
LP2 = @(t) f(a).*((t-b).*(t-c))./((a-b).*(a-c))+f(c).*((t-a).*(t-b))./((c-a).*(c-b))+f(b).*((t-a).*(t-c))./((b-a).*(b-c)); %Lagrange polynoom

v = @(t) f(t)-LP2(t); %Verschil tussen f en lagrange polynoom

figure, hold on
fplot(LP2)
fplot(f)
plot(x,f(x),'k.','MarkerSize',14)
fplot(v)
legend('LP2 polynoom','x^3-x+5','punten a, b en c','f(x)-LP2','Location','northwest')
axis([a-2 b+2 -5 max(f(x))+5])
title('S2 integratie van polynoom')

Int1 = splint(v,a,c,5); %integraal uitrekenen van het verschil
Int2 = splint(v,c,b,5);

disp('De exacte waarde van de polynoom:'), disp(Intexact)
disp('De berekende waarde met Simpson2:'), disp(S2)
disp('Integraal verschil op interval 1:'), disp(Int1)
disp('Integraal verschil op interval 2:'), disp(Int2)