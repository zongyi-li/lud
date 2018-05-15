function[datax, datayz] = readData()
    data = csvread('syntheticdata_attributes.csv');
    datax = data(:,1:6);
    datayz = data(:, 7:end);
end