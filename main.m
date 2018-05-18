addpath(genpath('YALMIP-master'));
addpath(genpath('mosek'));

dimx = 5;
d = 5; % dim of y
N = 10000; % total number of point
scale = 10; % scale of z
noise = 0.1; % variance of noise (before scaled)

% zongyi's hardcode DNF
 DNF = [0,2; 1,3]; % (not x1 and not x2) or (x1 and x2);
% DNF = randi([0,2*dimx-1],4,2);
% which is [2,8] after coded.
mu = 0.5;
r0 = 10 * d; 
rfinal = 0.1 * d ;
S0 = 0.1;
padded_maxiter = 10;
quad_maxiter = 10;
epsilon = 0.1; % a small fraction of mu that we can suffer
threshold = 0;%trueError * dimx^2; % threshold for error, not using this feature

wstar = scale * ((rand(1,d)*2)-1);
%wstar = scale * (randi([0,1],1,d)*2-1);
disp(' ');
disp('wstar');
disp(wstar);

% 1. generate raw data;
[datax, datayz, trueError] = getData_raw(dimx, d, N, mu, scale, noise, DNF, wstar);
% 2. preprocess;
[lossMat, T, termIndex, DNFtable, DNFmat] = preprocessing(datax, datayz, mu, epsilon);
% 3. list-regression;
N_new = sum(T);
mu_new = mu * (N/N_new);
[U, W, remainingIndex] =  listreg_autoshift(lossMat, T, mu_new, N_new, r0, rfinal, S0, epsilon, padded_maxiter, quad_maxiter);
% 4. greedy set cover
[UCans] = setcover(datax, datayz, U, W, mu, termIndex, rfinal, remainingIndex, epsilon, threshold);

disp(' ');
disp('wstar');
disp(wstar);

disp('trueError');
disp(trueError);

DNFstring = printPlantedDNF(DNF);
printUCans(UCans, DNFtable);
disp('planted DNF:');
disp(DNFstring);
