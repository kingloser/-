clear all;
wp1=0.35*pi;
wp2=0.45*pi;
ws1=0.3*pi;
ws2=0.5*pi;
As=40;
figure(1)
tr_width=min((wp1-ws1),(ws2-wp2)); 					%���ɴ���� 
 M=ceil(11*pi/tr_width)+1							%�˲�������
% ap=1;
% as=140;
% dp=1-10^(-ap/20);
% ds=10^(-as/20);
% 
% Numerator=-20*log10(sqrt(dp*ds))-13;
% Denominator =14.6*150/2/pi;
% N=ceil(Numerator/Denominator ); %kaiser����������h��n������N0��ceilȡ���ڵ���
% 
% 
n=[0:1:M-1];
wc1=(ws1+wp1)/2;									%�����ͨ�˲������½�ֹƵ��
wc2=(ws2+wp2)/2;									%�����ͨ�˲������Ͻ�ֹƵ��
hd=ideal_lp(wc2,M)-ideal_lp(wc1,M);
w_bla=(hamming(M))';	    %������
[x,wn,bta,ftype]=kaiserord([0.3,0.35,0.45,0.5],[0 1 0],[0.01 0.1087 0.01]);

w_b=(hamming(x+1));
% hn = fir1(M, [0.325,0.475], 'bandpass', w_b,'scale');
 hn = fir1(x, [0.325,0.475], 'bandpass', w_b,'scale');
h=hd.*w_bla;  						%�˲���
[db,mag,pha,grd,w]=freqz_m(h,[1]);
%����ʵ���˲����ķ�����Ӧ
delta_w=2*pi/1000;
Rp=-min(db(wp1/delta_w+1:1:wp2/delta_w))
%ʵ��ͨ���Ʋ�
As=-round(max(db(ws2/delta_w+1:1:501)))
As=150

figure(14)
%subplot(2,2,2);
stem(n,w_bla);
title('������w(n)')
subplot(2,2,1);
stem(n,hd);
title('���뵥λ������Ӧhd(n)')
axis([0 M-1 -0.4 0.5]);
xlabel('n');
ylabel('hd(n)')
grid on;
figure(14)
%subplot(2,2,2);
stem(n,w_bla);
title('������w(n)')


axis([0 M-1 0 1.1]);
xlabel('n');
ylabel('w(n)')
grid on;
subplot(2,2,3);
stem(n,h);
title('ʵ�ʵ�λ������Ӧhd(n)')
axis([0 M-1 -0.4 0.5]);
xlabel('n');
ylabel('h(n)')
grid on;
subplot(2,2,4);
plot(w/pi,db);
axis([0 1 -150 10]);
title('������Ӧ(dB)');
grid on;
xlabel('Ƶ�ʵ�λ:pi');
ylabel('�ֱ���')

b=dfilt.df2(hn,1);
zplane(b)
title('�㼫��ͼ')					%��ע����


%�����ź�Ƶ�ף����Ƶ��ͼ
fs=2000;N=300;%���ó�������Ϊ1024��
n=0:(N-1);
t=n/fs;
 f1=400,f2=550;
 x1=sin(2*pi*f1*t); 
x2=sin(2*pi*f2*t);
x=x1+x2;
y=filter(hn,1,x);
Y1=fft(x,N);
Y2=fft(y,N)
mag1=abs(Y1);mag2=abs(Y2);
figure(8);
plot(y);
f=n*fs/N;
figure(10);
%figure(5)
%subplot(2,1,1);
plot(f(1:N/2),mag1(1:N/2));
title('�����źŵ�Ƶ��ͼ');
xlabel('Ƶ��/HZ');ylabel('���');
grid on;
figure(11);
%subplot(2,1,2);
plot(f(1:N/2),mag2(1:N/2)); 
title('����źŵ�Ƶ��ͼ');
xlabel('Ƶ��/HZ');ylabel('���');
grid on;


