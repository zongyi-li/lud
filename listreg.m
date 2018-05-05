function [U, W] =  listreg(lossMat, T, mu, r0, rfinal, S, epsilon)
% T: number of examples in each term
% lossMat: (d+1)*(d+1)*m loss matrix, example info to compute the l2 loss
% ws: m*d

m = size(T,1);
d = size(lossMat,1) - 1;
N = sum(T);
r = r0;
[ws_v, ~, ~] =  quadratic(lossMat, T, zeros(1,d), r, mu, S); % first run, zero shift

t_maxiter = 10;
for t=1:t_maxiter
    W = ws_v;
    disp(t);disp(r);disp(W);
    if r <= 1/2*rfinal  % terminating case
        U = greedycluster(W,rfinal, epsilon, mu*N, T);
        disp(U);
        break;
    end

    padded_maxiter = 10;  % 112*log(t*(t+1)/delta);
    Wh = NaN(m,d,padded_maxiter);

    rho = r*log(2/mu);
    tau = 2*r;

    for h=1:padded_maxiter
        [P,~,Cr] = padded(W, rho, tau); % P: partition, each cell is a cluster
        for i=1:size(P,2)               % for each cluster
            size_T = sum(T(P{i}.index)); % number of pt in this cluster
            if size_T > mu * N              % Run algo1 
                shift = Cr{i}(1:end-1);
                clusterlossMat = lossMat(:,:,P{i}.index); 
                [ws_cluster, ~, ~] =  quadratic(clusterlossMat, T(P{i}.index), shift, rho+r, mu, S);
                Wh(P{i}.index,:,h) = ws_cluster;
            end
        end
    end
    for i=1:m
        for h0 = 1:padded_maxiter
            % dimension: may need to transpose
            % D should be of size padded_maxiter (1*1*h)
            D = sqrt(sum((Wh(i,:,:) - repmat(Wh(i,:,h0), 1,1,padded_maxiter)).^2, 2));      
            if sum(D <= 1/3*r) > 1/2 * padded_maxiter
                ws_v(i,:) = Wh(i,:,h0);
                break;
            end
        end
    end
    r = 1/2*r;
end