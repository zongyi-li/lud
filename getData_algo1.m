addpath(genpath('YALMIP-master'))
addpath(genpath('mosek'))
m = 10; % number of terms
i_m = 5;
d = 4; % dim of y

% % y part of data
% datay = 2*rand(m, d) - 1; % y is uniformly dist
% % w for the optimal linear fit
% w = ones(d,1);
% 
% noise = normrnd(0,0.2,i_m,1);
% 
% % z part of data
% dataz = zeros(m,1);
% % first 1:10 terms are Igood, z = Y * w + noise
% dataz(1:i_m,1) = datay(1:i_m,1:d) * w + noise;
% % the rest of terms are random
% dataz(i_m+1:end,1) = 2*rand(m-i_m,1) - 1;

% T is the number of points (weights) for each term.
T = ones(m,1);


lossMat = ones(d+1,d+1,m);
shift = ones(1,d);
%[ws_v, Y_v, c] = quadratic(lossMat, T, shift);
%[c_p] = updateWeights(c, ws_v, datay, dataz, T, Y_v);
mu = 0.1; r0 = 100; rfinal = 1;
[U, W] =  listreg(T, lossMat, mu, r0, rfinal);