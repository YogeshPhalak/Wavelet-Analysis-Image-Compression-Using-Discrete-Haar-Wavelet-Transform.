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
