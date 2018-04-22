%combine 2-dnf with 1-dnf values together
function sample2()
k_train = 3;
for o=1:4
 

p=[0.001 0.003 0.005 0.01 0.03 0.05];
[~,np]=size(p);
error_all = zeros(2,np);
filename = strcat('data',num2str(o));
load(filename);
[n,~]=size(blue);
[train,test] = split(k_train,n);
for fold=1:3
        
%1.prepare for 2dnf
filename = strcat('data',num2str(o));
load(filename);
[n,~]=size(blue);
%blue=[blue blue==0];
%2.split data with train and test




blue_test=blue(test{fold},:);
blue = blue(train{fold},:);

ano_test = ano(test{fold});
ano = ano(train{fold});

red=blue(find(ano==0),:);
red_test=blue_test(find(ano_test==0),:);


red_n=sum(red==1);
[image,~]=size(blue);
fill=find(red_n/image < 0.8);
blue=blue(:,fill);
red=red(:,fill);
name=name(fill);

blue_test=blue_test(:,fill);
red_test=red_test(:,fill);


savename = strcat('name',num2str(o));
save(savename,'name');

[~,n]=size(blue);
%3.get 2-dnf for test and training
 [blue_new,red_new]=get2DNF(blue,red,n);
 [blue_test_new,red_test_new]=get2DNF(blue_test,red_test,n);
 
 [~,n_2dnf]=size(blue_new);
 %3.2 append 1-dnf at back
blue=[blue_new blue];
red=[red_new red];

blue_test=[blue_test_new blue_test];
red_test=[red_test_new red_test];

clear k final_blue2 final_red2 image n i j temp_b temp_r p;
clear fill blue_test_new red_test_new blue_new red_new;
clear red_n;
clear temp;
clear final_blue;
clear final_red;
clear att;
clear ano2 filename theta
clear blue_1 blue_t red_1 red_t
savename = strcat('name',num2str(o));
save(savename,'name');
clear savename;

%====================2.running test for redblue_large=====================
[im,n]=size(blue);

blue_n=sum(blue==1);
red_n=sum(red==1);
[~,red_rank]=sort(red_n); %index, small to large

%1.filt out all red_n>80% of all blue_n
red_t=red_n<=(im*0.8);
cut=sum(red_t);
red_rank=red_rank(1:cut);
clear red_t;
%2.
cut=[1];
current=red_n(red_rank(1));
j=0;
red_rank_t=[];

%1.2 filt out small amount of element , threhold = 10
threhold = im*0.03*0.01;




for i=red_rank
    if blue_n(i) ~= 0  && red_n(i)/blue_n(i) < 0.999 && red_n(i)/im<0.8
        red_rank_t=[red_rank_t i];
    if red_n(i) ~= current
        current = red_n(i);
        cut=[cut cut(end)+j];
        j=0;       
    end
    j=j+1;
    end
end
[~,j]=size(red_rank_t);
cut=[cut j+1];
clear j; clear current;
red_rank=red_rank_t; clear red_rank_t;

%=======================================================================
set_index=[];
blueset=zeros(im,1);

f_result=[];
f_red=[];
f_blue=[];
f_error=[];
[~,cut_n]=size(cut);
pi_n=1;

result_all = cell(1,np);
error_temp=zeros(2,np);
error_train=zeros(2,np);
z=1;
p=[0.001 0.003 0.005 0.01 0.03 0.05];
for pi = p
    goal=pi*im;
    y=Y(n,im,pi);
    j=1;
    result_cut=ones(1,cut_n);
    error=1;
    last=1;
    min=1;
    min_cut=1;
    g=1;
while g<=cut_n
    i=cut(g);
    if (i==1) %|| g*100/cut_n <2 
        g=g+1;
        continue;
    end
    %if blue_n(i) ~= 0 
    set_index=red_rank(1:(i-1));
%check if reach goal
k=1:(i-1);
temp=blue(:,red_rank(k));
temp=sum(temp'==1);
bluenumber_max=sum(temp>=1); 
       if bluenumber_max >= goal
           blue_temp=blue(:,set_index);
           red_temp=red(:,set_index);
           
           threhold=5;
           blue_temp_n=sum(blue_temp);
           [~,blue_rank]=sort(blue_temp_n);
           blue_temp_t=blue_temp_n<=threhold;
           blue_cut=sum(blue_temp_t);
           blue_rank=blue_rank(blue_cut+1:end);
           
           blue_temp=blue(:,set_index(blue_rank));
           red_temp=red(:,set_index(blue_rank));
           
           temp=sum(blue_temp'==1);
           bluenumber_max=sum(temp>=1);
           
           if(bluenumber_max < goal)
               last=error;
               g=g+1;
               continue;
           end
           
           
           
           [result_t,bluenumber_t,rednumber_t] = greedy2(set_index,blue_temp,red_temp,pi,y);
           error=rednumber_t/bluenumber_t;
           result_cut(g)=error;
           %[result_t,bluenumber_t,rednumber_t] = greedy(set_index,blue,blue_n,red,red_n,pi);
           %%get result, then calcualte how many blue covered          
           if min>error
               min=error;
               min_cut=g;
           end          
           %speed up algoirthm
           if error - last < 0.001 && error - last >= 0 %consider as same
               %speed up
               g=g+20;
               last=1;
           elseif error - last > 0.005 %consider as larger
               g=g+20;
               last=1;
           elseif error -min > 0.01
               g=cut_n;
               last=1;
           end
           
           if error > 0.6
               g=cut_n;
           end
           
           %speed up end
               
       end
   process=g/cut_n;
   %fprintf('Now at process: %.3f\n Error is %.3f\n',process,error); 
   last=error;
   g=g+1;
        
   end 
    j=i;

 index=min_cut;
 i=cut(index);
 set_index=red_rank(1:(i-1));
 blue_temp=blue(:,set_index);
 red_temp=red(:,set_index);
 [result,bluenumber,rednumber] = greedy2(set_index,blue_temp,red_temp,pi,y);
 errorfortrain=rednumber/bluenumber;
 
 %===============if there is testing data ========================
temp_b=blue_test(:,result);
[~,check]=size(temp_b);
if check ~=1
temp_b=sum(temp_b');
end
temp_b=temp_b>0;

temp_r=red_test(:,result);
if check ~=1
temp_r=sum(temp_r');
end
temp_r=temp_r>0;
error_t=sum(temp_r)/sum(temp_b);
%otherwise delete!!!!!!!!!!!!!!!!!!!!!!!!

[imt,~]=size(blue_test);
error_temp(1,z)=error_t;
error_temp(2,z)=sum(temp_b)/imt;

error_train(1,z)=errorfortrain;
error_train(2,z)=bluenumber/im;

result=getname(name,result,2,n_2dnf);
result_all{z}=result;
z=z+1;
end
error_all = error_all+error_temp;
savename = strcat('2dnf',num2str(o));
savename = strcat(savename,num2str(fold));
save(savename,'result_all','error_temp','error_all','error_train');
end

%result = error_all/3;    
end
end

function [blue,red]=get2DNF(blue,red,n)
final_blue=[];
final_red=[];
    for i=1:1:(n-1)  
    blue_t=blue(:,i+1:end);
    blue_1=blue(:,i);
    blue_1=repmat(blue_1,1,n-i);
    
    red_t=red(:,i+1:end);
    red_1=red(:,i);
    red_1=repmat(red_1,1,n-i);
   
    temp_r=red_1&red_t;
    red_n=sum(temp_r==1);
    
    temp_b=blue_1&blue_t;
    blue_n=sum(temp_b==1);

   % final_red=[final_red temp(add)];
    final_red=[final_red temp_r];
    
    temp=blue_1&blue_t;
   % final_blue=[final_blue temp(add)];
   final_blue=[final_blue temp_b];   
    final_blue=final_blue>0;
    final_red=final_red>0;
end
blue=final_blue;
red=final_red;
blue=blue>0;
red=red>0;
end

function [blue,red]=get3DNF(blue,red,n)
final_blue=[];
final_red=[];
blue=blue>0;
red=red>0;
[~,n]=size(blue);

for i=1:1:n-2
    for j=i+1:1:n-1
        for k=j:1:n
            temp_b=blue(:,i)&blue(:,j)&blue(:,k);
            temp_r=red(:,i)&red(:,j)&red(:,k);
            final_blue=[final_blue temp_b];
            final_red=[final_red temp_r];
            
        end
    end
    final_blue=final_blue>0;
    final_red=final_red>0;

end



blue=final_blue;
red=final_red;
blue=blue>0;
red=red>0;
end
