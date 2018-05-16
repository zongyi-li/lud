function [datax, datayz] = getData_sin_new(N, scale, noise)
datay = 2*pi*rand(N,1)-pi;

if noise == 0
    noise = zeros(N,1); % no noise
else
    noise = normrnd(0, noise, N, 1) * scale;
end

dataz = scale * sin(datay) + noise;
datayz = [ones(N,1), datay, dataz];

datax = false(N,3);
% x1: y >= -pi/2, x2: y >= 0, x3: y >= pi/2
datax(:,1) = datay >= -pi/2;
datax(:,2) = datay >= 0;
datax(:,3) = datay >= pi/2;
end