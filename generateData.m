function [new_X new_YZ] = generateData(num_data, x_dim, y_dim, satisfy_rate, num_term, b)
% @num_data: size of data wanted to generate
% @x_dim: dimension of X
% @y_dim: dimension of Y
% @a_dim: dimension of a (linear predictor)
% @satisfy_rate: rate of the data satisfying the 2-dnf
% @num_term: number of term of the 2-dnf
% @b: upper bound of norm(a)

% generate planted 2-dnf
dnf = randi([-x_dim x_dim], num_term, 2);
while (nnz(dnf) ~= 2*num_term)
    dnf = randi([-x_dim x_dim], num_term, 2);
    for i = 1:num_term
        if (abs(dnf(i,1))==abs(dnf(i,2)))
            continue;
        end
    end
end

% generate X
satisfy = floor(num_data*satisfy_rate);
X = zeros(num_data, x_dim);

% generate Xs that satisfy the planted 2-dnf
for i = 1:satisfy
    while (true)
        X(i,:) = randi([0 1], 1,x_dim);
        check = true;
        for j = 1:num_term
            if (sgn(X(i,abs(dnf(j,1))))==sgn(dnf(j,1)) && sgn(X(i,abs(dnf(j,2))))==sgn(dnf(j,2)))== false
                check = false;
                break;
            end
        end
        if check ==true
            break;
        end
    end
end

% generate Xs that falsify the planted 2-dnf
for i = (satisfy+1):num_data
    while (true)
        X(i,:) = randi([0 1], 1,x_dim);
        check = true;
        for j = 1:num_term
            if (sgn(X(i,abs(dnf(j,1))))==sgn(dnf(j,1)) && sgn(X(i,abs(dnf(j,2))))==sgn(dnf(j,2)))
                check = false;
                break;
            end
        end
        if check ==true
            break;
        end
    end
end


% generate parameter Mu & planted regression dimension
mu = normrnd(0, 0.1,1,satisfy);

% generate the coefficient 
while (true)
    coeff = normrnd(0,0.1,1,y_dim);
    if (norm(coeff)<= b) 
        break;
    end
end

% generate Y and Z
Y = unifrnd(-b,b, num_data,y_dim);
z_true = coeff * Y(1:satisfy, :)' + mu;
z_true = z_true';

z_false = normrnd(0,1,num_data-satisfy,1);
Z = [z_true; z_false];
data = [Y Z];

% shuffle data
newRowOrder = randperm(num_data);
new_X = X(newRowOrder, :);
new_YZ = data(newRowOrder, :);

% % save data
 csvwrite(strcat("YZ_m",num2str(num_data),".csv"), new_YZ);
 csvwrite(strcat("X_m",num2str(num_data),".csv"), new_X);
 csvwrite(strcat("DNF_m",num2str(num_data),".csv"), dnf);
 csvwrite(strcat("dim_m",num2str(num_data),".csv"), planted_dim);
 csvwrite(strcat("coeff_m",num2str(num_data),".csv"), coeff);
 csvwrite(strcat("mu_m",num2str(num_data),".csv"), mu);
end

% helper function
function val = sgn(x)
if (sign(x) > 0)
    val = 1;
else
    val = -1;
end
end