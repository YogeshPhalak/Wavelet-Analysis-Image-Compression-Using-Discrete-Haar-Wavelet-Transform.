function out=idht2(d)
[n,m]=size(d);

N=ceil(log(max(m,n))/log(2));N=2^N;
d=padarray(d,[N-n,N-m],0,'post');
s=N-1;

c=d(N,N);

for i=round(log(N)/log(2)):-1:1
    
    s1=[s,s-1+N/2^i,s,s-1+N/2^i];
    s2=[s,s-1+N/2^i,s+N/2^i,N];
    s3=[s+N/2^i,N,s,s-1+N/2^i];
    
    d1j=d(s1(1):s1(2),s1(3):s1(4));
    d2j=d(s2(1):s2(2),s2(3):s2(4));
    d3j=d(s3(1):s3(2),s3(3):s3(4));
    s=s-N/2^(i-1);
    
    cj = HrowT(HcolT(c))+HrowT(GcolT(d1j))...
        +GrowT(HcolT(d2j))+GrowT(GcolT(d3j));
    c=cj;
end
out=c;
end

function out=HrowT(c) %Rowwise Approximation Operator. 
[M,l]=size(c);L=2*l;out=zeros(M,L);
for i=1:M
    out(i,:)=(H(L)'*c(i,:)')';
end
end

function out=GrowT(c) %Columnwise Detailed Operator.
[M,l]=size(c);L=2*l;out=zeros(M,L);
for i=1:M
    out(i,:)=(G(L)'*c(i,:)')';
end
end

function out=HcolT(c) %Columnwise Approximation Operator.
[l,M]=size(c);L=2*l;out=zeros(L,M);
for i=1:M
    out(:,i)=H(L)'*c(:,i);
end
end

function out=GcolT(c)% Columnwise Detailed Operator.
[l,M]=size(c);L=2*l;out=zeros(L,M);
for i=1:M
    out(:,i)=G(L)'*c(:,i);
end
end


function mat = G(L)  % Detailed Matrix
n = floor(L/2);
GL = zeros(n,L);

for i = 0:n-1
    GL(i+1,2*i+1)=1/2^0.5;GL(i+1,2*(i+1))=-1/2^0.5;
end
mat = GL;
end

function mat = H(L) % Approximation Matrix.
n = floor(L/2);
HL = zeros(n,L);
for i = 0:n-1
    HL(i+1,2*i+1)=1/2^0.5;HL(i+1,2*(i+1))=1/2^0.5;
end
mat = HL;
end
