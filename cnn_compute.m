%%%%%%%%%%%%%%%%%%%%%%%%%%%%计算部分%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%第一层卷积，卷积完relu
con_result1 = conv_vps(input_fmap,kernel_matrix1,kernel_num1,kernel_size1,stride1);
[a,b,c]=size(con_result1);
parfor i1=1:c
	con_result1_bias(:,:,i1) = con_result1(:,:,i1)+b1(i1);
end
relu_thr1=zeros(a,b,c);
con_result_relu1=max(relu_thr1,con_result1_bias);
layer1_result=con_result_relu1;

%%%%%%%%%%%%%%%%%%%%第二层卷积，卷积完relu+池化
%%%%%先拓展
conv2_input=zeros(32,32,kernel_num1);
for i1=1:kernel_num1
    conv2_input(2:31,2:31,i1) = layer1_result(:,:,i1);
end
%%%%%拓展结束
con_result2 = conv_vps(conv2_input,kernel_matrix2,kernel_num2,kernel_size2,stride2);
[a,b,c]=size(con_result2);
parfor i1=1:c
	con_result2_bias(:,:,i1) = con_result2(:,:,i1)+b2(i1);
end
relu_thr2=zeros(a,b,c);
con_result_relu2=max(relu_thr2,con_result2_bias);
%%%%%先拓展
conv2_pooling_input=zeros(32,32,kernel_num2);
for i1=1:kernel_num2
    conv2_pooling_input(2:31,2:31,i1) = con_result_relu2(:,:,i1);
end
%%%%%拓展结束
parfor i1=1:c
	layer2_result(:,:,i1) = pooling( conv2_pooling_input(:,:,i1),2,2);%池化
end
	
%%%%%%%%%%%%%%%%%%%%第三层卷积，卷积完relu
conv3_input=layer2_result;
con_result3 = conv_vps(conv3_input,kernel_matrix3,kernel_num3,kernel_size3,stride3);
[a,b,c]=size(con_result3);
parfor i1=1:c
	con_result3_bias(:,:,i1) = con_result3(:,:,i1)+b3(i1);
end
relu_thr3=zeros(a,b,c);
con_result_relu3=max(relu_thr3,con_result3_bias);
layer3_result=con_result_relu3;
%%%%%%%%%%%%%%%%%%%%第四层卷积，卷积完relu+池化
%%%%%先拓展
conv4_input=zeros(16,16,kernel_num3);
for i1=1:kernel_num3
    conv4_input(2:15,2:15,i1) = layer3_result(:,:,i1);
end
%%%%%拓展结束
con_result4 = conv_vps(conv4_input,kernel_matrix4,kernel_num4,kernel_size4,stride4);
[a,b,c]=size(con_result4);
parfor i1=1:c
	con_result4_bias(:,:,i1) = con_result4(:,:,i1)+b4(i1);
end
relu_thr4=zeros(a,b,c);
con_result_relu4=max(relu_thr4,con_result4_bias);
%%%%%先拓展
conv4_pooling_input=zeros(16,16,kernel_num4);
for i1=1:kernel_num4
    conv4_pooling_input(2:15,2:15,i1) = con_result_relu4(:,:,i1);
end
%%%%%拓展结束
parfor i1=1:c
	layer4_result(:,:,i1) = pooling( conv4_pooling_input(:,:,i1),2,2);%池化
end
%%%%%%%%%%%%%%%%%%%第五层卷积，卷积完relu
conv5_input=layer4_result;
con_result5 = conv_vps(conv5_input,kernel_matrix5,kernel_num5,kernel_size5,stride5);
[a,b,c]=size(con_result5);
parfor i1=1:c
	con_result5_bias(:,:,i1) = con_result5(:,:,i1)+b5(i1);
end
relu_thr5=zeros(a,b,c);
con_result_relu5=max(relu_thr5,con_result5_bias);
layer5_result=con_result_relu5;

%%%%%%%%%%%%%%%%%%%%第六层卷积，卷积完relu+池化
%%%%%先拓展
conv6_input=zeros(8,8,kernel_num5);
for i1=1:kernel_num5
    conv6_input(2:7,2:7,i1) = layer5_result(:,:,i1);
end
%%%%%拓展结束
con_result6 = conv_vps(conv6_input,kernel_matrix6,kernel_num6,kernel_size6,stride6);
[a,b,c]=size(con_result6);
parfor i1=1:c
	con_result6_bias(:,:,i1) = con_result6(:,:,i1)+b6(i1);
end
relu_thr6=zeros(a,b,c);
con_result_relu6=max(relu_thr6,con_result6_bias);
%%%%%先拓展
conv6_pooling_input=zeros(8,8,kernel_num6);
for i1=1:kernel_num6
    conv6_pooling_input(2:7,2:7,i1) = con_result_relu6(:,:,i1);
end
%%%%%拓展结束
parfor i1=1:c
	layer6_pooling_result1(:,:,i1) = pooling( conv6_pooling_input(:,:,i1),2,2);%池化
end
parfor i1=1:c
	layer6_result(:,:,i1) = pooling( layer6_pooling_result1(:,:,i1),2,2);%池化
end
%%%%%%%%%%%%%%%%%%%%两层全连接层%%%%%%%%%%%%%%%%%%%%%%%
[a,b,c]=size(layer6_result);
for i1=1:a*b*c
    fc1_input(i1,:)=layer6_result(i1);
end
fc1_result=kernel_matrix_fc1*fc1_input+b_fc1;
fc2_result=kernel_matrix_fc2*fc1_result+b_fc2;
final_result1=fc2_result;