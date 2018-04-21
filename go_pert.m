M = dlmread('ALL.20k.data', ' ');
ok = logical(sum(M==0,1)==0);
M = M(:,logical(ok));
M = 2-M;
%%
p = sum(M(:)==1) / numel(M);
k = 5;
n = size(M,1); d = size(M,2);
n_pert = round(0.10 * n);
U_pert = double(rand(n_pert,k) < sqrt(p/k));
V_pert = double(rand(k,d) < sqrt(p/k));
M_pert = min(U_pert * V_pert, ones(n_pert, d));
%%
M_pert = [];
%%
r=100;
[U,D,V] = svds(M, r);
%% remove outliers on perturbed matrix
t_max = 5;
n2 = n + n_pert;
c = ones(n2,1);
c_tape = zeros(n2,t_max);
for t=1:t_max
    c_tape(:,t) = c;
    tic; disp('computing svd...');
    [Up, Dp, Vp] = svds(diag(sqrt(c)) * [M;M_pert], r);
    toc;
    align(V, Vp, t);
    taus = find_outliers(Up, Dp, Vp, 5);
    taus_sorted = sort(taus);
    tau0 = taus_sorted(round(0.9*length(taus_sorted)));
    taus2 = max(taus-tau0,0);
    c = c .* (1 - taus2 / max(taus2));
end
%% run on original matrix (just to see what happens on clean data)
t_max = 3;
n2 = n;
c = ones(n2,1);
c_tape = zeros(n2,t_max);
U_tape = cell(t_max,1);
D_tape = cell(t_max,1);
V_tape = cell(t_max,1);
for t=1:t_max
    c_tape(:,t) = c;
    tic; disp('computing svd...');
    [Up, Dp, Vp] = svds(diag(sqrt(c)) * M, r);
    U_tape{t} = Up; D_tape{t} = Dp; V_tape{t} = Vp;
    toc;
    align(V, Vp, t);
    taus = find_outliers(Up, Dp, Vp, 5);
    taus_sorted = sort(taus);
    tau0 = taus_sorted(round(0.9*length(taus_sorted)));
    taus2 = max(taus-tau0,0);
    c = c .* (1 - taus2 / max(taus2));
end
%% OLD CODE BELOW THIS POINT
%% our robust algorithm
% waterfall method
lambda = diag(Dp);
weights = zeros(r,1);
index = 1;
s = 5;
while sum(weights.^2) < s
    weights(1:index) = weights(1:index) + (lambda(index) - lambda(index+1)) ./ (lambda(1:index));
    index = index+1;
end
% sum(w.^2) - 2 * epsilon * sum(w) + epsilon^2 = s
% epsilon = (sum(w) - sqrt(sum(w)^2 - 4*(sum(w.^2) - s)))/2;
nz = nnz(weights);
correction = (sum(weights) - sqrt(sum(weights)^2 - nz * (sum(weights.^2) - s))) / nz;
weights = max(weights-correction, 0);
%%
active = logical(weights>0);
sqrtY = diag(lambda.^(-1) .* sqrt(weights ./ (1-weights))) * Vp';
sqrtY = sqrtY(active, :);
%%
Xproj = Up * diag(lambda .* (1-weights)) * Vp';
Proj = Up * diag(weights) * Up';
%%
n2 = n + n_pert;
tau = zeros(n2,1);
for i=1:n2
    tau(i) = norm(sqrtY * Xproj(i,:)', 2)^2 + norm(Proj(i,:), 2)^2;
end
%%
plot(tau)
%%
c = ones(n2,1);
c = c .* (1 - tau / max(tau));
