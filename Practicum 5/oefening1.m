clear, close all

f = @(t) sin(t);
F = @(h,t) (f(t+h)-f(t-h))/(2.*h);

df1 = F(0.5,1); df2 = F(0.5/2,1);

a0 = (2.^2.*df2-df1)/(2.^2-1); %Richardson extrapolatie! zie cursus & slides

dexactf = cos(1);

disp('De berekende waarde voor a0:')
disp(a0)

disp('De theoretische waarde voor a0:')
disp(dexactf)