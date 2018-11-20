function sp=simp(fun,a,b)
send=feval(fun,a)+feval(fun,b);
sodd=0;
seve=0;
for j=1:12
    n=2^j;
    h=(b-a)/n;
    sodd=sodd+seve;
    seve=0;
    for k=1:2:n-1
        x=a+k*h;
        seve=seve+feval(fun,x);
    end
    %Simpson regel
    sp=h*(send+4*seve+2*sodd)/3;
end
