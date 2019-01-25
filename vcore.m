function [ o ] = vcore( JZy,XLy)
%UNTITLED 此处显示有关此函数的摘要
%function vcore即单一矩阵向量乘模型
%JZy为权值矩阵输入，输入范围为[-127,128]
%XLy为数据向量输入，输入范围为[0,512]
%s0为模型数据，来源于同文件夹内的excel表
%u为器件参数均匀性的标准差，0.1则表示单管输出曲线为原始曲线+单管量程*高斯（mean=0，std=0.1)
%ad为ADC精度，8表示8位AD
%函数返回值为做完乘法后的结果向量

% JZy=[1,2,3,4;10,20,30,40];
% XLy=[150;160;180;190];
% real_Result=JZy*XLy;
% s0=xlsread('result8bits.xlsx',1,'B2:B258');
s0=[6.78162554254391e-06;6.75317493961442e-06;6.72472433668493e-06;6.69627373375543e-06;6.66782313082594e-06;6.63937252789645e-06;6.61144243498146e-06;6.58387572823329e-06;6.55718671145482e-06;6.52805982791051e-06;6.50019706265182e-06;6.47134210324743e-06;6.44348557918522e-06;6.41446098222106e-06;6.38704814609225e-06;6.35889233824781e-06;6.33032999805364e-06;6.30269515202640e-06;6.27158179028927e-06;6.24284274814779e-06;6.21538102299781e-06;6.18805789274030e-06;6.15901967479736e-06;6.13001708729720e-06;6.10220723210557e-06;6.07156781766385e-06;6.04242045820874e-06;6.01462076212289e-06;5.98547776708487e-06;5.95574917993879e-06;5.92758147792720e-06;5.89965049964573e-06;5.86862419441647e-06;5.83916121509035e-06;5.81001925168305e-06;5.78229247144188e-06;5.75231715795953e-06;5.72313790695056e-06;5.69562397460149e-06;5.66516400462189e-06;5.63658612914886e-06;5.60759523468269e-06;5.57906430342271e-06;5.55018667179281e-06;5.51996815568254e-06;5.49067190122532e-06;5.46038174372071e-06;5.42996858168130e-06;5.39906893665733e-06;5.36997810290133e-06;5.34083105077157e-06;5.30907951454885e-06;5.27934589160161e-06;5.24858535608108e-06;5.21758133117157e-06;5.18664909279964e-06;5.15606840717231e-06;5.12422748684006e-06;5.09323822881160e-06;5.06286176829431e-06;5.03284786279885e-06;5.00147623127545e-06;4.97267965301902e-06;4.94139351359655e-06;4.91319449824341e-06;4.88203901616107e-06;4.84976685201646e-06;4.81854154390987e-06;4.78630392663275e-06;4.75400439174823e-06;4.72422302862934e-06;4.69272071188543e-06;4.66094728751543e-06;4.62771682105181e-06;4.59757653552711e-06;4.56816579465286e-06;4.53731526757584e-06;4.50633642230721e-06;4.47580917575817e-06;4.44509555244061e-06;4.41415909212483e-06;4.38118610575442e-06;4.35017206933845e-06;4.32083591897243e-06;4.28919437283134e-06;4.25800545476449e-06;4.22419917262827e-06;4.19470373107067e-06;4.16065789036211e-06;4.12890091352597e-06;4.10043478260034e-06;4.06987296326997e-06;4.03968592902097e-06;4.00863186130499e-06;3.97578268115985e-06;3.94339724202701e-06;3.91177038501792e-06;3.88229327032972e-06;3.85032978705991e-06;3.82000276409456e-06;3.78912088851875e-06;3.75489996586808e-06;3.72333151823970e-06;3.69046659216251e-06;3.66034733170134e-06;3.62933318105387e-06;3.59873158953647e-06;3.56599723900477e-06;3.53380406774103e-06;3.50200582160903e-06;3.46962124205742e-06;3.43847590798184e-06;3.40725477472724e-06;3.37712693135877e-06;3.34405247090326e-06;3.31261035315872e-06;3.28203660646556e-06;3.25254191634908e-06;3.22300420899683e-06;3.19117396292566e-06;3.15957160734538e-06;3.12800408468592e-06;3.09689504884249e-06;3.06709908633915e-06;3.03627336575223e-06;3.00739998162549e-06;2.97752673146994e-06;2.94522129747065e-06;2.91340791565020e-06;2.88233392391616e-06;2.85072211384773e-06;2.81728223112362e-06;2.78488170536988e-06;2.75342513469332e-06;2.72076128937866e-06;2.68856475202038e-06;2.65752022420935e-06;2.62656937694832e-06;2.59518460441837e-06;2.56480331918317e-06;2.53501182026737e-06;2.50448946368378e-06;2.47313302464745e-06;2.44155310382527e-06;2.41177139263286e-06;2.38156773426717e-06;2.35107247551280e-06;2.31914122439125e-06;2.28913177344153e-06;2.26097338082868e-06;2.22770212288630e-06;2.19973288783759e-06;2.17052175359461e-06;2.14274155438248e-06;2.11284514135011e-06;2.08167670366070e-06;2.05297809152916e-06;2.02027877714038e-06;1.99082790181700e-06;1.95987845495430e-06;1.93229018252876e-06;1.90269678326167e-06;1.87081701641091e-06;1.84028297566071e-06;1.80886134233882e-06;1.77897511597196e-06;1.75063567904813e-06;1.72072252502352e-06;1.69068001384042e-06;1.66054685238079e-06;1.63006832731749e-06;1.60249389504119e-06;1.57278877924068e-06;1.54254958307424e-06;1.51452123990555e-06;1.48449926973402e-06;1.45423137391004e-06;1.42618784333340e-06;1.39796666014132e-06;1.37040799480807e-06;1.34188308427079e-06;1.31352436064909e-06;1.28655017728036e-06;1.25615028786217e-06;1.22836845181422e-06;1.20035308862409e-06;1.17555611157200e-06;1.14806482675455e-06;1.12158183213556e-06;1.09559725081495e-06;1.06969358927550e-06;1.04308466444265e-06;1.01627371766242e-06;9.90963330582978e-07;9.65954746257005e-07;9.39664006380422e-07;9.14128437491064e-07;8.88294070193721e-07;8.62071945848905e-07;8.37097961845914e-07;8.10881341252145e-07;7.86896946588318e-07;7.61948315879557e-07;7.36807117344016e-07;7.12661214933020e-07;6.88920316260185e-07;6.65180306145606e-07;6.42218839979722e-07;6.18908258719251e-07;5.95877119109802e-07;5.73030884250514e-07;5.50864859837855e-07;5.30333318775161e-07;5.08407883797457e-07;4.87523679114530e-07;4.66141699751364e-07;4.44965298683584e-07;4.24848793095335e-07;4.06265444572073e-07;3.86522834382761e-07;3.67465165742702e-07;3.48724888278104e-07;3.31104347200179e-07;3.14357584119803e-07;2.96661512997304e-07;2.80644839702331e-07;2.65028583723410e-07;2.49521211740931e-07;2.34463149728614e-07;2.20526147157834e-07;2.05648674848582e-07;1.92105707701498e-07;1.79060635031304e-07;1.65951436681259e-07;1.54548166180298e-07;1.43052107516473e-07;1.32513238203362e-07;1.22703673575465e-07;1.12740262110617e-07;1.03835408510486e-07;9.54431514318297e-08;8.77012852924067e-08;8.03622277002350e-08;7.31880199902520e-08;6.71400838289391e-08;6.08634303818244e-08;5.52608490377974e-08;5.00968265914809e-08;4.56272949899040e-08;4.14021676174458e-08;3.75644147066732e-08;3.38862120474024e-08;3.03970692116599e-08;2.72858621778039e-08;2.40029310737372e-08;2.15270077482176e-08;1.92038783944257e-08];
JZ=round(JZy);
XLquan=fix(XLy);

%JZzheng=fix(JZzhengy);

s=zeros(257,1);
%GPU
gs0=s0;
gJZ=JZ;
gXLquan=XLquan;
gs=s;
for i=1:257
    gs(i)=(gs0(i)-gs0(129))/((gs0(1)-gs0(129))/128);
end
global result;
[m,n]=size(gJZ);%%m为分号分割，n为逗号分割
result=zeros(m,1);
gresult=result;
for i=1:m
for j=1:n
    gresult(i)=bit(gXLquan(j),gJZ(i,j),gs)+gresult(i);%%向量为电输入，G输入，第一个数据。矩阵为权值，为光输入X，第二个输入数据
%for p=1:9
%result(i)=result(i)-c(p)*zero*2^(p-1);
%end
%c=zeros(9,1);
end
end
%Max=(256*mean(XLquan))*siz;
Min=256*127*n/2^7;
gresult=fix(gresult./(Min))*Min;
%realresult=JZy*XLquany;
%o=mean(abs(realresult-result))/Max;
o=gresult;
end








function [o]=single(g,x,s)%%x(0,240),g(511,0)

if(g==1)
    o=s(129-x);
else
    o=0;
end
end
function [o]=bit(g,x,s)
o=0;
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
o=single(two(i),x,s)*2^(i-1)+o;
end
end


