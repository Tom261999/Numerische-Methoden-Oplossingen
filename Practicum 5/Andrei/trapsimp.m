function trapsimp(fun,a,b)
% TRAPSIMP Implementatie van trapezium en
% Simpson regel voor de berekening van 
% integraal met integrandum fun tussen
% grenzen a en b
% max aantal intervallen is 2^12=4096
% kan veranderd worden
format long; exact=0.68268949213708589717, format;
send=feval(fun,a)+feval(fun,b);
sodd=0;
seve=0;
fprintf('  n           Trap            Simp            I-Tn             I-Sn\n')
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
    %Simpson regel
    sp=h*(send+4*seve+2*sodd)/3;
    output=[n tr sp exact-tr exact-sp];
    fprintf('%6.0f\t%12.8e\t%12.8e\t%12.8e\t%12.8e\n',output)
end