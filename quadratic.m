d = 100;
n = 200;
us = randn(n,d);
vs = randn(n,d);
Y = sdpvar(d, d, 'symmetric');
ws = sdpvar(n, d, 'full');
rho = 1;
lambda = 5;
Cons = [Y>=0];
Obj = lambda * trace(Y);
for i=1:n
    Cons = [Cons; [Y ws(i,:)'; ws(i,:) 1] >= 0];
    Obj = Obj + (rho/2) * sum((ws(i,:) - us(i,:)).^2) - sum(ws(i,:) .* vs(i,:));
end
diagnostics = optimize(Cons, Obj);
ws_v = double(ws); % extracts the optimal values of ws after solving optimization
Y_v = double(Y);