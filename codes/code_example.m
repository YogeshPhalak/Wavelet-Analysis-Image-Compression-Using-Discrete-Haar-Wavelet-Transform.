wname = 'sym1';
close all;
clc;
img = imread('lion.png');img=imresize(img,0.5);M=double(img);
for i=10:-1:0
H=DWT3(M,wname);
H0 = compress(H,i);
imgH=uint8(H0);
imgc=uint8(IDWT3(H0,wname));
imshow(imgc)
%pause(0.1)
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function di=compress(im,j)
n=length(im);
di=zeros(n,n,3);
if(j<=log(n)/log(2))
    di(1:ceil(n*(1/2)^j),1:ceil(n*(1/2)^j),:)=im(1:ceil(n*(1/2)^j),1:ceil(n*(1/2)^j),:);

else
    di=zeros(n,n,3);
end

end

function df=filter(d,j)
n=length(d);
df=zeros(1,n)';
if(j<=log(n)/log(2))
    a=ceil(n*(1-(1/2)^j))+1;
    df(a:n)=d(a:n);
else
    df=zeros(1,n)';
end
end

function c = fun(x)
n=length(x);c=zeros(1,n);
for i=1:n
    if x(i)<n/2
        c(i)=sin(2*pi*x(i)/n)+1/3*sin(6*pi*x(i)/n);
    else
        c(i)=cos(2*pi*x(i)/n)+1/3*cos(6*pi*x(i)/n);
    end
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function d = DWT(c,wname)
d=[];
while(length(c)>1)
    [c1,d1]=dwt(c,wname,'mode','sym');
    d0=[d;d1];c=c1;d=d0;
end
d=[d;c];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55

function out=DWT3(M,wname)
[m,n,l]=size(M);
out=zeros(m,n,l);
for i=1:l
    out(:,:,i)= DWT2(M(:,:,i),wname);
end
end

function out=IDWT3(M,wname)
[m,n,l]=size(M);
N=ceil(log(max(m,n))/log(2));N=2^N;
c=M;
c=padarray(c,[N-m,N-n],0,'post');
out=zeros(N,N,l);
for i=1:l
    out(:,:,i)= IDWT2(c(:,:,i),wname);
end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5555\

