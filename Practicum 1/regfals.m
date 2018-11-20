function r = regfals(nmax,fct,a,b)
%regula falsi methode
format short e;
fa = feval(fct,a);
fb = feval(fct,b);
if fa*fb > 0
    error('Geen nulpunt in opgegeven interval!')
end
for i = 1:nmax
    c = a-(((b-a).*fa))/(fb-fa);
    fc = feval(fct,c);
    if fa*fc < 0
        b = c;
        fb = fc;
    else
        a = c;
        fa = fc;
    end
end
r = c;
fprintf('nulpunt is benaderend %12.6e\n',r)
format short