%%
figure('name','Euler')
orbe(1,2*pi,0.02)
%Het toepassen van het gegeven script en waarden geeft een plot van de baan
%van de komeet. We merken echter op dat deze baan niet stabiel is en naar binnen spiraalt, terwijl deze baan volgens de
%beginvoorwaarden wel stabiel hoort te zijn.

%%
figure('name','Euler-Cromer')
orbealt(1,2*pi,0.02)
%Een beter restulaat dan eerst, maar we zien nog steeds fluctuaties in de
%potentiele energie die hier niet thuis horen. We besluiten dus dat de
%methode van Euler-Cromer niet de beste benadering is voor dit probleem!

%%
figure('name','Euler-Cromer: positieve energie(?)')
orbealt(1,pi,0.02)
%Positieve energie toont ons dat de komeet genoeg totale energie heeft om
%te ontsnappen aan potentiaalput gegeven door de zon!

%%
figure('name','Euler-Cromer: kleinere tijdstappen')
orbealt(1,pi,0.005)
%Met kleinere tijdstappen zien we echter dat de energie helemaal niet
%positief was, de komeet blijft dus in ons systeem. We zien dus dat ons
%algoritme niet perfect is, de grote tijdstappen zorgden ervoor dat een
%fout in de berekening van de energie ervoor zorgde dat deze enorm toenam.
%We zien dus dat we een beter algoritme nodig zullen hebben voor dit type
%taken.