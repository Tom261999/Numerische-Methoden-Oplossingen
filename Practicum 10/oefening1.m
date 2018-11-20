clear, close all
clc

tau = 0.1;
N = 1000;

tic
funcshro(N,tau)
disp('Gegeven script voor N = 1000 & tau = 0.1 :')
toc
pause(2)
tic
funcshroalt(N,tau)
disp('Sparse modifactie script voor N = 1000 & tau = 0.1 :')
toc


N = 2000;
tic
funcshro(N,tau)
disp('Gegeven script voor N = 2000 & tau = 0.1 :')
toc
pause(2)
tic
funcshroalt(N,tau)
disp('Sparse modifactie script voor N = 2000 & tau = 0.1 :')
toc

%Voor N = 1000 zien we vrijwel geen verschil in run-time, terwijl voor N =
%2000 we wel opmerken dat het script duidelijk sneller loopt.