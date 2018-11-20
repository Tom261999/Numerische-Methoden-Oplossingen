%methode va DuFort-Frankel voor tau=10-4
dftcsfuncDFF(10^-4,61,1,1,300)
%hier is het algoritme niet stabiel omwille van te grote waarde voor tau

%methode va DuFort-Frankel voor tau= 5*10-5
dftcsfuncDFF(5*10^-5,61,1,1,300)

%methode va DuFort-Frankel voor tau=10-5
dftcsfuncDFF(10^-5,61,1,1,300)

%methode va DuFort-Frankel voor tau=5*10-6
dftcsfuncDFF(5*10^-6,61,1,1,300)

%methode va DuFort-Frankel voor tau=10-6
dftcsfuncDFF(10^-6,61,1,1,300)

%methode va DuFort-Frankel voor tau=5*10-7
dftcsfuncDFF(5*10^-7,61,1,1,300)

%deze algoritme blijkt vrij stabiel te zijn voor klein genoeg gekozen Z
%waarden, daarentegen is hij veel nauwkeuriger dan de andere algoritmes.
%deze toont de piek van de delat functie veel beter.
