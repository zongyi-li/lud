function [U, W] =  listreg(T, lossMat, delta, mu, r0, rfinal)
% T: number of examples in each term
% lossMat: (d+1)*(d+1)*m loss matrix, example info to compute the l2 loss
% ws: m*d

[ws_v, ~, ~] =  quadratic(lossMat, T); % first run
m = size(T,1);
N = sum(T);
r = r0;

t_maxiter = 100;
for t=1:t_maxiter
    W = ws_v;
    if r < 1/2*rfinal  % terminating case
        [U, W] = greedycluster(W,rfinal);
        break;
    end
    
    Wh = NaN(m,d,padded_maxiter);
    delta_p = 7/8;
    rho = r*log(2/mu)/delta_p;
    tau = 2*r;
    padded_maxiter = 10;  % 112*log(t*(t+1)/delta);
    for h=1:padded_maxiter
        [P,~,Cr] = padded(W, rho, tau); % P: partition, each cell is a cluster
        for i=1:size(P,2)               % for each cluster
            size_T = sum(T(P{i}.index)); % number of pt in this cluster
            if size_T > mu * N              % Run algo1 
                shift = Cr{h}(1:end-1);
                clusterlossMat = lossMat(:,:,P{i}.index); 
                [ws_cluster, ~, ~] =  quadratic(clusterlossMat, T(P{i}.index), shift);
                Wh(h,P{i}.index,:) = ws_cluster;
            end
        end
    end
    for i=1:m
        for h0 = 1:padded_maxiter
            % dimension: may need to transpose
            D = sqrt(sum((Wh(:,i,:) - repmat(Wh(h0,i,:),padded_maxiter,1)).^2));
            if sum(D <= 1/3*r) > 1/2*padded_maxiter
                ws_v(i,:) = Wh(h0,i,:);
                break;
            end
        end
    end
    r = 1/2*r;
end