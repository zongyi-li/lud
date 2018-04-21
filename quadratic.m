function [ws_v, Y_v] =  quadratic(f,T)
    [n,d] = size(f);
    c = ones(1,y); %initialize c <- [1;...;1] \in \R^n
    
    lambda = 5; %for now we define lambda as a constant
    r = 2;
    alpha = 0.9;


    while true
        %define YALMIP symbolic decision variables
        Y = sdpvar(d, d, 'symmetric');
        ws = sdpvar(n, d, 'full');

        %define our constraint;
        Cons = [Y>=0];
        %define the first part of our min objective
        Obj = lambda * trace(Y);
        %while true w_1:n, Y is the solution to the minimization problem
        for i=1:n
            %w_i w_i' bounded by Y, for all i = 1,...,n
            Cons = [Cons; [Y ws(i,:)'; ws(i,:) 1] >= 0];
            Obj = Obj + (T(i))*c(i) * sum((ws(i,:)-dot(us(i,:),vs(i,:)))^2);
        end
        %optimize - common function for solving optimization problems
        %optimize constraints, objective
        diagnostics = optimize(Cons, Obj);

        ws_v = double(ws); % extracts the optimal values of ws after solving optimization
        Y_v = double(Y);

        if trace(Y_v) <= ((6*r^2)/alpha)
            return;
        else 
            c = updateWeights(c, ws_v, Y_v);    
        end 
    end 
end 
