function [lossMat, T, termIndex, DNFcell, DNFmat] = preprocessing(datax, datayz, mu, epsilon)
% assume k = 2; i.e. two terms


% LossMat: (d+1)*(d+1)*m
% T: 1*m
% termIndex: m*N

dimx = size(datax,2);
d = size(datayz,2)-1;
N = size(datax,1);

m = 2*dimx^2; %(2*dimx choose 2) possible terms, locate memory for lossMat and T
lossMat = zeros(d+1,d+1,m);
T = zeros(1,m);
termIndex = false(m,N);
DNFcell = cell(m,1);
DNFmat = zeros(m,6);

i = 0;
for t1 = 0:(2*dimx)-1
    x1_value = mod(t1,2);
    x1_index = (t1-x1_value)/2 + 1;
    for t2 = t1:(2*dimx)-1
        x2_value = mod(t2,2);
        x2_index = (t2-x2_value)/2 + 1;
        
        term = (datax(:,x1_index)==x1_value & datax(:,x2_index)==x2_value);
        if sum(term) >= mu* N * epsilon
            i=i+1;
            DNFcell{i} = DNFstring_format(x1_value, x1_index, x2_value, x2_index);
            DNFmat(i,1:2) = [t1,t2];
            DNFmat(i,3:6) = [x1_value,x1_index,x2_value,x2_index];
            T(i) = sum(term);
            Y = datayz(term,1:end-1);
            Z = datayz(term,end);
            lossfunc = [Z'*Z ,-1*Z'*Y ;-1*Y'*Z, Y'*Y];
            lossMat(:,:,i) = lossfunc;
            termIndex(i,:) = term';
        end
    end
end
DNFcell = DNFcell(1:i,:);
DNFmat = DNFmat(1:i,:);
lossMat = lossMat(:,:,1:i);
T = T(1,1:i);
termIndex = logical(termIndex(1:i,:));
end