% Metropolis-Hastings sampler
% By Sam Friedman
% Created: 9/29/2015
%
% Function for Cauchy distribution
cauchy = @(x) 1./(1+x.^2);
% Function for normal PDF
norm = @(x,mu,sig) 1/sig*exp(-.5*(x-mu)/sig.^2);
% Generate n samples in the chain
n = 1e4;
sig = 2;
x = zeros(1,n);
x(1) = randn(1); % generate starting point
% note that randn() returns a pseudorandom value drawn from the standard
% normal distribution.
for i = 2:n
   % generate a candidate from the proposal distribution (the normal
   % distribution in this case). This will be a normal with mean given by
   % the previous value in the chain and standard deviation of sig
   y = x(i-1) + sig*randn(1);
   % generate a uniform for comparison
   u = rand(1);
   % note that rand() returns a pseudorandom value drawn from the standard
   % uniform distribution on the open interval(0,1)
   alpha = min( [1,cauchy(y)*norm(x(i-1),y,sig) / ...
       (cauchy(x(i-1))*norm(y,x(i-1),sig))] );
   if u <= alpha
       x(i) = y;
   else
       x(i) = x(i-1);
   end
end
% Discard initial burn in points
burn_in = 500;
bin_vals = [-20:2:20];
plot(x')

