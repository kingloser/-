function hd=ideal_lp(wc,M);
%���������ͨ�˲�����������Ӧ
%[hd]=ideal_lp(wc,M)
%hd=����������Ӧ0��M-1
%wc=��ֹƵ��
% M=�����˲����ĳ���
alpha=(M-1)/2;
n=[0:1:(M-1)];
m=n-alpha+eps;
%����һ����С��ֵeps�������0�Ĵ����������
hd=sin(wc*m)./(pi*m);

end

