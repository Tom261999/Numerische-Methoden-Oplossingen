clear, close all

f = @(x) x.^(7/4).*exp(x)./((sinh(x)).^2);
a = 0; b = 1;

gamma = -1/4; %gamma gevonden via taylor
beta = 1/(1+gamma);
t = @(x) (x-a).^(1/beta);
G = @(T) f(a+T.^beta).*beta.*T.^(beta-1);
I = splint(G,t(a+eps),t(b),10000);

figure, hold on
fplot(@(x) G(t(x)))
fplot(f)
axis([0,1,0,5])
legend('x^{7/4}\cdot exp(x)/(((sinh(x))^2)','G(t)')
title('integratie van moeilijke functie')

disp('De exacte waarde van de integraal:'), disp('1.913146675663268')
disp('De berekende waarde met correctie:'), disp(I)