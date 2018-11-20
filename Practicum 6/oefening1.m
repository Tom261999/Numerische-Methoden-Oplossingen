clear, close all

slinger_Euler(pi/6,1);
%Het toepassen van de gegeven functie op de juiste waarden levert een sinus
%met toenemende amplitude, ten gevolge van de errors in de Euler methode.

slinger_Euler_Cromer(pi/6,1);
%Met een kleine verbetering zien we dat het plot veel accurater geworden
%is, we zien geen groei in amplitude over tijd zoals bij de gewone Euler
%methode.

Verlet(pi/6,1);
%De methode van Verlet geeft ook een accuraat plot.