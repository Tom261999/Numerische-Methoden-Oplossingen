%Als extra oefening neem ik een bewegend deeltje in een oneindigdiepe
%potentiaalput waarvan de bodem bepaald wordt door een willekeurige
%functie. De functie is gedomstreerd voor enkele typische voorbeelden. Merk
%wel op dat de functie werkt op het domein [-0.5,0.5] opdat de waarden
%natuurlijk niet zouden exploderen voor N = 1000.

%%
disp('Bodem is gegeven door exp(x)')
close all
%Nota: close all is geïmplementeerd omdat 'position' wat gebruikt werd om
%de afmetingen van de figuur te definieren incompatibel is met de numerieke
%figuurlabeling. Met close all zorgen we er dan voor dat we geen explosie
%aan figuren krijgen na het runnen van dit script.
solution(@exp)
pause(3)
%We zien dat de functie intieel rustig de curve op gaat en terug af maar
%dan een harde botsing maakt met de oneindig hoge potentiaal aan de
%linkerkant van het domein.

%%
disp('Bodem is gegeven door 0.1*sin(pi*x)')
close all
solution(@(x) 0.1*sin(pi*x))
pause(3)
%Ook hier zien we dat de golf zachter botst op de linkerrand dan de
%rechterrand.

%%
disp('Bodem is gegeven door 0.1*cos(pi*x)')
close all
solution(@(x) 0.1*cos(pi*x))
pause(3)
%Voor de cosinus, een even functie met maximum op 0 zien we dat de functie
%langs beide kanten botst met de rand van het domein.

%%
disp('Bodem is gegeven door x^2')
close all
solution(@(x) x.^2)
pause(3)
%De even functie x^2 met een minimum op x=0 toont'zachtere' botsingen dan
%voorgaande gevallen met de rand, hierdoor is er minder effect van
%reflecties omdat dit gradueler gebeurt. Analoog aan hoe de golf zachtjes
%vand e exponentiele functie afgleed.

%%
disp('Bodem is gegeven door exp(x^2)')
close all
solution(@(x) exp(x.^2))
pause(3)
%Deze even vorm van de exponentiele functie met een minimum in x=0 geeft
%een analoog resultaat aan dat van x^2, maar met schijnbaar 'zachtere'
%botsingen met de rand omdat de functie zelf gladder is in de randpunten.
%(exp(x^2)>x^2 waardoor de overgang minder sterk is omdat er dan toch
%minder vand e golf overblijft.)

%%
disp('Bodem is gegeven door tan(1.5*x)')
close all
solution(@(x) tan(1.5*x))
pause(3)
Door de onevenheid van de tangens zien we (analoog aan het resultaat voor
%de sinus) dat we een vrij zachte botsing hebben rechts en een heel harde
%botsing links.

%%
disp('Bodem is gegeven door 150*(x-0.3)^2*(x+0.3)^2')
close all
solution(@(x) 10.*(x-0.3).^2.*(x+0.3).^2)
pause(3)
%De Mexican-hat potentiaal type geeft een botsing op beide randen maar ook
%een reflectie iedere keer dat de golf over het centrale maximum gaat. De
%kansdichtheden worden door de combinatie van maxima aan de randen en het
%centrale maximum erg grillig.

%%
%Opmerking: de functies zijn gedeeld door een constante opdat de waarden
%nuttig zijn als potentiaal -> zo zijn  de potentialen niet te hoog
%waardoor we nuttige resultaten kunnen verkrijgen.