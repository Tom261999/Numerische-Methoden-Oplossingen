%%
clc, clear, close all
%%
%Voor verschillende waarden van tau:
disp('tau = 10^-3')
dftcsfunctau(10^-3)
pause(5)
disp('tau = 10^-4')
dftcsfunctau(10^-4)
pause(5)
disp('tau = 10^-5')
dftcsfunctau(10^-5)
pause(5)

%We zien dus dat voor te grote tijdstappen de oplossing onstabiel is. Voor
%te korte tijdstappen krijgen we echter te veel (onnodige) data en is deze
%ook vrij blokkig, waardoor de kwaliteit van de output laag is. We zoeken
%dus een tau die voldoende klein is voor stabiliteit maar groot genoeg voor
%nuttige data output.

%%
%We proberen voor enkele waarden van N:
disp('N=10')
dftcsfuncN(10)
pause(5)
disp('N=50')
dftcsfuncN(50)
pause(5)
disp('N=100')
dftcsfuncN(100)
pause(5)
%We zien dus dat voor kleine waarden van N we een stabiel algoritme hebben
%maar de resultaten blokkig zijn. Voor een te grote waarde van N kan het
%algoritme helemaal ontsporen. We kiezen N dus klein genoeg om stabiel te
%zijn maar groot genoeg voor voldoende details.

%%
%Verband met t_sigma
%We definieren de stapgrootte h als: h = L/(N-1)
%We definieren t_sigma als: t_sigma = h^2/2kappa
%Waarin t_sigma dan de nodige tijd is om sigma uit te laten dijen van 0 tot
%h (dus tot 1 gridstap). Waarbij sigma(t) = sqrt(2kappa*t). Deze sigma is
%de deviatie weer van de gausscurve dat de temperatuur in een punt
%weergeeft.
%
%De geplotte grafieken (indien stabiel) tonen niets anders dan een sterk
%gepiekte gausscurve dat uitdijt in de tijd.

%%
%Resultaat met BVW T(x,0)=delta(x-L/4)
dftcsbvwmod
%Dit geeft een analoog plot aan vorige opdrachten, echter zal de gausscurve
%hier bij het uitdijen stoten op de rand, waardoor het centrum van de
%gausscurve naar de pmositieve x-richting zal verplaatsen.