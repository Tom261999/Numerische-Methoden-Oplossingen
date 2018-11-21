clear, close all

%Voor verschillende waarden van de potentiaal & aantal geplotte
%eigenwaarden:
for U = [0.5 1 2 4 8]
    disp('Potentiaal U = '), disp(U)
    for n = 1:6
        findiffpot(U,n)
        pause(1)
    end
    pause(1)
end

