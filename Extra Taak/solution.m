function solution(func)
%Deze functie zal een functievoorschrift nemen waarbij dan het probleem
%opgelost wordt voor een oneindigdiepe potentiaalput met een bodem gegeven
%door func.
N = 1000;
L = 100;              % System extends from -L/2 to L/2
h = L/(N-1);
x = h*(0:N-1) - L/2;
hbar = 1;  mass = 1; % Natural units
tau = 0.1;

%Hamiltoniaan
Hamiltoniaan = zeros(N);
coeff = -hbar^2/(2*mass*h^2);
for i=2:(N-1)
    Hamiltoniaan(i,i-1) = coeff;
    Hamiltoniaan(i,i) = -2*coeff;
    Hamiltoniaan(i,i+1) = coeff;
end

%Geeft de onderkant van de potentiaalput
for i=-N/2:N/2-1
    Hamiltoniaan(i+N/2+1,i+N/2+1)=Hamiltoniaan(i+N/2+1,i+N/2+1)+feval(func,(i-L/2)/N); %N als normalisatiefactor voor i opdat de functies niet ontploffen (want N is 1000!)
end

%Bouw de Crank-Nicolson matrix
crank = ((eye(N)+1i*tau/hbar*Hamiltoniaan/2)\(eye(N)-0.5*1i*tau/hbar*Hamiltoniaan));


%Initialisatie van golffunctie & locatie
x_init = 0;
v = 0.5; %initiele snelheid, hier kan eventueel nog mee gespeeld worden (idem voor startlocatie)
k0 = mass*v/hbar;
sigma = L/10;
normalisatie = 1/(sqrt(sigma*sqrt(pi)));  % Normalisatie
psi = normalisatie*exp(1i*k0*x').*exp(-(x'-x_init).^2/(2*sigma^2));

%Toont de potentiaalput
figure('position',[50,50,750,750]); clf %position bepaald de plaats en afmetingen van de figuur zodat de curven duidelijk zijn en we geen deel verliezen wanneer de waarden te hoog worden.
subplot(2,1,1)
hold on
g = @(t) feval(func,t);
fplot(g,'b-');
title('Weergave van de potentiaalput');

%Loop om de verticale as vanaf 0 of de minimale waarde van de put te laten
%beginnen.
if min(feval(func,x/100))/10 < 0
    axis([-0.5 0.5 min(feval(func,x/100)) max(feval(func,x/100))]);
else
    axis([-0.5 0.5 0 max(feval(func,x/100))]);
end

fplot(0,'k:');
xlabel('x')
ylabel('Potentiaal')
legend(func2str(func))
hold off

%Initialiseer de loop en nodige plotvariabelen
max_iter = 2*L/(v*tau);
plot_iter = max_iter/40;          %40 curves maken
rho(:,1) = psi.*conj(psi); %rho, de waarschijnlijkheidsdichtheid
n = 1;
subplot(2,1,2)
axisV = [-L/200 L/200 0 max(rho)]; %assenlengtes

%Loop
for iter=1:max_iter
    %Bereken nieuwe golffunctie met het Crank-Nicolson schema
    psi = crank*psi;
    %Regelmatig waarden bijhouden om te plotten
    if( rem(iter,plot_iter) < 1 )
        n = n+1;
        rho(:,n) = psi.*conj(psi);
        plot(x/100,rho(:,n));     % tussentijdsplot van P
        xlabel('x'); ylabel('\rho(x,t)');
        title(sprintf('Finished %g of %g iterations',iter,max_iter));
        axis(axisV); drawnow;
    end
end

%plot de waarschijnlijkheden
pFinal = psi.*conj(psi);
plot(x,rho(:,1:3:n),x,pFinal);
xlabel('x'); ylabel('\rho(x,t)');
title('Waarschijnlijkheidsdichtheden \rho(x,t) op verschillende tijdstippen');
end