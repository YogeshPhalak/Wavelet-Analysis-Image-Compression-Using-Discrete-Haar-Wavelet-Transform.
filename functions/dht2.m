function out=dht2(c)
[n,m]=size(c);
N=ceil(log(max(m,n))/log(2));N=2^N;
c=padarray(c,[N-n,N-m],0,'post');
out=zeros(N);

s=1;
for i=1:round(log(N)/log(2))
    cj  =Hcol(Hrow(c));
    d1j =Gcol(Hrow(c));
    d2j =Hcol(Grow(c));
    d3j =Gcol(Grow(c));
    c=cj;
    s1=[s,s-1+N/2^i,s,s-1+N/2^i];
    s2=[s,s-1+N/2^i,s+N/2^i,N];
    s3=[s+N/2^i,N,s,s-1+N/2^i];
    
    out(s1(1):s1(2),s1(3):s1(4))=d1j;
    out(s2(1):s2(2),s2(3):s2(4))=d2j;
    out(s3(1):s3(2),s3(3):s3(4))=d3j;
    s=s+N/2^i;
end
out(N,N)=c;
end


function out= Hrow(c)
[M,L]=size(c);
out=zeros(M,round(L/2));
for i=1:M
    out(i,:)=H(L)*c(i,:)';
end
end

function out= Grow(c)
[M,L]=size(c);
out=zeros(M,round(L/2));
for i=1:M
   out(i,:)=G(L)*c(i,:)';
end
end

function out= Hcol(c)
[L,M]=size(c);
out=zeros(round(L/2),M);
for i=1:M
    out(:,i)=H(L)*c(:,i);
end
end

function out= Gcol(c)
[L,M]=size(c);
out=zeros(round(L/2),M);
for i=1:M
    out(:,i)=G(L)*c(:,i);
end
end


function mat = G(L)
n = floor(L/2);
GL = zeros(n,L);

for i = 0:n-1
    GL(i+1,2*i+1)=1/2^0.5;GL(i+1,2*(i+1))=-1/2^0.5;
end
mat = GL;
end

function mat = H(L)
n = floor(L/2);
HL = zeros(n,L);
for i = 0:n-1
    HL(i+1,2*i+1)=1/2^0.5;HL(i+1,2*(i+1))=1/2^0.5;
end
mat = HL;
end
