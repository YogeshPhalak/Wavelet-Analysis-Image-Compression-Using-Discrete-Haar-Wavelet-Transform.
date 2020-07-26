function out = IDWT(d,wname)
n=length(d);
ind=[n-1,n-1];
c=d(n);di=d(ind(1):ind(2));
while(length(di)<n/2)
ci=idwt(c,di,wname,'mode','sym');
c=ci;
ind(2)=ind(1)-1;
ind(1)=ind(2)-length(c)+1;
di=d(ind(1):ind(2))';
end
out = idwt(c,di,wname,'mode','sym');
end  
