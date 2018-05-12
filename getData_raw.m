function[datax, datayz, mu, trueError] = getData_raw(dimx, dimy, N, scale, noise, DNF, wstar)
%DNF is the 2*(2dimx) matrix, each row encode a term.
%wstar 1*dimy


datax = randi(2,[N,dimx])-1;
datayz = (2*rand(N, dimy+1) - 1) * scale;
DNFindex = zeros(N,1);

for t = 1:size(DNF,1)   
    x1 = DNF(t,1);
    x2 = DNF(t,2);
    x1_value = mod(x1,2);
    x1_index = (x1-x1_value)/2 + 1;
    x2_value = mod(x2,2);
    x2_index = (x2-x2_value)/2 + 1;

    term = (datax(:,x1_index)==x1_value & datax(:,x2_index)==x2_value);
    DNFindex = (DNFindex + term >=1 );
end
    
mu = sum(DNFindex)/N;
% noise = zeros(sum(DNFindex),1); no noise
noise = normrnd(0, noise, sum(DNFindex),1) * scale;
datayz(DNFindex,end) = datayz(DNFindex,1:end-1) * wstar' + noise;

Y = datayz(DNFindex,1:end-1);
Z = datayz(DNFindex,end);
trueError = [1,wstar]*[Z'*Z ,-1*Z'*Y ;-1*Y'*Z, Y'*Y]*[1,wstar]' / sum(DNFindex);

end