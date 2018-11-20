f = @(x) 1+x.^2+tan(x);
bisect(25,f,1,1.4)

%Wat het juiste resultaat 1.1721 oplevert.