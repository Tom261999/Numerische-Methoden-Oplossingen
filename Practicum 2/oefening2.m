x = [1:0.5:4.5];
y = [4.3 6.2 10.1 13.5 19.8 22.6 24.7 29.2];
plot(x,y,'.k','MarkerSize',13)

for i = 1:4 
    for j = 1:4
        C(i,j) = sum(x.^(i+j-2));
    end
    D(i,1)=sum(y.*(x.^(i-1)));
end

clear i j

E = C\D

x2=[0:0.1:6];
Y = polyval(fliplr(E'),x2)

hold on
plot(x2,Y,'r--')

clear

%Wat het gevraagde plot levert.