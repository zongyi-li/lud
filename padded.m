function [P,k,Cr] = padded(w, rho, tau)
    % each row of w is a term (weight vector)
    % P: partition
    % k: random k chosen by the algortihm
    % Cr is for cluster drawing purpose only
    % Center and radius of each cluster
    W = w;
    m = size(W,1); % number of rows of W
    P = {}; 
    Cr = {}; % comment out this line if don't need cluster center&radius
    k = (rho-2)*rand()+2;
    iter = 1;
    list = randperm(m);
    cluster = 1;
    while (m ~= 0)
        j = list(iter);
        radius = k*tau;
        w_star = repmat(w(j,:),m,1);
        D = sqrt(sum((w_star - W).^2,2));
        T = W(D <= radius,:);
        W = W(D > radius,:);
        if (size(T,1) ~= 0) 
            P{cluster} = T;
            wr = [w(j,:),radius]; % comment out this line if don't need cluster center&radius
            Cr{cluster} = wr; % comment out this line if don't need cluster center&radius
            cluster = cluster + 1;
        end
        iter = iter + 1;
        m = size(W,1);   
    end
    
end