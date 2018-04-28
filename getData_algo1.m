addpath(genpath('YALMIP-master'))
addpath(genpath('mosek'))
m = 30; % number of terms
i_m = 10;
d = 10; % dim of y

% y part of data
datay = 2*rand(m, d) - 1; % y is uniformly dist
% w for the optimal linear fit
w = ones(d,1);

noise = normrnd(0,0.2,d,1);

% z part of data
dataz = zeros(m,1);
% first 1:10 terms are Igood, z = Y * w + noise
dataz(1:i_m,1) = datay(1:i_m,1:d) * w + noise;
% the rest of terms are random
dataz(i_m+1:end,1) = 2*rand(m-i_m,1) - 1;

% T is the number of points (weights) for each term.
T = ones(m,1);

[ws_v, Y_v, c] = quadratic(datay, dataz, T);

%[c_p] = updateWeights(c, ws_v, datay, dataz, T, Y_v);