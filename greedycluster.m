function [U] = greedycluster(W, rfinal, epsilon, muN, T)

%Input
% W: m*d, w for each terms.
% muN is mu * N, number of good points.
%Output
% U is a list of w, as the center of ball.

% We iterate through all w in W, check if there exist enough point within distance 
m = size(W,1); % number of (remaining) rows of W

U = [];

list = randperm(m);
uidx = 1;

for iter=1:m
	j = list(iter);
	w_star = repmat(W(j,:),m,1);
	D = sqrt(sum((w_star - W).^2,2));
	num_intersect = sum(T(D <= 2*rfinal));
        
    if (num_intersect >= (1-epsilon)*muN) 
        if uidx == 1
            % the first w in the list, if satisfy the above condition, will
            % be added to U
            U(uidx,:) = W(j,:);
            uidx = uidx + 1;
        else
            % check if W(j,:) has distance at least 4rfinal to all u in U
            DU = sqrt(sum((w_star(1:uidx-1,:) - U).^2,2));
            if sum(DU <= 4*rfinal) == 0
                % satisfy both conditions, add W(j,:) to U
                U(uidx,:) = W(j,:);
                uidx = uidx + 1;
            end
        end
    end     
end    
end
