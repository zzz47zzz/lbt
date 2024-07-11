
shell_path='./shell/todo/'
for file_a in $shell_path*
do 
    temp_file=`basename $file_a` 
    echo 'Running shell = '$temp_file 
    gpu_idxes=${temp_file##*_}
    gpu_idxes=${gpu_idxes%%.*}
    gpu_lst_str=''
    for ((i=0;i<${#gpu_idxes};i++))
    do
        gpu_lst_str=${gpu_lst_str}','${gpu_idxes:$i:1}
    done
    gpu_lst_str=${gpu_lst_str:1}
    echo 'Runing command = CUDA_VISIBLE_DEVICES='$gpu_lst_str' nohop bash '$shell_path$temp_file' >nohup_'$gpu_idxes'.out 2>&1 &'
    CUDA_VISIBLE_DEVICES=$gpu_lst_str nohup bash $shell_path$temp_file >nohup_$gpu_idxes.out 2>&1 &
    sleep 2
done
