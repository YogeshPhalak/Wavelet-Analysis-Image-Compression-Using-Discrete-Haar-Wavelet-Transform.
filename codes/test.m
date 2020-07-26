a=pi;
%Scalling filter.
 h = [2^0.5/4+cos(a)/2,2^0.5/4+sin(a)/2,2^0.5/4-cos(a)/2,2^0.5/4-sin(a)/2];
% Wavelet filter. 

x=1:32;
c=sin(x/32*2*pi)+0.5*sin(2*x/32*2*pi)+0.25*sin(3*x/32*2*pi);

d=dwt(c',h);
c1=idwt(d,h);


subplot(3,1,1)
stem(x,c,'filled','color','[0 0 0]');
subplot(3,1,2)
stem(x,d,'filled','color','[0 0 0]');
subplot(3,1,3)
stem(x,c1,'filled','color','[0 0 0]');
