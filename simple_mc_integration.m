% Monte Carlo testing...
% by: Sam Friedman (samfriedman@tamu.edu)
% ref: Martinez, "Computational Statistics Handbook with MATLAB"

% Generate 500 exponential random
% variables with lambda = 1.
% This is a Statistics Toolbox function.
x = exprnd(1,1,1000);
% Take square root of each one.
xroot = sqrt(x);
xroot;
% Take the mean - Equation 11.4
exroothat = mean(xroot);
fprintf('exroothat = %5.4f \n',exroothat);
%
% Now get it using numerical integration
myfun = @(x) sqrt(x).*exp(-x);
% quadl is a MATLAB 6 function
exroottru = integral(myfun,0,50);
fprintf('exroottru = %5.4f \n',exroottru);