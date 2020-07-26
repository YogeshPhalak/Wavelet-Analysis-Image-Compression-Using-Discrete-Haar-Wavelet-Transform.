 x = -1:0.001:1.5;
 r = randi(5,1,500)-randi(5,1,500);

plot(x,P(1,0,x),'LineWidth',1.5,'color','black');
axis equal;
grid on;
%plot(x,P(5,x,r),'LineWidth',1.5,'color','blue');


% subplot(4,1,1)
% plot(x,f(x),'LineWidth',1.5,'color','black');
% subplot(4,1,2)
% plot(x,approx_P(5,f(x),x),'LineWidth',1.5,'color','black');
% subplot(4,1,3)
% plot(x,detail_Q(5,f(x),x),'LineWidth',1.5,'color','black');
% subplot(4,1,4)
% plot(x,approx_F(5,f(x),x),'LineWidth',1.5,'color','black');
% % norm(approx_P(5,f(x),x)-f(x),inf);



function out = f(x)
n=length(x);out=zeros(1,n);
for i=1:n
if x(i)>0 && x(i)<1
    out(i) = x(i)^2;
elseif x(i)>=1 && x(i)<2
    out(i) = (2-x(i))^2;
else
    out(i) = 0;
end
end
end


function out = X(l,h,x)
n = length(x);
out = zeros(1,n);
for i= 1:n
if (x(i) >= l) && (x(i) < h)
    out(i) = 1;
    
else
    out(i) = 0;
    
end
end
end


function out = X_I(J,K,x)

n = length(x);
out = zeros(1,n);
for i= 1:n
if (x(i) >= 2^(-1*J)*K) && (x(i) < 2^(-1*J)*(K+1))
    out(i) = 1;
    
else
    out(i) = 0;
    
end
end
end

function out = P(j,k,x)
out = 2^(j/2)*X_I(j,k,x);
end

function out = H(j,k,x)
out = 2^(j/2)*(X_I(j+1,2*k,x)-X_I(j+1,2*k+1,x));
end

function out = g(j,x,r)
n=2^(j);
m = length(x);
out=zeros(1,m);
out1=zeros(1,m);

for k=1:m
for i=0:n-1
    if (x(k)>=i*2^-j) && (x(k)<(i+1)*2^-j)
        out(k) = r(i+1);
        break;
    else
        out(k) = 0;
    end
        
end
end

for k=1:m
for i=0:2:n-1
    if (x(k)>=i*2^(-j)) && (x(k)<(i+2)*2^(-j))
        out1(k) = (r(i+1)+r(i+2))/2;
        break;
    else
        out1(k) = 0;
    end
        
end
end

% subplot(1,2,1);
% hold on;
% plot(x,out,'LineWidth',1.5,'color','black');
% plot(x,out1,'--','LineWidth',1,'color','blue');
% grid on;
% hold off;
% 
% subplot(1,2,2);
% hold on;
% plot(x,out-out1,'LineWidth',1.5,'color','black');
% grid on;
% hold off;


end

function out = inpro(f,g,x)
n=length(x);dx=abs(x(2)-x(1));
out = 0;
for i=1:n
        out=out+f(i)*g(i)*dx;
end
end

function sum = approx_P(j,f,x)
n=length(x);
sum=zeros(1,n);K=2^(j+1)-1;
for k=0:K
sum = sum + inpro(f,P(j,k,x),x)*P(j,k,x);
end
end

function sum = detail_Q(j,f,x)
n=length(x);
sum = approx_P(j+1,f,x)-approx_P(j,f,x);
end

function sum = approx_F(J,f,x)
n=length(x);
sum=zeros(1,n);K=2^(J+1)-1;
for k=0:K
sum = sum + inpro(f,P(J,k,x),x)*P(J,k,x);
end
for j=J:10
    K=2^(j+1)-1;
  for k=0:K
      sum = sum + inpro(f,H(j,k,x),x)*H(j,k,x);
  end
end
end
