clear, close all

f = @(x) exp(x)./(x.^(1/3));
a = 0; b = 1;

gamma = -1/3;
beta = 1/(1+gamma);
t = @(x) (x-a).^(1/beta); %nieuwe bovengrens
G = @(T) f(a+T.^beta).*beta.*T.^(beta-1);
I = splint(G,t(a+eps),t(b),1000);

figure, hold on
fplot(@(x) G(t(x)))
fplot(f)
axis([0,1,0,5])
legend('e^x/x^{1/3}','G(t)')
title('integratie van singulariteiten')

disp('De exacte waarde van de integraal:'), disp('2.343591093325967745322298443044898517330092172886535811942')
disp('De berekende waarde met correctie:'), disp(I)