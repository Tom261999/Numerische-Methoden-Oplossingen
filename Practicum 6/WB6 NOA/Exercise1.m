%1
slinger_Euler(pi/6,1,5000,0.02);
%applying the given function on appropriate values gives us a sine wave
%with increasing amplitude. This is due to an error the Euler method makes.

%2
slinger_Euler_Cromer(pi/6,1,5000,0.02);
%With a small correction we see the plot is much more accurate and doesn't
%show the same gradual increase we saw with the Euler method

verlet(pi/6,1,5000,0.02);
%Writing similar script for Verlet's method gives us another accurate
%answer

