% dataset = zeros(100, 11);
% dataset(:,1:10) = 2*rand(100,10)-1;
% w = ones(10,1);
% noise = normrnd(0,0.2,10,1);
% dataset(1:10,end) = dataset(1:10,1:10) * w + noise;
% dataset(11:end,end) = 2*rand(90,1)-1;
% 
% T = ones(100,1);
% 

r1 = normrnd(0,5,50,1);
r2 = normrnd(100,5,50,1);
r3 = normrnd(200,5,50,1);
w = [r1;r2;r3];
n = 150;
delta = 0.1;
I = 1/4;
tau = 2*5;
rho = 1+1/delta*log(n/I);
[P,k] = padded(w, rho, tau);

