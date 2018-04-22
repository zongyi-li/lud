m = 100; % number of terms
d = 10; % dim of y

% y part of data
datay = 2*rand(m, d) - 1; % y is uniformly dist
% w for the optimal linear fit
w = ones(d,1);

noise = normrnd(0,0.2,d,1);

% z part of data
dataz = zeros(m,1);
% first 1:10 terms are Igood, z = Y * w + noise
dataz(1:10,1) = datay(1:10,1:d) * w + noise;
% the rest of terms are random
dataz(11:end,1) = 2*rand(90,1) - 1;

% T is the number of points (weights) for each term.
T = ones(100,1);

