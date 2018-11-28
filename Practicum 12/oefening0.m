for i = [0.1 0.2 0.3 0.4 0.5]
    descentExamplefunc(i)
    pause(2)
end

%We zien dat voor stijgende waarden van gamma het algoritme instabieler
%wordt, voor gamma = 0.5 zien we zelfs dat dit volledig ontspoort en de
%error op het resultaat ontploft.