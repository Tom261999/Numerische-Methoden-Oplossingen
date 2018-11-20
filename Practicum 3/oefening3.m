x = 1:10;
y = round(10*rand(1,10));

spdata = spline(x,y)
%Het commando geeft een struct (structure) met :
% form: 'pp' -> piecewise polynomial
% breaks: [1 2 3 4 5 6 7 8 9 10] -> vector met lengte L+1 met strict stijgende elementen dat het begin en einde van ieder interval L weergeven
% coefs: [9x4 double] -> LxK matrix waarbij iedere rij coefs(i,:) de locale coefficienten bevat van een Kde orde polynoom op het  
% pieces: 9 -> Aantal stukken L
% order: 4 -> orde van de polynomen
% dim: 1 -> dimensionaliteit van het doel

%Opsplitsen van de struct in bruikbare matrices/variabelen:
[breaks,spcoefs,pieces,order,dim] = unmkpp(spdata)

spcoefs %d_j=y_j want we willen dat alles 0 wordt en enkel de coefficient d_j overblijft voor x_j zodat de curve door het punt (x_j,y_j) gaat.
%a_1 = a_2 & a_{n-2} = a_{n-1} omdat dat de beginvoorwaarden voor het
%systeem zijn.

%Voorbeeld uit opgaven:
disp('Voorbeeld uit opgaven:')
clear
breaks = [1 2 6];
coef = [2 -4 ; 3 6];

lindata = mkpp(breaks,coef)
xi = [1:0.1:6];
yi = ppval(lindata,xi);
plot(xi,yi)

clear

%Toepassen op testdataset:
x = [1.0 2.3 3.1 4.0 5.2 5.9 6.7];
y = [1.7 2.8 3.6 4.5 3.4 3.1 3.1];

[breaks,spcoefs,pieces,order,dim] = unmkpp(spline(x,y));
data = mkpp(breaks,spcoefs);

for i = 1:length(spcoefs)
    derspcoefs(i,:) = polyder(spcoefs(i,:));
end

data1 = mkpp(breaks,derspcoefs);

xi = [min(breaks):0.1:max(breaks)];
yi = ppval(data,xi);
yi1 = ppval(data1,xi);

figure
plot(x,y,'k.','MarkerSize',10); hold on;
plot(xi,yi,'-'); hold on;
plot(xi,yi1)
legend('Gegeven punten','Spline','Afgeleide van spline')

clear