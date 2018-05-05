addpath(genpath('YALMIP-master'))
addpath(genpath('mosek'))
m = 10; % number of terms
i_m = 3;
d = 2; % dim of y
scale = 100;

lossMat = zeros(d+1,d+1,m);
T = binornd(200,0.5,[1,m]);
wstar = ones(1,d);
for i = 1 : i_m
    Y = (2 * rand(T(i), d) - 1) * scale ; % t*d
    %noise = normrnd(0, 0.2 ,T(i),1) * scale ; % t*1
    Z = Y * wstar' + noise;   % t*1
    lossMat(:,:,i) = [Z'*Z ,-1*Z'*Y ;-1*Y'*Z, Y'*Y];
    disp(wstar);
end

for i = i_m+1 : m
    wstar = randi(10,[1,d]);
    Y = (2*rand(T(i), d) - 1) * scale ; % t*d
    %Z = (2*rand(T(i), 1) - 1) * scale ; % t*1
    Z = Y * wstar'; 
    lossMat(:,:,i) = [Z'*Z ,-1*Z'*Y ;-1*Y'*Z, Y'*Y];
    disp(wstar);
end

%wh = ones(m,d);
%[c_p] = updateWeights(c, wh, lossMat, T, mu);
u = zeros(1,d);
r = d;
mu = sum(T(1:i_m))/sum(T);
S = 1;
%[wh_v, Y_v, c] =  quadratic(lossMat, T, u, r, mu, S);

r0 = d;
rfinal = 0.1;
epsilon = 0;
[U, W] =  listreg(lossMat, T, mu, r0, rfinal, S, epsilon);

figure;
plot(W(:,1),W(:,2),'+')
hold on;
for i = 1:size(U,1)
    color = unifrnd(0,1,1,3);
    plot(U(:,1),U(:,2),'.', 'Color', color)
    viscircles([U(i,1),U(i,2)],2*rfinal,'LineStyle','--','LineWidth', 0.5,'Color',color);
end




% y part of data
% Y = 2*rand(m, d) - 1; % y is uniformly dist
% w for the optimal linear fit
% w = ones(d,1);
% 
% noise = normrnd(0,0.2,i_m,1);
% 
% % z part of data
% Z = zeros(m,1);
% % first 1:10 terms are Igood, z = Y * w + noise
% Z(1:i_m,1) = Y(1:i_m,1:d) * w + noise;
% % the rest of terms are random
% Z(i_m+1:end,1) = 2*rand(m-i_m,1) - 1;
% 
% % T is the number of points (weights) for each term.
% T = ones(m,1);
% lossMat = ones(d+1,d+1,m);
% shift = ones(1,d);
% mu = 0.1; r0 = 100; rfinal = 1;
% c = ones(1,m);
% S = 1;


