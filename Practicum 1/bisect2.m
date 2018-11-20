function r = bisect2(nmax,fct,a,b)
% Bisectie-methode (reccursief)
format short e;
fa = feval(fct,a);
fb = feval(fct,b);
if fa*fb > 0
    error('Geen nulpunt in opgegeven interval!')
end
disp('  i            a(i)         c(i)         b(i)      error afschatting')
c = (a+b)/2;
fc = feval(fct,c);
disp([i,a,c,b,(b-a)/2])
if nmax > 1
    if fa*fc < 0
        b = c;
        fb = fc;
        c = bisect2(nmax-1,fct,a,b)
    else
        a = c;
        fa = fc;
        c = bisect2(nmax-1,fct,a,b)
    end
end
r = c;
fprintf('nulpunt is benaderend %12.6e\n',r)
format short