clear, close all

disp('tau = 10^-3')
dftcsfuncDuFort_Frankeltau(10^-3)
pause(5)
disp('tau = 10^-4')
dftcsfuncDuFort_Frankeltau(10^-4)
pause(5)
disp('tau = 10^-5')
dftcsfuncDuFort_Frankeltau(10^-5)
pause(5)
disp('tau = 10^-6')
dftcsfuncDuFort_Frankeltau(10^-6)
pause(5)
disp('tau = 10^-10')
dftcsfuncDuFort_Frankeltau(10^-10)
%Voor kleine tau zal dit algoritme stabiel zijn, maar het is niet erg
%nauwkeurig. We zien dat de delta-piek vrijwel niet uitdijt. Deze methode
%is dus niet geschikt voor het oplossen van dit probleem.