clear, close all

x = [0.4:0.2:1.8];
y = [0.189 0.202 0.265 0.300 0.345 0.563 0.691 1.249];

x1 = [0.3:0.05:1.9]; %fijner grid voor evaluatie van fits

%%Delen a & b
%Lineair
lin = polyval(polyfit(x,y,1),x1);
subplot(2,2,1)
plot(x1,lin,'--r'); hold on; plot(x,y,'b*')
title('Lineair: $y = \alpha\cdot x+\beta$','Interpreter','latex')
%Exponentieel
yexp = log(y);
expocoef = polyfit(x,yexp,1);
f = @(z) exp(expocoef(2)+expocoef(1).*z);
expo = feval(f,x1);
subplot(2,2,2)
plot(x1,expo,'--r'); hold on; plot(x,y,'b*')
title('Exponentieel: $y = \beta e^{\alpha\cdot x}$','Interpreter','latex')
%Machtsfunctie
xexp = log(x);
machtcoef = polyfit(xexp,yexp,1);
g = @(z) exp(machtcoef(2)).*z.^machtcoef(1);
macht = feval(g,x1);
subplot(2,2,3)
plot(x1,macht,'--r'); hold on; plot(x,y,'b*')
title('Machtsfunctie: $y = \beta\cdot x^\alpha$','Interpreter','latex')
%Rationaal
yinv = 1./y;
ratio = 1./polyval(polyfit(x,yinv,1),x1);
subplot(2,2,4)
plot(x1,ratio,'--r'); hold on; plot(x,y,'b*')
title('Rationaal: $y = \frac{1}{\alpha\cdot x+\beta}$','Interpreter','latex')

%%Deel c
%Hiervoor maken we gebruik van de least-squares method. (Al is de
%uitvoering niet geweldig efficient door het veelvuldig gebruik van for
%loops, die eenvoudig samengevoegbaar zijn maar ik vind persoonlijk dat dit
%beter toont wat er gebeurt en ten slotte werkt het.)

n = length(x);

%Lineair
linearlsm = polyval(polyfit(x,y,1),x)-y;
disp('Residu van lineaire fit: ')
linearresiduesqr = 0;
for k = 1:n
    linearresiduesqr = linearresiduesqr + linearlsm(k).^2;
end
disp(sqrt(linearresiduesqr))

%Exponentieel
expolsm = feval(f,x)-y;
disp('Residu van exponentiele fit: ')
exporesiduesqr = 0;
for k = 1:n
    exporesiduesqr = exporesiduesqr + expolsm(k).^2;
end
disp(sqrt(exporesiduesqr))

%Machtsfunctie
powerlsm = feval(g,x)-y;
disp('Residu van machtsfunctie fit: ')
powerresiduesqr = 0;
for k = 1:n
    powerresiduesqr = powerresiduesqr + powerlsm(k).^2;
end
disp(sqrt(powerresiduesqr))

%Rationaal
ratiolsm = 1./polyval(polyfit(x,yinv,1),x)-y;
disp('Residu van rationale fit: ')
ratioresiduesqr = 0;
for k=1:n
    ratioresiduesqr = ratioresiduesqr + ratiolsm(k).^2;
end
disp(sqrt(ratioresiduesqr))

%De rationale fit heeft het laagste residu en is dus de beste fit. Het
%residu is kort gezegd de afstand van het gegeven punt tot de functiewaarde
%van de fit in de gegeven x-waarden.

disp('Why?')
why