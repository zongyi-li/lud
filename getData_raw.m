function[datax, datayz, trueError] = getData_raw(dimx, dimy, N, mu, scale, noise, DNF, wstar)
% DNF is the 2*(2dimx) matrix, each row encode a term.
% wstar 1*dimy
% mu is the feature of good points.

% generate good points
numGoodpoint = ceil(mu*N);
datax_good = zeros(numGoodpoint,dimx);
num = 0;
while num < numGoodpoint
    datax_new = randi(2,[N,dimx])-1;
    DNFindex_new = false(N,1);

    for t = 1:size(DNF,1)   
        x1 = DNF(t,1);
        x2 = DNF(t,2);
        x1_value = mod(x1,2);
        x1_index = (x1-x1_value)/2 + 1;
        x2_value = mod(x2,2);
        x2_index = (x2-x2_value)/2 + 1;

        term = (datax_new(:,x1_index)==x1_value & datax_new(:,x2_index)==x2_value);
        DNFindex_new = DNFindex_new | term ;
    end
    num_new = sum(DNFindex_new);
    datax_good(num+1:num+num_new, :) = datax_new(DNFindex_new,:);
    num = num + num_new;
end    
datax_good = datax_good(1:numGoodpoint,:);

% generate bad points
numBadpoint = N - numGoodpoint;
datax_bad = zeros(numBadpoint,dimx);
num = 0;
while num < numBadpoint
    datax_new = randi(2,[N,dimx])-1;
    DNFindex_new = true(N,1);

    for t = 1:size(DNF,1)   
        x1 = DNF(t,1);
        x2 = DNF(t,2);
        x1_value = mod(x1,2);
        x1_index = (x1-x1_value)/2 + 1;
        x2_value = mod(x2,2);
        x2_index = (x2-x2_value)/2 + 1;

        term = not(datax_new(:,x1_index)==x1_value & datax_new(:,x2_index)==x2_value);
        DNFindex_new = DNFindex_new & term ;
    end
    num_new = sum(DNFindex_new);
    datax_bad(num+1:num+num_new, :) = datax_new(DNFindex_new,:);
    num = num + num_new;
end    
datax_bad = datax_bad(1:numBadpoint,:);


datax = [datax_good; datax_bad];

DNFindex = false(N,1);
for t = 1:size(DNF,1)   
    x1 = DNF(t,1);
    x2 = DNF(t,2);
    x1_value = mod(x1,2);
    x1_index = (x1-x1_value)/2 + 1;
    x2_value = mod(x2,2);
    x2_index = (x2-x2_value)/2 + 1;

    term = (datax(:,x1_index)==x1_value & datax(:,x2_index)==x2_value);
    DNFindex = DNFindex | term ;
end


datayz = (2*rand(N, dimy+1) - 1);
datayz(:,end) = datayz(:,end) * scale;
if noise == 0
    noise = zeros(sum(DNFindex),1); % no noise
else
    noise = normrnd(0, noise, sum(DNFindex),1) * scale;
end
datayz(DNFindex,end) = datayz(DNFindex,1:end-1) * wstar' + noise;

Y = datayz(DNFindex,1:end-1);
Z = datayz(DNFindex,end);
trueError = [1,wstar]*[Z'*Z ,-1*Z'*Y ;-1*Y'*Z, Y'*Y]*[1,wstar]' / sum(DNFindex);

end