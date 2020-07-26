function d = DWT(c,wname)
d=[];
while(length(c)>1)
    [c1,d1]=dwt(c,wname,'mode','sym');
    d0=[d;d1];c=c1;d=d0;
end
d=[d;c];
end
