function trap(fun,a,b)
% TRAP Implementatie van trapezium en
% Romberg integratie voor de berekening van 
% integraal met integrandum fun tussen
% grenzen a en b
% max aantal intervallen is 2^12=4096
% kan veranderd worden
format long
exact=1
send=feval(fun,a)+feval(fun,b);
sodd=0;
seve=0;
vorigres=send*(b-a)/2;
fprintf('    n       Tn            ErrorRatio        I-Tn         EstimateErr        Rn         I-Rn\n')
for j=1:12
    n=2^j;
    h=(b-a)/n;
    sodd=sodd+seve;
    seve=0;
    for k=1:2:n-1
        x=a+k*h;
        seve=seve+feval(fun,x);
    end
    %Trapezium regel
    tr=h*(send+2*seve+2*sodd)/2;
    %Romberg integratie
    ri=(4*tr-vorigres)/3;
    errratio=(exact-vorigres)/(exact-tr);
    errest=(tr-vorigres)/3;
    vorigres=tr;
    output=[n tr errratio exact-tr errest ri exact-ri];
    fprintf('%6.0f\t%8.6e\t%8.6e\t%8.6e\t%8.6e\t%8.6e\t%8.6e\n',output)
end