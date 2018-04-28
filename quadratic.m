function [ws_v, Y_v, c] =  quadratic(datay, dataz, T)
% datay: m*d
% dataz: m*1
% ws: m*d
[m,d] = size(datay);
N = sum(T);
r = 1;
mu = 0.1;
c = ones(1,size(T,1)); %initialize weights c <- [1;...;1] \in \R^n
lambda = 5; % sqrt(8*mu)*N*m*S; %for now we define lambda as a constant


%while true
    %define YALMIP symbolic decision variables
    Y = sdpvar(d, d, 'symmetric');
    ws = sdpvar(m, d, 'full');
    
    %define our constraint;
    Cons = [Y>=0];
    %define the first part of our min objective
    Obj = sum((dataz-sum(ws.*datay,2)).^2) + lambda * trace(Y);
    %while true w_1:n, Y is the solution to the minimization problem
    for i=1:m
        %w_i w_i' bounded by Y, for all i = 1,...,n
        Cons = [Cons; [Y ws(i,:)'; ws(i,:) 1] >= 0];
    end
    %optimize - common function for solving optimization problems
    %optimize constraints, objective
    diagnostics = optimize(Cons, Obj);

    ws_v = double(ws); % extracts the optimal values of ws after solving optimization
    Y_v = double(Y);

    if trace(Y_v) > ((6*r^2)/mu)
        c = updateWeights(c, ws_v, datay, dataz,T, Y_v);    
    end 

end
