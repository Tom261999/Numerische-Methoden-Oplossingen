function Integraal = splint(func,a,b,n)
%n = aantal intervallen tussenin (linspace), a & b de grenzen.
x = linspace(a,b,n);
y = feval(func,x);
spdata = spline(x,y);
[breaks,spcoef,pieces,order,dim] = unmkpp(spdata);
h = diff(x)';
Integraal = sum(1/4*spcoef(:,1).*h.^4+1/3*spcoef(:,2).*h.^3+1/2*spcoef(:,3).*h.^2+spcoef(:,4).*h);