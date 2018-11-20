function tra=trapiter(func,a,b,iter)
% TRAP Implementatie van trapezium en
% Romberg integratie voor de berekening van 
% integraal met integrandum fun tussen
% grenzen a en b
format long
exact=1;
send=feval(func,a)+feval(func,b);
sodd=0;
seve=0;
vorigresidu=send*(b-a)/2;

for j=0:iter
    n=2^j;
    h=(b-a)/n;
    sodd=sodd+seve;
    seve=0;
    for k=1:2:n-1
        x=a+k*h;
        seve=seve+feval(func,x);
    end
    %Trapezium regel
    tra=h*(send+2*seve+2*sodd)/2;
    %Romberg integratie
    ri=(4*tra-vorigresidu)/3;
    errratio=(exact-vorigresidu)/(exact-tra);
    errest=(tra-vorigresidu)/3;
    vorigresidu=tra;
end
