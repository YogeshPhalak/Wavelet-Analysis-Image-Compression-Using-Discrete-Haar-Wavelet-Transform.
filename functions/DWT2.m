function out=DWT2(c,wname)
[cj,d1j,d2j,d3j]=dwt2(c,wname);
n=length(cj);out=zeros(2*n,2*n);
out(1:2*n,1:2*n)=[zeros(n),d1j;d2j,d3j];
while(length(c)>1)
    [cj,d1j,d2j,d3j]=dwt2(c,wname);
    n=length(cj);c=cj;
    out(1:2*n,1:2*n)=[zeros(n),d1j;d2j,d3j];
end
out(1,1)=c;
end
