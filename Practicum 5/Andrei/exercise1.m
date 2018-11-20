F=@(h,x)(sin(x+h)-sin(x-h))/(2*h);

Df=F(0.5,1)
%afgeleide via centraal verschill met stappen van 0.5
Dfhalve=F(0.25,1)
%afgeleide via centraal verschill met stappen van 0.25 (helft van 0.5)
Dfexact= cos(1)
%exacte afgeleide
a0=Df+(Df-Dfhalve)/(2^-2-1)
%afgeleide via richardson interpolatie
