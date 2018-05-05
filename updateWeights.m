function[c_p] = updateWeights(c, wh, A, T, mu)
%Input:
% c: 1*m, weights for each term
% wh: w_hat m*d matrix from quadratic.m
% A: (d+1)*(d+1)*m, loss matrix.
% T: m*1, number of points in each terms.
% mu: fraction of good points
%Output:
% c_p: cprime, new weights for each term

[m,d] = size(wh);
N = sum(T);

z = zeros(1,m);

for i = 1:m
    %define variables for optimization
    ai = sdpvar(1, m, 'full');
    wt = sdpvar(1, d,'full');
    %wt = ai*wh;
    
    % objective
    Obj = [1,wt]*A(:,:,i)*[1,wt]';

    %define our constraint;        
    Cons = [wt == ai*wh; 
            sum(ai) == 1; 
            0 <= ai <= 2/(mu*N)*T];
        
    ops = sdpsettings('solver','mosek','verbose',0); % 'verbose'=0  => not print
    diagnostics = optimize(Cons, Obj, ops);

    wt_v = double(wt);
    
    %disp(i);
    disp(wt_v);
    
    z(i) = abs([1,wt-wh(i,:)]*A(:,:,i)*[1,wt-wh(i,:)]');

end
disp(z);

z_max = max(z(c~=0));
c_p = c .* ((z_max - z)/z_max);
disp(c_p);

end
