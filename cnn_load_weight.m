%%%%%%%%%%%%初始化配置%%%%%%%%%%%%%
% layer1
input_channel1_num=3;%第一层输入的通道数
kernel_num1=128;%第一层卷积核数量
kernel_size1=3;%第一层卷积核尺寸
stride1=1;%第一层卷积步长
kernel_matrix1=zeros(kernel_num1,kernel_size1^2,input_channel1_num);
weight_size1=kernel_size1^2*kernel_num1;%每个channel 的weight size
layer1_weight=load('E:\matlab\VPS\model\CNN\data\features.module.0.wrapped_module.weight.csv');
for i=1:input_channel1_num
    for j=1:kernel_num1
        kernel_matrix1(j,:,i)=layer1_weight((j-1)*(kernel_size1^2)+(i-1)*weight_size1+1:j*(kernel_size1^2)+(i-1)*weight_size1);
    end
end
b1=zeros(kernel_num1,1);
b1=load('E:\matlab\VPS\model\CNN\data\features.module.0.base_b_q.csv');
% layer2
input_channel2_num=128;%第二层输入的通道数
kernel_num2=128;%第二层卷积核矩阵
kernel_size2=3;%第二层卷积核尺寸
stride2=1;%第二层卷积步长
kernel_matrix2=zeros(kernel_num2,kernel_size2^2,input_channel2_num);
weight_size2=kernel_size2^2*kernel_num2;%每个channel 的weight size
layer2_weight=load('E:\matlab\VPS\model\CNN\data\features.module.2.wrapped_module.weight.csv');
for i=1:input_channel2_num
    for j=1:kernel_num2
        kernel_matrix2(j,:,i)=layer2_weight((j-1)*(kernel_size2^2)+(i-1)*weight_size2+1:j*(kernel_size2^2)+(i-1)*weight_size2);
    end
end
b2=zeros(kernel_num2,1);
b2=load('E:\matlab\VPS\model\CNN\data\features.module.2.base_b_q.csv');
% layer3
input_channel3_num=128;%第三层输入的通道数
kernel_num3=256;%第三层卷积核矩阵
kernel_size3=3;%第三层卷积核尺寸
stride3=1;%第三层卷积步长
kernel_matrix3=zeros(kernel_num3,kernel_size3^2,input_channel3_num);
weight_size3=kernel_size3^2*kernel_num3;%每个channel 的weight size
layer3_weight=load('E:\matlab\VPS\model\CNN\data\features.module.5.wrapped_module.weight.csv');
for i=1:input_channel3_num
    for j=1:kernel_num3
        kernel_matrix3(j,:,i)=layer3_weight((j-1)*(kernel_size3^2)+(i-1)*weight_size3+1:j*(kernel_size3^2)+(i-1)*weight_size3);
    end
end
b3=zeros(kernel_num3,1);
b3=load('E:\matlab\VPS\model\CNN\data\features.module.5.base_b_q.csv');
% layer4
input_channel4_num=256;%第四层输入的通道数
kernel_num4=256;%第四层卷积核矩阵
kernel_size4=3;%第四层卷积核尺寸
stride4=1;%第四层卷积步长
kernel_matrix4=zeros(kernel_num4,kernel_size4^2,input_channel4_num);
weight_size4=kernel_size4^2*kernel_num4;%每个channel 的weight size
layer4_weight=load('E:\matlab\VPS\model\CNN\data\features.module.7.wrapped_module.weight.csv');
for i=1:input_channel4_num
    for j=1:kernel_num4
        kernel_matrix4(j,:,i)=layer4_weight((j-1)*(kernel_size4^2)+(i-1)*weight_size4+1:j*(kernel_size4^2)+(i-1)*weight_size4);
    end
end
b4=zeros(kernel_num4,1);
b4=load('E:\matlab\VPS\model\CNN\data\features.module.7.base_b_q.csv');
% layer5
input_channel5_num=256;%第五层输入的通道数
kernel_num5=512;%第五层卷积核矩阵
kernel_size5=3;%第五层卷积核尺寸
stride5=1;%第五层卷积步长
kernel_matrix5=zeros(kernel_num5,kernel_size5^2,input_channel5_num);
weight_size5=kernel_size5^2*kernel_num5;%每个channel 的weight size
layer5_weight=load('E:\matlab\VPS\model\CNN\data\features.module.10.wrapped_module.weight.csv');
for i=1:input_channel5_num
    for j=1:kernel_num5
        kernel_matrix5(j,:,i)=layer5_weight((j-1)*(kernel_size5^2)+(i-1)*weight_size5+1:j*(kernel_size5^2)+(i-1)*weight_size5);
    end
end
b5=zeros(kernel_num5,1);
b5=load('E:\matlab\VPS\model\CNN\data\features.module.10.base_b_q.csv');
% layer6
input_channel6_num=512;%第六层输入的通道数
kernel_num6=512;%第六层卷积核矩阵
kernel_size6=3;%第六层卷积核尺寸
stride6=1;%第六层卷积步长
kernel_matrix6=zeros(kernel_num6,kernel_size6^2,input_channel6_num);
weight_size6=kernel_size6^2*kernel_num6;%每个channel 的weight size
layer6_weight=load('E:\matlab\VPS\model\CNN\data\features.module.12.wrapped_module.weight.csv');
for i=1:input_channel6_num
    for j=1:kernel_num6
        kernel_matrix6(j,:,i)=layer6_weight((j-1)*(kernel_size6^2)+(i-1)*weight_size6+1:j*(kernel_size6^2)+(i-1)*weight_size6);
    end
end
b6=zeros(kernel_num6,1);
b6=load('E:\matlab\VPS\model\CNN\data\features.module.12.base_b_q.csv');
%FC1
FC1_channel_num=1024;
FC1_vector_size=2048;
kernel_matrix_fc1=zeros(FC1_channel_num,FC1_vector_size,1);
fc1_weight=load('E:\matlab\VPS\model\CNN\data\classifier.0.wrapped_module.weight.csv');
for i=1:FC1_channel_num
        kernel_matrix_fc1(i,:,1)=fc1_weight((i-1)*FC1_vector_size+1:i*FC1_vector_size);
end
b_fc1=load('E:\matlab\VPS\model\CNN\data\classifier.0.base_b_q.csv');
%FC2
FC2_channel_num=10;
FC2_vector_size=1024;
kernel_matrix_fc2=zeros(FC2_channel_num,FC2_vector_size,1);
fc2_weight=load('E:\matlab\VPS\model\CNN\data\classifier.2.wrapped_module.weight.csv');
for i=1:FC2_channel_num
        kernel_matrix_fc2(i,:,1)=fc2_weight((i-1)*FC2_vector_size+1:i*FC2_vector_size);
end
b_fc2=load('E:\matlab\VPS\model\CNN\data\classifier.2.base_b_q.csv');