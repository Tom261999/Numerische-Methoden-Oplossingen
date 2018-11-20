f=@(x) log(x).*exp(-x.^2)
g=@(x) sin(x)./x
a=1;
b=2;
n=10;
integspl(f,a,b,n)
integspl(g,a,b,n)
