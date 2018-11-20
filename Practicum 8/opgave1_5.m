clear, close all

stap = [0.0001 0.001 0.01 0.1];
for i = 1:length(stap)
    disp('tau = '), disp(stap(i))
    advectlaxwendrofffunctau(stap(i))
    pause(5)
end
clear stap i

%We zien nu dat de artificiele diffusie weggeholpen is.