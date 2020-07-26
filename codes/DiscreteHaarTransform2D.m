
grl=imread('girl.png');grl=rgb2gray(grl);

mat  = pad(double(grl));
ImgO = uint8(mat);
imgh = dht2(mat);imgc = dct(mat);
ImgH = uint8(imgh);
ImgC = uint8(imgc);
imgHc=compress(imgh,15);imgCc=compress(imgc,37);
ImgCH=uint8(idht2(imgHc));
ImgCC=uint8(idct(imgCc));

imshow([ImgO ImgCH ImgCC]);




function C=pad(c)
[n,m]=size(c);
N=ceil(log(max(m,n))/log(2));N=2^N;
C=padarray(c,[N-n,N-m],0,'post');
end

function out=compress(M,m)
[I,J]=size(M);ctr=0;out=M;
for i=1:I
    for j=1:J
        if(abs(M(i,j))<m)
            out(i,j)=0;
            ctr=ctr+1;
        end
    end
end
(ctr)/(I*J)
end

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
    
    s1=[s,s-1+N/2^i,s,s-1+N/2^i];
    s2=[s,s-1+N/2^i,s+N/2^i,N];
    s3=[s+N/2^i,N,s,s-1+N/2^i];
    
    out(s1(1):s1(2),s1(3):s1(4))=d1j;
    out(s2(1):s2(2),s2(3):s2(4))=d2j;
    out(s3(1):s3(2),s3(3):s3(4))=d3j;
    c=cj;
    s=s+N/2^i;
end
out(N,N)=c;
end

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

function out= Hrow(c)
[M,L]=size(c);
out=zeros(M,round(L/2));
for i=1:M
    out(i,:)=(H(L)*c(i,:)')';
end
end

function out= Grow(c)
[M,L]=size(c);
out=zeros(M,round(L/2));
for i=1:M
   out(i,:)=(G(L)*c(i,:)')';
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


function out=HrowT(c)
[M,l]=size(c);L=2*l;out=zeros(M,L);
for i=1:M
    out(i,:)=(H(L)'*c(i,:)')';
end
end

function out=GrowT(c)
[M,l]=size(c);L=2*l;out=zeros(M,L);
for i=1:M
    out(i,:)=(G(L)'*c(i,:)')';
end
end

function out=HcolT(c)
[l,M]=size(c);L=2*l;out=zeros(L,M);
for i=1:M
    out(:,i)=H(L)'*c(:,i);
end
end

function out=GcolT(c)
[l,M]=size(c);L=2*l;out=zeros(L,M);
for i=1:M
    out(:,i)=G(L)'*c(:,i);
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
