function [P,k,Cr] = padded(w, rho, tau)
    % each row of w is a term (weight vector)
    % P: partition, each cell is a cluster, P{i}.value are the w's value,
                                          % P{i}.index are w's index.
    % k: random k chosen by the algortihm
    % Cr is for cluster 
    % Center and radius of each cluster
    W = w;
    m = size(W,1); % number of rows of W
    P = {}; 
    Cr = {}; % comment out this line if don't need cluster center & radius
    k = (rho-2)*rand()+2;
    
    remainingIndex = 1:m; % remaining index of W
    chosenIdx = ~isnan(W(:,1)); % rows that are not NaN
    remainingIndex = remainingIndex(chosenIdx); % new remaining indices of W that are not NaN's
    W = W(chosenIdx,:); % W that are not NaN's
    numRemainingIdx = size(remainingIndex,2);
    list = remainingIndex(randperm(numRemainingIdx));
    
    m = size(W,1);
    
    iter = 1; cluster = 1;
    while (m ~= 0)
        j = list(iter);
        radius = k*tau;
        w_star = repmat(w(j,:),m,1);
        D = sqrt(sum((w_star - W).^2,2));
        T = W(D <= radius,:);
        W = W(D > radius,:);
        if (size(T,1) ~= 0) 
            P{cluster}.value = T;
            P{cluster}.index = remainingIndex(D <= radius);
            remainingIndex = remainingIndex(D > radius);
            wr = [w(j,:),radius]; % comment out this line if don't need cluster center&radius
            Cr{cluster} = wr; % comment out this line if don't need cluster center&radius
            cluster = cluster + 1;
        end
        iter = iter + 1;
        m = size(W,1);   
    end
    
end