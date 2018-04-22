%n_train: how many fraction for train
%k      : how many folders
%n      : how many data samples total

%1      : it is trainning sample
%2      : it is testing sample
function [train,test] = split(k,n)
% a = rand(n,1) > (1-f_train);
% train = find(a==1); 
% test=find(a==0);
p = randperm(n);
s = floor(n/k);
test=cell(k,1);
train=cell(k,1);

% for i=1:(k-1)
%     test{i}=p((i-1)*s+1:i*s);
% end
% test{k}=p((k-1)*s+1:end);

 test{1}=p(1:s);
 train{1}=[p(s+1:2*s) p(2*s+1:end)];

 test{2}=p(s+1:2*s);
 train{2}=[p(1:s) p(2*s+1:end)];
 
 test{3}=p(2*s+1:end);
 train{3}=[p(1:s) p(s+1:2*s)];




end