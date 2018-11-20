f = @(x) x.*sin(x.^2).*tan(x);
Df = @(x) sin(x^2)*tan(x) + 2*x^2*cos(x^2)*tan(x) + x*sin(x^2)*(tan(x)^2 + 1);

var1 = newton2(10^-10,f,Df,-1,50);
var2 = newton2(10^-10,f,Df,-1,49);
var3 = newton2(10^-10,f,Df,-1,48);

e1 = var1 - var2;
e2 = var2 - var3;

m = 1/(1-(e1/e2))
%Wat levert dat de multipliciteit m gelijk is aan 4 voor de gegeven
%functie.