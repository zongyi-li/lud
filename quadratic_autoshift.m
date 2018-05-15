function [wh_v, Y_v, c] =  quadratic_autoshift(A, T, r, mu_new, S, quad_maxiter)
%Input:
% A: (d+1)*(d+1)*m, loss matrix.
% T: m*1, number of points in each terms.
% u: 1*d, shift.
% r, mu, S

%Output:
% wh: m*d, w for each terms.
% Y: d*d, the "ellipse" bounds w.
% c: 1*m, weights for each term.

m = size(A,3); 
d = size(A,1) - 1;
N = sum(T);

%for now we define lambda as a constant
lambda = sqrt(8*mu_new)*N*S/r; 
% disp(lambda);

%initialize weights c <- [1,...,1] \in \R^n
c = ones(1,m); 

for t = 1:quad_maxiter
    %define YALMIP symbolic decision variables
    Y = sdpvar(d, d, 'symmetric');
    wh = sdpvar(m, d, 'full');
    u = sdpvar(1, d, 'full');
    %w_shift = wh - repmat(u, m,1);
    
    %define our constraint;
    Cons = [Y>=0]; % semidefinite
    %define the first part of our min objective
    Obj =  lambda * trace(Y); 
    for i=1:m
        %w_i w_i' bounded by Y, for all i = 1,...,n
        Cons = [Cons, [Y, (wh(i,:)-u)'; (wh(i,:)-u), 1] >= 0];
        Obj = Obj + c(i) * [1,wh(i,:)]*A(:,:,i)*[1,wh(i,:)]';
    end
    %optimize constraints, objective
    ops = sdpsettings('solver','mosek','verbose',0); % 'verbose'=0  => not print
    diagnostics = optimize(Cons, Obj, ops);
    wh_v = double(wh); % extracts the optimal values of ws after solving optimization
    Y_v = double(Y);

    % disp(t); disp(wh_v); disp(trace(Y_v)); disp((6*r^2)/mu);
    if trace(Y_v) <= ((6*r^2)/mu_new)
        break;
    else
        c = updateWeights(c, wh_v, A, T, mu_new);    
    end
    
    disp(t); disp(c);disp(wh_v);
end
