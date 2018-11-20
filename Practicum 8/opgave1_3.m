clear, close all

stap = [0.0001 0.001 0.01 0.1 1];
for i = 1:length(stap)
    disp('tau = '), disp(stap(i))
    advectfunctau(stap(i))
    pause(5)
end
clear stap i

%We zien dat we voor kleine waarden van tau een duidelijk plot krijgen
%waarbij de beginstaat vrijwel gelijk is aan de eindstaat. Dit is niet meer
%het geval voor tau >= 0.01 waar we een duidelijk verschil zien tussen
%begin en eindtoestand, die enorm instabiel is.

%Nota tau_max = 0.01, vandaar de instabiliteit voor tau > 0.01