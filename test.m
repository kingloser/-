
fs=1000;%����Ƶ��Ϊ1000Hz
N=1024;
n=0:N-1;
t=n/fs;
f1=100;f2=120;
x=sin(2*pi*f1*t);
figure(1);
plot(t,x);title('origenal');
grid;
y=fft(x,N);%����Ҷ�任
mag=abs(y);
f=(0:length(y)-1)'*fs/length(y);
figure(2);
plot(f(1:N/2),mag(1:N/2));%����Ƶ��ͼ
title('with noise');
grid;
