f = @(x) 1+x.^2-tan(x);
Df = @(x) 2.*x-(sec(x)).^2;

alpha = fzero(f,1);

for n = 2:50
    A(n-1) = log(abs(newton2(10^(-10),f,Df,1,n)-alpha));
    B(n-1) = log(abs(bisect(n,f,1,1.4)-alpha));
end
for n=1:48
    XA(n) =  A(n);
    YA(n) =  A(n+1);
    XB(n) = B(n);
    YB(n) = B(n+1);
end
plot(XA,YA,'b.-','MarkerSize',13); hold on; plot(XB,YB,'r.-','MarkerSize',13)
legend('Newton methode','Bisect methode')

%Uit het gegenereerde plot volgt dan eenvoudig dat de rate of convergence
%groter is voor de newton methode.