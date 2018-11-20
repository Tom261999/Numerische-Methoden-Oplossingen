%%part a
%Zie regfals.m voor aangepast script.

%%part b
f = @(x) 1+x.^2-tan(x);
regfals(1000,f,1,1.4)
%Wat het antwoord geeft gevonden in oefening 1 (1.1721).
