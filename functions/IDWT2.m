function out=IDWT2(d,wname)
n=length(d);
a=2;
c=d(1:ceil(a/2),1:ceil(a/2));
d1j=d(1:ceil(a/2),ceil(a/2)+1:a);
d2j=d(ceil(a/2)+1:a,1:ceil(a/2));
d3j=d(ceil(a/2)+1:a,ceil(a/2)+1:a);
while(length(c)<n/2)
    cj = idwt2(c,d1j,d2j,d3j,wname);
    a=2*length(cj);    
    c=cj;
    d1j=d(1:ceil(a/2),ceil(a/2)+1:a);
    d2j=d(ceil(a/2)+1:a,1:ceil(a/2));
    d3j=d(ceil(a/2)+1:a,ceil(a/2)+1:a);
end

out = idwt2(c,d1j,d2j,d3j,wname);
end
