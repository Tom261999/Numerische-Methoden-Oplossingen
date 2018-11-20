clear, close all

%tau = tau_max
advectmod('FTCS');
pause(5)
advectmod('Lax');
pause(5)
advectmod('Lax-Wendroff');