tmp_a=load('E:\matlab\VPS\model\CNN\WYX\one_iter\test_fc1.csv');
tmp_b=load('E:\matlab\VPS\model\CNN\WYX\weight\module.fc2.weight.csv');
tmp_c=tmp_b(1025:2048)';

tmp_result=tmp_c*tmp_a;