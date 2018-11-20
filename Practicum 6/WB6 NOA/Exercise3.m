%1
orbe(1,2*pi,0.02)
%applying the pre-written script to the given vallues gives us a plot of
%the comet's trajectory. We immediately see this is not a stable nor a
%circular orbit, even though it should be with these starting conditions.

%2
orbeC(1,2*pi,0.02)
%we notice this still isn't a perfect circle, there's still a fluctuation in potential energies. This shows that the
%Euler-Cromer method is not a perfect approximation to solve this problem

%3
orbeC(1,pi,0.02)
%The positive energie tells us the comet has enough energy to escape and it
%leaves the solar system

%4
orbeC(1,pi,0.005)
%Decreasing the timestep shows us the energy wasn't positive after all, and
%the comet seems to stay in our system. This means our algorythm made a
%mistake when calculating an answer for the problem that caused our energy
%to "skyrocket". Just like the exercise claims, we need a better method.