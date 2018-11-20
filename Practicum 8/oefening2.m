clear, close all

N = 100;
nStep = 100;
L = 1.;
h = L/N;


A = zeros(1000,1);
B = zeros(1000,2);

var1 = 0.001;
var2 = 0.01;
var3 = 0.001;
for i = 1:1:10
    for j = 1:1:10
        for k = 1:1:10
            B(i+(j-1)*10+(k-1)*100,:) = [(var2*j*i*var1/h)^2,2*var3*k*i*var1/h^2];
            A(i+(j-1)*10+(k-1)*100) = func(i*var1,var2*j,var3*k);
        end
    end
end
func2(3*var1,3*var2,3*var3);
figure
plot3(B(:,1),B(:,2),A,'k.')
title('Stabiliteit van het algoritme')
xlabel('(c\tau/h)^2')
ylabel('2\kappa\tau/h^2')
zlabel('stabiel (ja/neen)')
grid on