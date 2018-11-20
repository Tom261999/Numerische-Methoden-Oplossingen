clear, close all

x = [1.0 1.4 2.1 2.6 3.7 4.6 5.2 6.8];
y = [-4.71 -3.53 -1.88 -1.31 0.11 0.18 0.97 1.89];

plot(x,y,'k.','MarkerSize',12), title('Plot van Data')
figure
semilogx(x,y,'k.','MarkerSize',12), title('Logplot op x-as')

%We zullen de datapunten fitten met een 2de graadsfunctie en een
%logaritmische functie.

x1 = [0.8:0.1:7]; %fijner grid voor evualite van de fits

%Kwadratische functie
yq = polyval(polyfit(x,y,2),x1);

%Logaritmische fit
xlog = log(x);
logco = polyfit(xlog,y,1);
f = @(t) logco(2)+logco(1).*log(t);

%plot van de fits
figure
plot(x,y,'k.','MarkerSize',12), title('Data met fits')
hold all
plot(x1,yq,'b-.'), plot(x1,feval(f,x1),'r--')
legend('Data','Kwadratische fit','Logaritmische fit','Location','southeast')

%Bepalen beste fit
quadlsm = polyval(polyfit(x,y,2),x)-y;
loglsm = feval(f,x)-y;
quadres = 0;
logres = 0;
for i = 1:length(x)
    quadres = quadres + quadlsm(i).^2;
    logres = logres + loglsm(i).^2;
end
disp('Residu van kwadratische fit:')
disp(sqrt(quadres))
disp('Residu van logaritmische fit:')
disp(sqrt(logres))
%Het residu van de logaritmische fit is het kleinst, deze is dus de beste
%fit.