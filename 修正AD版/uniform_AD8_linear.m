clear all;
s0=xlsread('result8bits.xlsx',1,'B2:B258');
x0=xlsread('result8bits.xlsx',1,'A2:A258');

a=[1,17,3,4;10,20,30,40];
b=[150;120;180;190];
realresult=a*b;
result=vcore(a,b,s0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%function vcore����һ����������ģ��
%JZyΪȨֵ�������룬���뷶ΧΪ[-100,100]
%XLyΪ�����������룬���뷶ΧΪ[0,512]
%s0Ϊģ�����ݣ���Դ��ͬ�ļ����ڵ�excel��
%��������ֵΪ����˷���Ľ������



%%��ģ�Ͳ��������������ԣ�����ȫ�����ȣ����AD����Ϊ8λ


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [o]=vcore(JZy,XLy,s0)
%XLy=511.*rand(siz,1);
%JZy=255.*rand(siz)-127;%
%JZzhengy=128.*rand(siz);
JZ=fix(JZy);
XLquan=fix(XLy);
%JZzheng=fix(JZzhengy);

s=zeros(200,1);
for i=1:200
    s(i)=(s0(i)-s0(100))/((s0(1)-s0(200))/200);
end
global resultbit;
[m,n]=size(JZ);%%mΪ�ֺŷָnΪ���ŷָ�
resultbit=zeros(m,9);
result=zeros(m,1);
for i=1:m
for j=1:n
    resultbit(i,:)=(bit(XLquan(j),JZ(i,j),s))'+resultbit(i,:);%%����Ϊ�����룬G���룬��һ�����ݡ�����ΪȨֵ��Ϊ������X���ڶ�����������
%for p=1:9
%result(i)=result(i)-c(p)*zero*2^(p-1);
%end
%c=zeros(9,1);
end
end
%Max=(256*mean(XLquan))*siz;
Min=256*n/2^8;
%%%%%%%%%%
%8��ʾ8bitAD
%%%%%%%%%%
resultbit=fix(resultbit./(Min))*Min;
for i=1:m
    for j=1:9
        result(i)=resultbit(i,j)*2^(j-1)+result(i);
    end
end
%realresult=JZy*XLquany;
%o=mean(abs(realresult-result))/Max;
o=result;
end








function [o]=single(g,x,s)%%x(0,240),g(511,0)
%dVt=255*normrnd(0,0.1,1,1);
%w0=zeros(257,1);
%w=1:(-1/192):0;
%w0(1:193)=w;
%dNa=225*normrnd(0,0.01,1,1).*w0;
%for i=1:257
%sj(i)=s(i)+s(i)*(0.04+(257-i)*0.000234)*(2*rand(1,1)-1);
%sj=dVt+dNa+s;
%for i=1:257
%if(sj(i)<-95.7697)
%    sj(i)=-95.7697;
%end
%end

if(g==1)
    o=s(100-x);
else
    o=0;
end
end
function [o]=bit(g,x,s)
o=zeros(9,1);
two=zeros(9,1);
if(g>=256)
    two(9)=1;
    g=g-256;
end
    if(g>=128)
        two(8)=1;
        g=g-128;
    end
        if(g>=64)
            two(7)=1;
            g=g-64;
        end
            if(g>=32)
                two(6)=1;
                g=g-32;
            end
                if(g>=16)
                    two(5)=1;
                    g=g-16;
                end
if(g>=8)
    two(4)=1;
    g=g-8;
end
    if(g>=4)
        two(3)=1;
        g=g-4;
    end
    if(g>=2)
        two(2)=1;
        g=g-2;
    end
        if(g==1)
            two(1)=1;
        end
for i=1:9
o(i)=single(two(i),x,s);
end
end






