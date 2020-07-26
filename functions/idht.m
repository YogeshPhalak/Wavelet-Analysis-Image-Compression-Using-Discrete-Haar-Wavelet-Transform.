function out=idht(d)
n=length(d);N=2^(ceil(log(n)/log(2)));
d=padarray(d,N-n,0);
ind=[N-1,N-1];
c=d(N);
for i=0:log(N)/log(2)-1
    di=d(ind(1):ind(2));
     w=W(2^(i+1));
     ci=w'*[c;di];
     c=ci;
ind=ind-[2^(i+1),2^(i)];
end
out = c;
end  

function mat = W(L)
n = floor(L/2);
HL = zeros(n,L);
GL = zeros(n,L);

for i = 0:n-1
    HL(i+1,2*i+1)=1/2^0.5;HL(i+1,2*(i+1))=1/2^0.5;
    GL(i+1,2*i+1)=1/2^0.5;GL(i+1,2*(i+1))=-1/2^0.5;
end
mat = [HL;GL];
end
