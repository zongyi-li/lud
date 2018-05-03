function [wh_v, Y_v, c] =  quadratic(A, T, u, r, mu, S)
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
lambda = sqrt(8*mu)*N*m*S/r; 

%initialize weights c <- [1,...,1] \in \R^n
c = ones(1,m); 

while true
    %define YALMIP symbolic decision variables
    Y = sdpvar(d, d, 'symmetric');
    wh = sdpvar(m, d, 'full');
    w_shift = wh - repmat(u, m,1);
    
    %define our constraint;
    Cons = [Y>=0]; % semidefinite
    %define the first part of our min objective
    Obj =  lambda * trace(Y); 
    for i=1:m
        %w_i w_i' bounded by Y, for all i = 1,...,n
        Cons = [Cons; [Y w_shift(i,:)'; w_shift(i,:) 1] >= 0];
        Obj = Obj + c(i) * T(i) * [1,w_shift(i,:)]*A(:,:,i)*[1,w_shift(i,:)]';
    end
    
    %optimize constraints, objective
    diagnostics = optimize(Cons, Obj);
    wh_v = double(wh); % extracts the optimal values of ws after solving optimization
    Y_v = double(Y);

    if trace(Y_v) <= ((6*r^2)/mu)
        break;
    else
        c = updateWeights(c, ws_v, A, T, mu);    
    end 
end
