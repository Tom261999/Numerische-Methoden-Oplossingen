help bar

%%Voorbeeld 1
%
%Deel 1 (DemoFFT1.m)
%(a)
%*Figuur 1 plot de functie waarop de FFT op toegepast zal worden samen met
%de gesampelde punten.
%*Figuur 2 toont enkel de waarden van Y berekend door de FFT, die symmetrisch is
%rond de Nyquist frequentie. Dit is een gevolg van de formule f1+f2=2fmax
%--> f2=2fmax-f1 wat een spiegeling rond fmax geeft zowel in het reele als
%complexe!
%*Figuur 3 geeft het reele, complexe en de modulus (absolute waarde) van Y.
%De grafiek van de reele waarden geeft de waarden voor de frequentie en
%amplitude van de cosinus functie. De grafiek van de complexe waarden
%analoog maar dan dan voor de sinus. De grafiek met moduli geeft weer welke
%frequenties er in de trilling zitten + hun amplituden.
%(b)
%'real(Yss)' geeft de waarden voor frequentie en amplituden van de cosinus
%functies. Analoog geeft 'imag(Yss)' de frequenties en amplituden voor de
%sinus functies. 
%(c)
%De formules geven dat er voor een zekere sample-rate een verdubbeling van
%de frequentie te verwachten is. Er zouden dus extra frequenties gevonden
%worden op: f1+f2=2fmax en f1-f2=2fmax.
%(d)
%Enkel de waarden tussen 0 en de Nyquist frequentie zijn van belang omdat
%de frequenties groter dan de Nyquist frequentie "spiegelingen" zullen zijn
%van de frequenties die voor de Nyquist frequentie komen. Dus we gebruiken
%alleen de waarden vóór de Nyquist freq. en de Nyquist freq. zelf
%=> n/2+1=64/2+1=33
% 
%Deel 2 (DemoFFT1alt.m)
%(a)
%*f2=7Hz: De curve dat de frequenties weergeeft is eerder continu dan
%discreet, omdat er nu een klein verschil is tussen 2*f1 en f2 waardoor de
%sinussen en cosinussen een soort zweving vertonen.
%*f2=7.5Hz: We vinden curves gelijkaardig aan de originele, waarbij de
%frequenties duidelijk discreet verdeeld zijn.
%(b)
%Bij punten die niet op de 2^n aanwezig waren was er een verschuiving van
%de piek van de frequentie bij de 2de golflengte. Het minder efficiente
%algoritme van MATLAB zou hier verantwoordelijk voor zijn, dat steeds een
%kleiner gebied neemt en steeds halveert in grootte, waardoor alleen de 2^n
%gebieden efficient benut worden.
%(c)
%Zoals eerder gezegd speelt de Nyquist freq. een grote rol, stel nu
%f1-f2=fmaxl,  met bv f1=0Hz & f2=105Hz. Als je dan weet fmax=10Hz, dan
%komt dit overeen met de Nyquist freq. waardoor deze frequentie dominant
%zal zijn in het frequentiespectrum, de andere frequenties meegebracht door
%105Hz zullen groter zijn dan de Nyquist freq. en dus niet relevant zijn.
%(d)
%De kortere sampletijd zal wel de frequentie van 105Hz opmeten, maar
%kleinere frequenties als 3.75 Hz helemaal niet omdat dit langer is dan de
%sampletijd zelf. Je kan beter de samplerate verhogen en sampletijd
%behouden. Dit maakt de meting nauwkeuriger, dit zal echter wel wat trager
%zijn.
%
%
%%Voorbeeld 2 (DemoFFT2.m & DemoFFT2alt.m)
%Door het toevoegen van de ruis is het signaal niet meer waar te nemen, dit
%komt door de grote standaardafwijking in de gegenereerde ruis ten
%opzichten van de grootte van het signaal. Hierdoor is het gehele signaal
%gereduceerd tot ruis en is de data onbruikbaar.
%
%
%%Voorbeeld 3 (DemoFTT1alt2.m)
%Door analoog aan voorgaande oefeningen te werken vinden we:
%[a0 a1 a2] = [-20 10 -2]
