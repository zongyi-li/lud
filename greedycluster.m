function [U] = greedycluster(w, r, muN, T)

%Input
% W: m*d, w for each terms.
% muN is mu * N, number of good points.
%Output
% U is a list of w, as the center of ball.

% We iterate through all w in W, check if there exist enough point within distance 
m = size(w,1); % number of (remaining) rows of W
radius = 2*r;

U = w;

list = randperm(m);
iter = 1;
remaindingIndex = 1:m;

    while (m ~= 0)
        j = list(iter);
        w_star = repmat(w(j,:),m,1);
        D = sqrt(sum((w_star - U).^2,2));
        B = U(D <= radius,:);
        size = sum(T(D <= radius));
        
        U = U(D > radius,:);
        T = T(D > radius);
       
        if (size(B,1) ~= 0 && size >= muN) 
            P{cluster}.value = B;
            P{cluster}.index = remaindingIndex(D <= radius);
            remaindingIndex = remaindingIndex(D > radius);
            wr = [w(j,:),radius]; % comment out this line if don't need cluster center&radius
            Cr{cluster} = wr; % comment out this line if don't need cluster center&radius
            cluster = cluster + 1;
        end
        iter = iter + 1;
        m = size(U,1);   
    end
    
end
