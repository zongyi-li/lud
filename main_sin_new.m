addpath(genpath('YALMIP-master'));
addpath(genpath('mosek'));

dimx = 3;
d = 2; % dim of y
N = 1000; % total number of point
scale = 1; % scale of y & z
noise = 0.1; % variance of noise (before scaled)

r0 = 10 * d; 
rfinal = 0.1 * d;
S = 0.01;
padded_maxiter = 10;
quad_maxiter = 10;
epsilon = 0.1; % a small fraction of mu that we can suffer
threshold = 0;%trueError * dimx^2; % threshold for error, not using this feature
mu = 0.5;

% 1. generate raw data;
[datax, datayz] = getData_sin_new(N, scale, noise);
% 2. preprocess;
[lossMat, T, termIndex, DNFtable, DNFmat] = preprocessing(datax, datayz, mu, epsilon);
% 3. list-regression;
N_new = sum(T);
mu_new = mu * (N/N_new);
[U, W, remainingIndex] =  listreg_autoshift(lossMat, T, mu_new, N_new, r0, rfinal, S, epsilon, padded_maxiter, quad_maxiter);
% 4. greedy set cover
[UCans] = setcover(datax, datayz, U, W, mu, termIndex, rfinal, remainingIndex, epsilon, threshold);


if length(UCans) > 0
    for i = 1:length(UCans)
        disp(UCans{i});
    end
end

save('output')

%     % plot true line
if length(UCans) > 0  

    colors = [ 31, 120, 180; ...
               51, 160,  44; ...
               227,  26,  28; ...
               166, 206, 227; ...
               252, 146, 114; ...
               251, 106,  74; ...
               239,  59,  44; ...
               203,  24,  29; ...
               165,  15,  21] / 255;

    c = 1;

    y = -pi:pi;
    yhat = [ones(1,length(y)); y];
    

    % plot all possible weights and datapoints
    %selectedColor = unifrnd(0,1,1,3);
    plot(datayz(:,2),datayz(:,3),'.', 'Color', colors(c,:));
    c=c+1;
    hold on; 
    
    for i = 1:size(UCans,2)
        %color = unifrnd(0,1,1,3);
        
        z = UCans{i}.u*yhat;
        l2 = plot(y,z,'-', 'Color', colors(c,:)); 
        c = c+1;

    end
 else
     disp('U == 0 !!!!!boom!!!!!!!');
 end