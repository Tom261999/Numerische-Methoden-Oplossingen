f = @(x) 1+x.^2-tan(x);
secant(10^-5,f,1,1.4)

%Wat het juiste antwoord 1.1721 levert.

%%testen van convergentiesnelheden:
Df = @(x) 2.*x-(sec(x)).^2;

alpha = fzero(f,1);

for n = 2:50
    A(n-1) = log(abs(newton2(10^(-10),f,Df,1,n)-alpha));
    B(n-1) = log(abs(bisect(n,f,1,1.4)-alpha));
    C(n-1) = log(abs(secant2(10^(-10),f,1,1.4,n+3)-alpha));
end
for n = 1:48
    XA(n) = A(n);
    YA(n) = A(n+1);
    XB(n) = B(n);
    YB(n) = B(n+1);
    XC(n) = C(n);
    YC(n) = C(n+1);
end
plot(XA,YA,'b.-','MarkerSize',13); hold on; 
plot(XB,YB,'r.-','MarkerSize',13); hold on;
plot(XC,YC,'g.-','MarkerSize',13)
legend('Newton methode','Bisect methode','Secant methode')

%Uit het gegenereerde plot volgt dan eenvoudig dat de rate of convergence
%het grootst is voor de newton methode, daarna de secant methode en het laagst voor de bisect methode.