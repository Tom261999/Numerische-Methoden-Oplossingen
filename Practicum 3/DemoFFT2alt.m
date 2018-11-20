% Voorbeeld 2
% Demonstratie van MATLAB commando fft
clf; f1=20; f2=50; nt=512; T=2.; dt=T/nt
df=1/T
fmax=(nt/2)*df
t=0:dt:(nt-1)*dt;
tt=0:dt/25:(nt-1)*dt; % Nodig om ook een nauwkeurige plot van het echte signaal te maken

ruis = normrnd(0,0.5,length(t),1);
ruist = normrnd(0,0.5,length(tt),1);

y=0.5 + 0.2*sin(2*pi*f1*t) + 0.35*cos(2*pi*f2*t)+ruis;
yy=0.5 + 0.2*sin(2*pi*f1*tt) + 0.35*cos(2*pi*f2*tt)+ruist;
%%%%%% Plot van het signaal met de gesamplede punten
figure(1);
plot(tt,yy,t,y,'ro')
axis([0 (nt-1)*dt -4 4])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Y=fft(y);
fss=0:df:fmax;
Yss=zeros(1,nt/2+1);
Yss(1:nt/2+1)=(2/nt)*Y(1:nt/2+1);
Yss(1)=Yss(1)/2; Yss(nt/2+1)=Yss(nt/2+1)/2;
figure(2);
plot(fss,abs(Yss),'r'); axis([0 fmax 0 0.5]);
xlabel('frequentie Hz'); ylabel('abs(DFT)');