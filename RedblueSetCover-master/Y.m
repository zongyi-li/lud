function y=Y(n,b,p)
result=0;
x=round(b*p);
for i=1:1:x
    result=result+1/i;
end


result=n/result;
result=sqrt(result);
y=result;

end