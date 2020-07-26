
c=zeros(2^6,1);
for i=1:2^5
    c(i) = 0;
end

for i=2^5+1:2^6
    c(i) = 1;
end


n=length(c);
d=dht(c);
x=dct(c);
subplot(5,1,1)
stem(1:n,c,'filled','MarkerSize',3,'LineStyle','--','Color','[0 0 0]')
xlabel('signal');
subplot(5,1,2)
stem(1:n,d,'filled','MarkerSize',3,'LineStyle','--','Color','[0 0 0]')
xlabel('DHT');
subplot(5,1,3)
stem(1:n,x,'filled','MarkerSize',3,'LineStyle','--','Color','[0 0 0]')
xlabel('DCT');
subplot(5,1,4)
stem(1:n,idht(fil(d)),'filled','MarkerSize',3,'LineStyle','--','Color','[0 0 0]')
xlabel('IDHT');
subplot(5,1,5)
stem(1:n,idct(fil(x)),'filled','MarkerSize',3,'LineStyle','--','Color','[0 0 0]')
xlabel('IDCT');

function out = dht(c)
tic;
n=length(c);N=2^(ceil(log(n)/log(2)));
c=padarray(c,N-n,0);
out=zeros(N,1);
ind=[1,N/2];
for i=0:log(N)/log(2)-2
    w=W(N/2^(i));
    wi=w*c;
    ci=wi(1:N/2^(i+1));di=wi(N/2^(i+1)+1:N/2^(i));
    c=ci;
    out(ind(1):ind(2))=di(1:N/2^(i+1));
    ind=ind+[N/2^(i+1),N/2^(i+2)];
end
out(N-1:N)=c;
toc
end

function out=idht(d)
n=length(d);N=2^(ceil(log(n)/log(2)));
d=padarray(d,N-n,0);
ind=[N-3,N-2];
c=d(N-1:N);
for i=0:log(N)/log(2)-2
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

function y = fil(x)
n = length(x);
y=x;ctr=n;
for i=1:n
    if abs(x(i))<0.15
        y(i)=0;
        ctr=ctr-1;
    end
end
ctr
end
