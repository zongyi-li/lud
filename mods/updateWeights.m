function[c_p] = updateWeights(c, wh, Yh)

%define variables for optimization
[m,n] = size(wh);

%need to define the size of a
a = sdpvar(length(diag(Y(1))), 1, 'full');
wt = sdpvar(m,n,'full');

a = diag(Yh);

alpha = 0.1;
m = length(w);
z = zeros(1,m);
c_p = zeros(1,m);

for i = 1:m

    %define our constraint;
    wt = sum(subs(a(i,j)*w(j), j, 1:m));

    Obj = f_i(wt);
    Cons = [wt; 2/(alpha*n) >= a(i,:) >= 0; sum(subs(a(i,k),k,1:m)) == 1];
   
    
end

diagnostics = optimize(Cons, Obj);
%once we get \tilde(w) from the solution of the optimization, we can get
%z_i
wt_v = double(wt);
for p = 1:m
    z(p) = f_i(wt_v(p)) - f_i(wh(p));
end

z_max = max(z);
for i = 1:m
    c_p(i) = c(i)*( (z_max - z(i))/z_max );
end
return;
