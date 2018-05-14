function [U, W, remainingIndex] =  listreg(lossMat, T, mu, N, r0, rfinal, S, epsilon, padded_maxiter)
% T: number of examples in each term
% lossMat: (d+1)*(d+1)*m loss matrix, example info to compute the l2 loss
% ws: m*d

m = size(lossMat,3);
d = size(lossMat,1) - 1;
r = r0;
[Wh, ~, ~] =  quadratic(lossMat, T, zeros(1,d), r, mu, S); % first run, zero shift

%t_maxiter = 10;
remainingIndex = 1:m; % remaining term index for each round
while true
    disp('new iteration')
    fprintf("r %d\n",r);
    disp("Wh:");
    disp(Wh);
    % W <- nonNaN rows of Wh
    nonNaNIdx = ~isnan(Wh(:,1));
    W = Wh(nonNaNIdx,:);
    remainingIndex = remainingIndex(nonNaNIdx);
    disp('remaining indices:');
    disp(remainingIndex);
    
    m = size(remainingIndex,2);
    if r <= 1/2*rfinal  % terminating case
        U = greedycluster(W,rfinal, epsilon, mu*N, T);
        break;
    end

    % padded_maxiter = 30;  % 112*log(t*(t+1)/delta);
    Wbar = NaN(m,d,padded_maxiter);

    rho = r*log(2/mu);
    tau = 2*r;

    for h=1:padded_maxiter
        [Ph,~,Cr] = padded(W, rho, tau); % P: partition, each cell is a cluster
        for i=1:size(Ph,2)               % for each cluster
            clusterIdx = remainingIndex(Ph{i}.index);
            size_T = sum(T(clusterIdx)); % number of pt in this cluster
            if size_T > (1-epsilon)* mu * N              % Run algo1 
                shift = Cr{i}(1:end-1);
                clusterlossMat = lossMat(:,:,clusterIdx); 
                [ws_cluster, ~, ~] =  quadratic(clusterlossMat, T(clusterIdx), shift, rho+r, mu, S);
                Wbar(clusterIdx,:,h) = ws_cluster;
            end
        end
    end
    Wh = NaN(m,d);
    for i=1:m
        for h0 = 1:padded_maxiter
            % dimension: may need to transpose
            % D should be of size padded_maxiter (1*1*h)
            D = sqrt(sum((Wbar(i,:,:) - repmat(Wbar(i,:,h0), 1,1,padded_maxiter)).^2, 2));      
            if sum(D <= 1/3*r) > 1/2 * padded_maxiter
                Wh(i,:) = Wbar(i,:,h0);
                break;
            end
        end
    end
    r = 1/2*r;
end