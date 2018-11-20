f = @(x) 1+x.^2-tan(x);
options = optimset('TolX',1e-10,'Display','iter')
fzero(f,1)

%Wat de gevraagde output geeft.
