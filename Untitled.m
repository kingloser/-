t=0:1/256:1;%��������
y= cos(2*pi*50*t)
N=length(t); %�������
plot(t,y);
fs=256;%����Ƶ��
df=fs/(N-1);%�ֱ���
f=(0:N-1)*df;%����ÿ���Ƶ��
Y=fft(y(1:N))/N*2;%��ʵ�ķ�ֵ
%Y=fftshift(Y);
figure(2)
plot(f(1:N/2),abs(Y(1:N/2)));