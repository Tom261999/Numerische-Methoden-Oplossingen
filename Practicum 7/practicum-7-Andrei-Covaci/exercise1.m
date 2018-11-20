% deel 1
%we laten hier dftcs voor een paar verschillende waarden 
%voor tau lopen met telkens N=61
%tau=10^-5
dftcsfunc(10^-5,61,1,1,300)


%tau=5*10^-5
dftcsfunc(5*10^-5,61,1,1,300)


%tau=10^-4
dftcsfunc(10^-4,61,1,1,300)


%tau=5*10^-4, vanaf hier is het niet meer stabiel
dftcsfunc(5*10^-4,61,1,1,300)


%tau=10^-3, hier ook is het algoritme niet stabiel
dftcsfunc(10^-3,61,1,1,300)


%%
%deel 2

%we laten hier dftcs voor een paar verschillende waarden 
%voor N lopen met telkens tau=10^-4

%N=30
dftcsfunc(10^-4,30,1,1,300)
%N=40
dftcsfunc(10^-4,40,1,1,300)
%N=50
dftcsfunc(10^-4,50,1,1,300)
%N=70
dftcsfunc(10^-4,70,1,1,300)
%N=80, vanaf hier is het algoritme al onstabiel
dftcsfunc(10^-4,80,1,1,300)
%N=90, hier is het algoritme ook onstabiel
dftcsfunc(10^-4,90,1,1,300)

%%
% t_sigma wordt gegeven door h^2/(2*kappa) en komt overeeen met de tijd nodig
% voor de sigma functie (met sigma(t)=sqrt(2*kappa*t)) van breedte van 0 naar
% een breedte van h gaat. de tijdstappen tau zou dus niet groter mogen zijn
% dan t_sigma, als dat niet het geval is de algoritme onstabiel.
% Aangezien dat t_sigma afhangt van h en die zelf afhangt van 
% N is het dus belangrijk dat N en tau goedgekozen zijn.

%%
dftcsfuncmod1(10^-4,61,1,1,300)
%de plot voor T(x, 0) = delta(x-L/4).
