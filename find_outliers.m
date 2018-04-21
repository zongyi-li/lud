function taus = find_outliers(U, D, V, s)
    tic; disp('waterfall method...');
    % waterfall method
    lambda = diag(D);
    r = length(lambda);
    weights = zeros(r,1);
    index = 1;
    while sum(weights.^2) < s
        weights(1:index) = weights(1:index) + (lambda(index) - lambda(index+1)) ./ (lambda(1:index));
        index = index+1;
    end
    % sum(w.^2) - 2 * epsilon * sum(w) + epsilon^2 = s
    % epsilon = (sum(w) - sqrt(sum(w)^2 - 4*(sum(w.^2) - s)))/2;
    nz = nnz(weights);
    correction = (sum(weights) - sqrt(sum(weights)^2 - nz * (sum(weights.^2) - s))) / nz;
    weights = max(weights-correction, 0);
    toc;
    
    % compute Y matrix
    tic; disp('computing sqrtY...');
    active = logical(weights>0);
    sqrtY = diag(lambda.^(-1) .* sqrt(weights ./ (1-weights))) * V';
    sqrtY = sqrtY(active, :);
    toc;
    
    % compute projection
    tic; disp('computing projection');
    Xproj = U * diag(lambda .* (1-weights)) * V';
    Proj = U * diag(weights) * U';
    toc;
    
    % compute tau
    tic; disp('computing tau');
    n = size(Xproj, 1);
    taus = zeros(n,1);
    for i=1:n
        taus(i) = norm(sqrtY * Xproj(i,:)', 2)^2 + norm(Proj(i,:), 2)^2;
    end
    toc;
end