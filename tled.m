lable=load('E:\matlab\VPS\model\CNN\par_new\result\test_res0.csv');
err_cnt=0;
for i_err=1:134
if(result_lib(1,i_err)~=lable(i_err,1))
err_cnt=err_cnt+1;
else
err_cnt=err_cnt ;
end
end