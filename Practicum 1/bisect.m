function r = bisect(nmax,fct,a,b)
% Bisection-method
format short e;
fa = fct(a);
fb = fct(b);
if fa*fb > 0
    error('No root in the given interval!')
end
disp('  i            a(i)         c(i)         b(i)      error estimation')
for i = 1:nmax
    c = (a+b)/2;
    fc = fct(c);
    disp([i,a,c,b,(b-a)/2])
    if fa*fc < 0
        b = c;
        fb = fc;
    else
        a = c;
        fa = fc;
    end
end
r = c;
fprintf('Root is approximately %12.6e\n',r)
format short