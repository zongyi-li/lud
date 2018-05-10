function[UCans] = setcover(datax, datayz, U, W, mu, termIndex, rfinal,remainingIndex,epsilon, threshold) 
% ans: a list of pairs (u,c), where w is the regression fit, c is the k-DNF

UCans = {};
m = size(W,1);
N = size(datax,1);
termIndex = termIndex(remainingIndex,:); 
iter = 1;
for i=1:size(U,1)
    u = U(i,:);
    % we only consider these terms that within 3*rfinal of u.
    D = sqrt(sum((repmat(u,m,1) - W).^2,2));
    selected = D <= 3 * rfinal;
    newtermIndex = termIndex(selected,:); % termIndex(i,:): boolean array, datax indices of term i
    %W = W(selected,:);
    % calculate the total number of points of these terms
    points = sum(newtermIndex, 1)>0;
    numPoints = sum(points);
    if numPoints > mu*N*(1-epsilon)
        % greedy setcover for this particular u
        newremainingIdx = remainingIndex(selected);
        numSelectedPoints = 0;
        DNF = [];
        totalLoss = 0;
        while true
            % greedily find the next best term
            maxrate = -Inf;
            bestTerm = NaN;
            for t = 1:size(newtermIndex, 1)
                Y = datayz(newtermIndex(t,:),1:end-1);
                Z = datayz(newtermIndex(t,:),end);
                loss = [1,u]*[Z'*Z ,-1*Z'*Y ;-1*Y'*Z, Y'*Y]*[1,u]';
                termRate = sum(newtermIndex(t,:)) ./ loss;
                if termRate > maxrate
                    bestTerm = t;
                    maxrate = termRate;
                    totalLoss = totalLoss + loss;
                end
            end
            DNF = [DNF, newremainingIdx(bestTerm)];
            numSelectedPoints = numSelectedPoints + sum(newtermIndex(bestTerm,:));
            if numSelectedPoints > mu*N*(1-epsilon)
                error = totalLoss / numSelectedPoints;
                break
            end

            % update termIndex, for all other terms, set points in bestTerm to 0
            newtermIndex(:, newtermIndex(bestTerm,:)> 0) = 0; 
            % remove bestTerm from newtermIndex, for the next iteration
            newtermIndex = newtermIndex([1:bestTerm-1,bestTerm+1:end],:);
            newremainingIdx = newremainingIdx([1:bestTerm-1,bestTerm+1:end]);
        end
        %if error <= threshold
        UCans{iter}.u = u;
        UCans{iter}.c = DNF;
        UCans{iter}.error = error;
        iter = iter + 1;
        %end
    end
end

end