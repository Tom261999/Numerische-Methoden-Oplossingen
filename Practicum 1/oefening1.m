%%part b
g = @(x) 1+x.^2; h = @(x) tan(x);
fplot(g); hold on; fplot(h)

f = @(x) g(x)-h(x);

%%part c
bisect(25,f,1,1.4)
%Wat het antwoord 1.1721 levert.

%%part d
ceil((log(1.4-1)-log(10^-5))/log(2))
%Wat geeft dat we ten minste 16 iteraties nodig hebben om de juiste
%nauwkeurigheid te verkrijgen.

%Het aantal nodige iteraties is afhankelijk van de afstand tussen a en b,
%indien deze groter is zal i ook groter moeten zijn voor een zelfde
%precisie.

%%part e
bisect(25,f,-2,-1.6)
%Wat het antwoord -1.8020 levert.
