% Voorbeeld 1
% Demonstratie van MATLAB commando fft
clf; f1=3.125; f2=105; nt=64; T=0.2 ; dt=T/nt;
df=1/T
fmax=(nt/2)*df
t=0:dt:(nt-1)*dt;
tt=0:dt/25:(nt-1)*dt; % Nodig om ook een nauwkeurige plot van het echte signaal te maken
y=0.5 + 2*sin(2*pi*f1*t) + cos(2*pi*f2*t);
yy=0.5 + 2*sin(2*pi*f1*tt) + cos(2*pi*f2*tt);
%%%%%% Plot van het signaal met de gesamplede punten
figure(1);
plot(tt,yy,t,y,'ro')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Y=fft(y);
figure(2);
subplot(121);
bar(0:nt-1,real(Y),'r'); xlim([0 nt-1]);
xlabel('index k'); ylabel('real(DFT)')
subplot(122);
bar(0:nt-1,imag(Y),'r'); xlim([0 nt-1]);
xlabel('index k'); ylabel('imag(DFT)')
fss=0:df:fmax;
Yss=zeros(1,nt/2+1);
Yss(1:nt/2+1)=(2/nt)*Y(1:nt/2+1);
Yss(1)=Yss(1)/2; Yss(nt/2+1)=Yss(nt/2+1)/2;
figure(3);
subplot(221);
bar(fss,real(Yss),'r'); xlim([0 fmax]);
xlabel('frequentie Hz'); ylabel('real(DFT)');
subplot(222)
bar(fss,-1*imag(Yss),'r'); xlim([0 fmax]);
xlabel('frequentie Hz'); ylabel('imag(DFT)');
subplot(223)
bar(fss,abs(Yss),'r'); xlim([0 fmax]);
xlabel('frequentie Hz'); ylabel('abs(DFT)');