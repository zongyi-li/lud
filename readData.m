function[datax, datayz] = readData()
    data = csvread('syntheticdata_attributes-2.csv');
    datax = data(:,1:6);
    datayz = data(:, 7:end);
end