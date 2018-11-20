%De functie J(x) (jacobiaan) voor het gegeven stelsel:
J = @(x) [1,2;2*x(1),8*x(2)];

%Het gegeven stelsel:
f = @(x) [x(1)+2*x(2)-2;x(1)^2+4*x(2)^2-4];

%We gebruiken de aanpassing van Newton voor niet-lineare stelsels:
disp('De 2 oplossingen van het stelsel:')
X = nonlinnewton(f,J,[1,0],500)
X = nonlinnewton(f,J,[1,2],500)

clear X

%We zien dat er 2 oplossingen moeten zijn mbv volgende grafiek: (de
%snijpunten van de 2 lijnen)
hold all;
fplot(@(x) -2*x+2);
fplot(@(x) sqrt(-4*x^2+4))
axis([-2 2 -1 3]);
xlabel('x_2');
ylabel('x_1');