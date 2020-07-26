function out = dht(c)
n=length(c);N=2^(ceil(log(n)/log(2)));
c=padarray(c,N-n,0);
out=zeros(N,1);
ind=[1,N/2];
for i=0:log(N)/log(2)-1
    w=W(N/2^(i));
    wi=w*c;
    ci=wi(1:N/2^(i+1));di=wi(N/2^(i+1)+1:N/2^(i));
    c=ci;
    out(ind(1):ind(2))=di(1:N/2^(i+1));
    ind=ind+[N/2^(i+1),N/2^(i+2)];
end
out(N)=c;
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
