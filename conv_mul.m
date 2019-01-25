function [ o ] = conv_mul(fmap,kernel_matrix,kernel_num,kernel_size,stride,ad,max_row)
%%%%%%%%%%%%%%%%%%%%%%%%%%                for       test               %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear all
% 
% % 
% % 
% input_channel1_num=3;%��һ�������ͨ����
% kernel_num1=128;%��һ����������
% kernel_size1=3;%��һ�����˳ߴ�
% stride1=1;%��һ��������
% kernel_matrix1=zeros(kernel_num1,kernel_size1^2,input_channel1_num);
% weight_size1=kernel_size1^2*kernel_num1;%ÿ��channel ��weight size
% layer1_weight=load('E:\matlab\VPS\model\CNN\WYX\weight\module.conv1.weight.csv');
% for i=1:input_channel1_num
%     for j=1:kernel_num1
%         kernel_matrix1(j,:,i)=layer1_weight(1+(j-1)*(kernel_size1^2)*input_channel1_num+(i-1)*(kernel_size1^2):kernel_size1^2+(j-1)*(kernel_size1^2)*input_channel1_num+(i-1)*(kernel_size1^2));
%     end
% end
%  
% input_fmap=zeros(32,32,3);
% input=load('E:\matlab\VPS\model\CNN\WYX\one_iter\test_input.csv');
% for i=1:3072
%     input_fmap(i)=input(i);
% end
% 
% fmap=zeros(34,34,128);
% for i1=1:128
%     fmap(2:33,2:33,i1) = oCopy(:,:,i1);
% end
% 
% kernel_matrix=kernel_matrix2;
% kernel_num=128;
% kernel_size=3;
% stride=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%                for       test               %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   �˴���ʾ��ϸ˵��
%ʹ��Vcore m*v��ɾ��
%fmapΪ����feature map
%kernel_matrixΪ����kernel ��ɵľ���
%kernel_numΪ����kernel ����������kernel_matrix�Ŀ��
%kernel_sizeΪ����kernel �Ĵ�С������kernel_matrix�ĸ߶ȣ�
%strideΪ�������	
%fmap_sizeΪ����ͼ��ߴ�
[fmap_size,b,channel_num]=size(fmap);
o_size = (fmap_size-kernel_size)/stride+1;
vector_length = kernel_size^2;
o=zeros(o_size,o_size,kernel_num );
mid_o=zeros(o_size,o_size,kernel_num,channel_num);
vector=zeros(vector_length,1);
iter_num = o_size^2;%������
for m=1:channel_num
    fmap_tmp=fmap(:,:,m);
for i=1:iter_num
	if(mod(i,o_size)==0)%position
		col=floor(i/o_size);
		row=o_size;
	else 
		col=floor(i/o_size)+1;
		row=mod(i,o_size);
	end
	row_s=1+(row-1)*stride;%������ʼλ��
	col_s=1+(col-1)*stride;
	%����ʼλ�ÿ�ʼȡkernel_size*kernel_size�ֿ�
	for i1=1:vector_length% ѡ������
		if(mod(i1,kernel_size)==0)%position
			col_p=col_s+floor(i1/kernel_size)-1;
			row_p=row_s+kernel_size-1;
		else 
			col_p=col_s+floor(i1/kernel_size)+1-1;
			row_p=row_s+mod(i1,kernel_size)-1;
		end
		vector(i1,:,i)= fmap_tmp(row_p,col_p);
    end
end
parfor i1=1:iter_num
%     result(:,1,i1) =vcore_ad_v2(kernel_matrix(:,:,m),vector(:,1,i1),ad);
    result(:,1,i1) =kernel_matrix(:,:,m)*vector(:,1,i1);
end
for i2=1:iter_num
    
	if(mod(i2,o_size)==0)%position
		col=floor(i2/o_size);
		row=o_size;
	else 
		col=floor(i2/o_size)+1;
		row=mod(i2,o_size);
	end
    	
	for i3=1:kernel_num
		mid_o(row,col,i3,m)=result(i3,1,i2);
	end
end

o=o+mid_o(:,:,:,m);

end




% end
