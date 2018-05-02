function [wh_v, Y_v, c] =  quadratic(A, T, u)
%Input:
% A: (d+1)*(d+1)*m, loss matrix.
% T: m*1, number of points in each terms.
% u: 1*d, shift.

%Output:
% wh: m*d, w for each terms.
% Y: d*d, the "ellipse" bounds w.
% c: 1*m, weights for each term.


m = size(A,3);   %[m,d] = size(datay);
d = size(A,1) - 1;
N = sum(T);

r = 1;
mu = 0.1;
lambda = 5; % sqrt(8*mu)*N*m*S; %for now we define lambda as a constant

c = ones(1,m); %initialize weights c <- [1;...;1] \in \R^n

%while true
    %define YALMIP symbolic decision variables
    Y = sdpvar(d, d, 'symmetric');
    wh = sdpvar(m, d, 'full');
    w_shift = wh - repmat(u, m,1);
    
    %define our constraint;
    Cons = [Y>=0];
    %define the first part of our min objective
    Obj =  lambda * trace(Y); % Obj = sum((dataz-sum(ws.*datay,2)).^2) + lambda * trace(Y);
    
    %while true w_1:n, Y is the solution to the minimization problem
    for i=1:m
        %w_i w_i' bounded by Y, for all i = 1,...,n
        Cons = [Cons; [Y w_shift(i,:)'; w_shift(i,:) 1] >= 0];
        Obj = Obj + T(i) * [1,w_shift(i,:)]*A(:,:,1)*[1,w_shift(i,:)]';
    end
    %optimize - common function for solving optimization problems
    %optimize constraints, objective
    diagnostics = optimize(Cons, Obj);

    wh_v = double(wh); % extracts the optimal values of ws after solving optimization
    Y_v = double(Y);

    if trace(Y_v) > ((6*r^2)/mu)
        % c = updateWeights(c, ws_v, datay, dataz,T, Y_v);    
    end 

end
