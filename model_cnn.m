% clear all


%%%%%%%%%%%%初始化配置%%%%%%%%%%%%%
% layer1
input_channel1_num=3;%第一层输入的通道数
kernel_num1=128;%第一层卷积核数量
kernel_size1=3;%第一层卷积核尺寸
stride1=1;%第一层卷积步长
kernel_matrix1=zeros(kernel_num1,kernel_size1^2,input_channel1_num);
weight_size1=kernel_size1^2*kernel_num1;%每个channel 的weight size
layer1_weight=load('E:\matlab\VPS\model\CNN\9.3data[0-1]\weight\module.conv1.wrapped_module.weight.csv');
for i=1:input_channel1_num
    for j=1:kernel_num1
        kernel_matrix1(j,:,i)=layer1_weight(1+(j-1)*(kernel_size1^2)*input_channel1_num+(i-1)*(kernel_size1^2):kernel_size1^2+(j-1)*(kernel_size1^2)*input_channel1_num+(i-1)*(kernel_size1^2));
    end
end
b1=zeros(kernel_num1,1);
b1=load('E:\matlab\VPS\model\CNN\9.3data[0-1]\weight\module.conv1.base_b_q.csv');
% layer2
input_channel2_num=128;%第二层输入的通道数
kernel_num2=128;%第二层卷积核矩阵
kernel_size2=3;%第二层卷积核尺寸
stride2=1;%第二层卷积步长
kernel_matrix2=zeros(kernel_num2,kernel_size2^2,input_channel2_num);
weight_size2=kernel_size2^2*kernel_num2;%每个channel 的weight size
layer2_weight=load('E:\matlab\VPS\model\CNN\9.3data[0-1]\weight\module.conv2.wrapped_module.weight.csv');
for i=1:input_channel2_num
    for j=1:kernel_num2
        kernel_matrix2(j,:,i)=layer2_weight(1+(j-1)*(kernel_size2^2)*input_channel2_num+(i-1)*(kernel_size2^2):kernel_size2^2+(j-1)*(kernel_size2^2)*input_channel2_num+(i-1)*(kernel_size2^2));
    end
end
b2=zeros(kernel_num2,1);
b2=load('E:\matlab\VPS\model\CNN\9.3data[0-1]\weight\module.conv2.base_b_q.csv');
% layer3
input_channel3_num=128;%第三层输入的通道数
kernel_num3=256;%第三层卷积核矩阵
kernel_size3=3;%第三层卷积核尺寸
stride3=1;%第三层卷积步长
kernel_matrix3=zeros(kernel_num3,kernel_size3^2,input_channel3_num);
weight_size3=kernel_size3^2*kernel_num3;%每个channel 的weight size
layer3_weight=load('E:\matlab\VPS\model\CNN\9.3data[0-1]\weight\module.conv3.wrapped_module.weight.csv');
for i=1:input_channel3_num
    for j=1:kernel_num3
        kernel_matrix3(j,:,i)=layer3_weight(1+(j-1)*(kernel_size3^2)*input_channel3_num+(i-1)*(kernel_size3^2):kernel_size3^2+(j-1)*(kernel_size3^2)*input_channel3_num+(i-1)*(kernel_size3^2));
    end
end
b3=zeros(kernel_num3,1);
b3=load('E:\matlab\VPS\model\CNN\9.3data[0-1]\weight\module.conv3.base_b_q.csv');
% layer4
input_channel4_num=256;%第四层输入的通道数
kernel_num4=256;%第四层卷积核矩阵
kernel_size4=3;%第四层卷积核尺寸
stride4=1;%第四层卷积步长
kernel_matrix4=zeros(kernel_num4,kernel_size4^2,input_channel4_num);
weight_size4=kernel_size4^2*kernel_num4;%每个channel 的weight size
layer4_weight=load('E:\matlab\VPS\model\CNN\9.3data[0-1]\weight\module.conv4.wrapped_module.weight.csv');
for i=1:input_channel4_num
    for j=1:kernel_num4
        kernel_matrix4(j,:,i)=layer4_weight(1+(j-1)*(kernel_size4^2)*input_channel4_num+(i-1)*(kernel_size4^2):kernel_size4^2+(j-1)*(kernel_size4^2)*input_channel4_num+(i-1)*(kernel_size4^2));
    end
end
b4=zeros(kernel_num4,1);
b4=load('E:\matlab\VPS\model\CNN\9.3data[0-1]\weight\module.conv4.base_b_q.csv');
% layer5
input_channel5_num=256;%第五层输入的通道数
kernel_num5=512;%第五层卷积核矩阵
kernel_size5=3;%第五层卷积核尺寸
stride5=1;%第五层卷积步长
kernel_matrix5=zeros(kernel_num5,kernel_size5^2,input_channel5_num);
weight_size5=kernel_size5^2*kernel_num5;%每个channel 的weight size
layer5_weight=load('E:\matlab\VPS\model\CNN\9.3data[0-1]\weight\module.conv5.wrapped_module.weight.csv');
for i=1:input_channel5_num
    for j=1:kernel_num5
        kernel_matrix5(j,:,i)=layer5_weight(1+(j-1)*(kernel_size5^2)*input_channel5_num+(i-1)*(kernel_size5^2):kernel_size1^2+(j-1)*(kernel_size5^2)*input_channel5_num+(i-1)*(kernel_size5^2));
    end
end
b5=zeros(kernel_num5,1);
b5=load('E:\matlab\VPS\model\CNN\9.3data[0-1]\weight\module.conv5.base_b_q.csv');
% layer6
input_channel6_num=512;%第六层输入的通道数
kernel_num6=512;%第六层卷积核矩阵
kernel_size6=3;%第六层卷积核尺寸
stride6=1;%第六层卷积步长
kernel_matrix6=zeros(kernel_num6,kernel_size6^2,input_channel6_num);
weight_size6=kernel_size6^2*kernel_num6;%每个channel 的weight size
layer6_weight=load('E:\matlab\VPS\model\CNN\9.3data[0-1]\weight\module.conv6.wrapped_module.weight.csv');
for i=1:input_channel6_num
    for j=1:kernel_num6
        kernel_matrix6(j,:,i)=layer6_weight(1+(j-1)*(kernel_size6^2)*input_channel6_num+(i-1)*(kernel_size6^2):kernel_size1^2+(j-1)*(kernel_size6^2)*input_channel6_num+(i-1)*(kernel_size6^2));
    end
end
b6=zeros(kernel_num6,1);
b6=load('E:\matlab\VPS\model\CNN\9.3data[0-1]\weight\module.conv6.base_b_q.csv');
%FC1
FC1_channel_num=1024;
FC1_vector_size=2048;
kernel_matrix_fc1=zeros(FC1_channel_num,FC1_vector_size,1);
fc1_weight=load('E:\matlab\VPS\model\CNN\9.3data[0-1]\weight\module.fc1.wrapped_module.weight.csv');
for i=1:FC1_channel_num
        kernel_matrix_fc1(i,:,1)=fc1_weight((i-1)*FC1_vector_size+1:i*FC1_vector_size);
end
b_fc1=load('E:\matlab\VPS\model\CNN\9.3data[0-1]\weight\module.fc1.base_b_q.csv');
%FC2
FC2_channel_num=10;
FC2_vector_size=1024;
kernel_matrix_fc2=zeros(FC2_channel_num,FC2_vector_size,1);
fc2_weight=load('E:\matlab\VPS\model\CNN\9.3data[0-1]\weight\module.fc2.wrapped_module.weight.csv');
for i=1:FC2_channel_num
        kernel_matrix_fc2(i,:,1)=fc2_weight((i-1)*FC2_vector_size+1:i*FC2_vector_size);
end
b_fc2=load('E:\matlab\VPS\model\CNN\9.3data[0-1]\weight\module.fc2.base_b_q.csv');



test_lib=load('E:\matlab\VPS\model\CNN\par_new\activation\test_act0.csv');
[size_lib,ans]=size(test_lib);
fmap_num=size_lib/3072;
for i_top=183:fmap_num
    
    
input_fmap=zeros(32,32,3);
input=test_lib( (i_top-1)*3072+1 : i_top*3072 ,1);
for i=1:3072
    input_fmap(i)=round(input(i)*60);%%第一层系数，60
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%计算部分%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%第一层卷积，卷积完relu
%%%%%先拓展
conv1_input=zeros(34,34,input_channel1_num);
for i1=1:input_channel1_num
    conv1_input(2:33,2:33,i1) = input_fmap(:,:,i1);
end

con_result1 = conv_vps(conv1_input,kernel_matrix1,kernel_num1,kernel_size1,stride1,64);
[a,b,c]=size(con_result1);
for i1=1:c
	con_result1_bias(:,:,i1) = con_result1(:,:,i1)/(60*52.276) +b1(i1)/73.513;
end

relu_thr1=zeros(a,b,c);
con_result_relu1=max(relu_thr1,con_result1_bias);
layer1_result=con_result_relu1 ;

%%%%%%%%%%%%%%%%%%%%第二层卷积，卷积完relu+池化

conv2_input=zeros(34,34,kernel_num1);
for i1=1:kernel_num1
    conv2_input(2:33,2:33,i1) = round(layer1_result(:,:,i1)*20);%%第二层系数，20
end
con_result2 = conv_vps(conv2_input,kernel_matrix2,kernel_num2,kernel_size2,stride2,128);
[a,b,c]=size(con_result2);
for i1=1:c
	con_result2_bias(:,:,i1) = con_result2(:,:,i1)/(20*110.602)+b2(i1)/110.884;
end
relu_thr2=zeros(a,b,c);
con_result_relu2=max(relu_thr2,con_result2_bias);
conv2_pooling_input=con_result_relu2;
parfor i1=1:c
	layer2_result(:,:,i1) = pooling( conv2_pooling_input(:,:,i1),2,2);%池化
end
	
%%%%%%%%%%%%%%%%%%%%第三层卷积，卷积完relu
conv3_input=zeros(18,18,kernel_num2);
for i1=1:kernel_num2
    conv3_input(2:17,2:17,i1) = round(layer2_result(:,:,i1)*10);%%第3层系数，10
end
con_result3 = conv_vps(conv3_input,kernel_matrix3,kernel_num3,kernel_size3,stride3,128);
[a,b,c]=size(con_result3);
for i1=1:c
	con_result3_bias(:,:,i1) = con_result3(:,:,i1)/(10*207.938)+b3(i1)/114.434;
end
relu_thr3=zeros(a,b,c);
con_result_relu3=max(relu_thr3,con_result3_bias);
layer3_result=con_result_relu3 ;
%%%%%%%%%%%%%%%%%%%%第四层卷积，卷积完relu+池化
%%%%%先拓展
conv4_input=zeros(18,18,kernel_num3);
for i1=1:kernel_num3
    conv4_input(2:17,2:17,i1) = round(layer3_result(:,:,i1)*10);%%第4层系数，10
end
%%%%%拓展结束
con_result4 = conv_vps(conv4_input,kernel_matrix4,kernel_num4,kernel_size4,stride4,128);
[a,b,c]=size(con_result4);
for i1=1:c
	con_result4_bias(:,:,i1) = con_result4(:,:,i1)/(10*277.111)+b4(i1)/88.630;
end
relu_thr4=zeros(a,b,c);
con_result_relu4=max(relu_thr4,con_result4_bias);
conv4_pooling_input=con_result_relu4;
parfor i1=1:c
	layer4_result(:,:,i1) = pooling( conv4_pooling_input(:,:,i1),2,2);%池化
end
%%%%%%%%%%%%%%%%%%%第五层卷积，卷积完relu
%%%%%先拓展
conv5_input=zeros(10,10,kernel_num4);
for i1=1:kernel_num4
    conv5_input(2:9,2:9,i1) = round(layer4_result(:,:,i1)*5);%%第5层系数，5
end
%%%%%拓展结束
con_result5 = conv_vps(conv5_input,kernel_matrix5,kernel_num5,kernel_size5,stride5,128);
[a,b,c]=size(con_result5);
for i1=1:c
	con_result5_bias(:,:,i1) = con_result5(:,:,i1)/(5*294.567)+b5(i1)/199.575;
end
relu_thr5=zeros(a,b,c);
con_result_relu5=max(relu_thr5,con_result5_bias);
layer5_result=con_result_relu5 ;

%%%%%%%%%%%%%%%%%%%%第六层卷积，卷积完relu+池化
%%%%%先拓展
conv6_input=zeros(10,10,kernel_num5);
for i1=1:kernel_num5
    conv6_input(2:9,2:9,i1) = round(layer5_result(:,:,i1)*4);%%第6层系数，4
end
%%%%%拓展结束
con_result6 = conv_vps(conv6_input,kernel_matrix6,kernel_num6,kernel_size6,stride6,128);
[a,b,c]=size(con_result6);
for i1=1:c
	con_result6_bias(:,:,i1) = con_result6(:,:,i1)/(4*353.579)+b6(i1)/197.252;
end
relu_thr6=zeros(a,b,c);
con_result_relu6=max(relu_thr6,con_result6_bias);
%%%%%先拓展
conv6_pooling_input=con_result_relu6;
parfor i1=1:c
	layer6_pooling_result1(:,:,i1) = pooling( conv6_pooling_input(:,:,i1),2,2);%池化
end
parfor i1=1:c
	layer6_result(:,:,i1) = pooling( layer6_pooling_result1(:,:,i1),2,2);%池化
end
%%%%%%%%%%%%%%%%%%%%两层全连接层%%%%%%%%%%%%%%%%%%%%%%%
[a,b,c]=size(layer6_result);

for i1=1:a*b*c
    fc1_input(i1,:)=round(layer6_result(i1)*4);%%第7层系数，4
end
% fc1_result=(kernel_matrix_fc1*fc1_input)/(4*350.617)+b_fc1/573.452;
fc1_result=zeros(1024,1);
parfor i=1:8
fc1_result_tmp =vcore_ad(kernel_matrix_fc1(:,(i-1)*256+1:i*256),fc1_input((i-1)*256+1:i*256,:),128);
fc1_result=fc1_result+fc1_result_tmp;
end
fc1_result=fc1_result/(4*350.617)+b_fc1/573.452;
fc1_zero=zeros(1024,1);
fc1_result_relu=round(max(fc1_result,fc1_zero)*15);
% fc2_result=(kernel_matrix_fc2*fc1_result)/(15*247.463)+b_fc2/96.935;

fc2_result=zeros(10,1);
parfor i=1:4
fc2_result_tmp =vcore_ad(kernel_matrix_fc2(:,(i-1)*256+1:i*256),fc1_result_relu((i-1)*256+1:i*256,:),128);
fc2_result=fc2_result+fc2_result_tmp;
end
fc2_result=fc2_result/(15*247.463)+b_fc2/96.935;

final_result=fc2_result;
max_final_result=max(final_result);
for i=1:10
    if(final_result(i)==max_final_result)
        tmp_max=i;
    end
end
        
        
result_lib(i_top)=tmp_max-1;
end


fid= fopen('E:\matlab\VPS\model\CNN\9.3data[0-1]\result_vps.txt','w');
for i=1:fmap_num
		fprintf(fid,'%d \n',result_lib(i));
end