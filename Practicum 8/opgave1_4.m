clear, close all

taumax = 0.01;
stap = linspace(taumax,0.0001,5);
for i = 1:length(stap)
    disp('tau = '), disp(stap(i))
    advectlaxfunctau(stap(i))
    pause(5)
end
clear stap i

%We zien dat deze oplossing stabiel is, maar voor waarden kleiner dan
%tau_max zien we een artificiele diffusie.