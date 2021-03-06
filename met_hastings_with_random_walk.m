% metropolis-hastings sampler with random walk
% By Sam Friedman
% ref: Martinez, "Computational Statistics Handbook with MATLAB"
% created: 9/29/2015
%
% Get the variances for the proposal distributions.
sig1 = 0.5;
sig2 = 0.1;
sig3 = 10;
% We will generate 500 iterations of the chain.
n = 500;
% Set up the vectors to store the samples.
X1 = zeros(1,n);
X2 = X1;
X3 = X1;
% Get the starting values for the chains.
X1(1) = -10;
X2(1) = 0;
X3(1) = 0;
% Run the first chain.
for i = 2:n
    % Generate variate from proposal distribution.
    y = randn(1)*sig1 + X1(i-1);
    % Generate variate from uniform.
    u = rand(1);
    % Calculate alpha.
    alpha = normpdf(y,0,1)/normpdf(X1(i-1),0,1);
    if u <= alpha
        % Then set the chain to the y.
        X1(i) = y;
    else
        X1(i) = X1(i-1);
    end
end
% Run second chain.
for i = 2:n
    % Generate variate from proposal distribution.
    y = randn(1)*sig2 + X2(i-1);
    % Generate variate from uniform.
    u = rand(1);
    % Calculate alpha.
    alpha = normpdf(y,0,1)/normpdf(X2(i-1),0,1);
    if u <= alpha
        % Then set the chain to the y.
        X2(i) = y;
    else
        X2(i) = X2(i-1);
    end
end
% Run the third chain.
for i = 2:n
    % Generate variate from proposal distribution.
    y = randn(1)*sig3 + X3(i-1);
    % Generate variate from uniform.
    u = rand(1);
    % Calculate alpha.
    alpha = normpdf(y,0,1)/normpdf(X3(i-1),0,1);
    if u <= alpha
        % Then set the chain to the y.
        X3(i) = y;
    else
        X3(i) = X3(i-1);
    end
end
% graph results
xx = 1:size(X1,2);
xx1 = [1:size(X1,2);X1];
xx2 = [1:size(X2,2);X2];
xx3 = [1:size(X3,2);X3];
pos_twos = zeros(size(xx));
neg_twos = zeros(size(xx));
pos_twos(:) = 2;
neg_twos(:) = -2;
subplot(3,1,1)
plot(xx,X1(1,:),xx,pos_twos,xx,neg_twos)
subplot(3,1,2)
plot(xx,X2(1,:),xx,pos_twos,xx,neg_twos)
subplot(3,1,3)
plot(xx,X3(1,:),xx,pos_twos,xx,neg_twos)
