function image=getImage(name,blue,ano,term)
blue=[blue blue==0];
[n,~]=size(term);
image=zeros(n,1);

for i=1:1:n
    a1=term{i,1};
    a2=term{i,2};
    a1
    b1 = findName(name,a1)
    name(b1)
    a2
   
    b2 = findName(name,a2)
    name(b2)
    
    tempb=blue(1:end,b1)&blue(1:end,b2);
    index = find(tempb==0);
    ano2=ano;
    ano2(index)= 0;
    index2=find(ano2==1);
    index2

    image(i,1:1)=index2(1);  
end
end

function index=findName(name,a)
index=0;
[~,t2]=size(a);
b = strfind(name, a);
b = find(not(cellfun('isempty', b)));
[n,~]=size(b);
for i=1:1:n
    [~,t]=size(name{b(i)});
    if (t==t2)
    index=b(i);
    end
end


end