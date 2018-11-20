f = @(x) x.*sin(x.^2).*tan(x);
Df = @(x) x.*sin(x.^2).*(sec(x)).^2+tan(x).*(sin(x.^2)+2.*x.^2.*cos(x.^2));


%%Multipliciteit van het nulpunt in 0.
modnewton(10^(-10),f,Df,-1)
%Levert inderdaad 4.


%%Vergelijken van convergentiesnelheden.
f = @(x)x.*sin(x.^2).*tan(x);
Df = @(x) x.*sin(x.^2).*(sec(x)).^2+tan(x).*(sin(x.^2)+2.*x.^2.*cos(x.^2));


alpha = fzero(f,0);

for n = 3:49
    A(n-2) = log(abs(newton2(10^-20,f,Df,1,n)-alpha));
    B(n-2) = log(abs(modnewton2(10^-20,f,Df,1,n)-alpha));
end
for j = 1:46
    C(j) = A(j);
    D(j) = A(j+1);
    E(j) = B(j);
    F(j) = B(j+1);
end

plot(C,D,'b-*'); hold on;
plot(E,F,'r-o')
legend('Newton','Modnewton')
%Uit de figuur volgt dan dat de rate of convergence voor modnewton ongeveer 2 is terwijl
%dit voor newton slechts 1 is.