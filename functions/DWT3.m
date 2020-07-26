function out=DWT3(M,wname)
[m,n,l]=size(M);
out=zeros(m,n,l);
for i=1:l
    out(:,:,i)= DWT2(M(:,:,i),wname);
end
end
