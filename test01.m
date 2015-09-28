% Monte Carlo testing...
% by: Sam Friedman (samfriedman@tamu.edu)

% Generate 500 exponential random
% variables with lambda = 1.
% This is a Statistics Toolbox function.
x = exprnd(1,1,1000);
% Take square root of each one.
xroot = sqrt(x);
xroot;
% Take the mean - Equation 11.4
exroothat = mean(xroot);
disp(exroothat);