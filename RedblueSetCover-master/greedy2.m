%version 2, blue and red sets only contain set from set_index 
function [T ,blue_t,error] = greedy2(set_index,blue,red,p,Y)
blue_save=blue;
red_save=red;
blue_n=sum(blue==1);

%separete to high and low red sets
temp=sum(red'==1);
temp=temp';
%red_high=find((temp>Y)==1);
red_low=find((temp<=Y)==1);
red=red(red_low,:);
red_n=sum(red==1); %get new score for lower red


[bluen,n]=size(blue);
[rm,~]=size(red_save);
cBlue = 0;
T = [];
r=p*bluen-cBlue;
redset=zeros(rm,1);
blueset=zeros(bluen,1);
     

while r > 0
r = p*bluen - cBlue;
if r <=0
    break;
end

score = red_n./blue_n;


%add threhold on it, if the connected blue element is small, then drop it
min_i = find(score==min(score));
blue_i=min_i;%set_index((min_i));
maxblue = blue_n(blue_i);
[~,rank_blue]=max(maxblue);
index = blue_i(rank_blue); %% best choice so far

if blue_n(index==0)
    continue;
end

%update the account
temp = find(red_save(:,index)==1);
redset(temp)=redset(temp)+1;

temp = find(blue_save(:,index)==1);
blueset(temp)=blueset(temp)+1;

index_final = set_index(index);
T=[T index_final]; %% add this index to T
cBlue = cBlue + blue_n(index); %% update cBlue


temp = find(blue(:,index)==1);
[t,~]=size(temp);
blue(temp,:)=zeros(t,n); %%update blue elements matrix
blue_n=sum(blue==1); %%update blue number vector matrix




end

blue_t = sum(blueset>=1);
error = sum(redset>=1);

end