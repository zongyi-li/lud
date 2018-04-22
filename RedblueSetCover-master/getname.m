function result=getname(name,index,k, n_2dnf)
%This test version one is for no inverse only
if k==1
    result=name(index);
    return
end

 if (index > n_2dnf) % the result is 1-dnf form
     result=name(n_2dnf-index);
     return;
 end

 
if k==2
[n,~]=size(name);
namei=[];
for i=1:1:(n-1)
    for j=i+1:1:n
        temp=[i,j];
        namei=[namei;temp];
    end
end

for i=1:1:n
    temp=[i,i];
    namei=[namei; temp];
end
end

if k==3
[n,~]=size(name);
namei=[];
for i=1:1:n-2
    for j=i+1:1:n-1
        for k=j:1:n
            temp=[i,j,k];
            namei=[namei;temp];
            
        end
    end
    
end
end


disp(index);
disp(namei);
result=namei(index,:);
result=name(result);


