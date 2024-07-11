
exp_prefix='Reproduce'
wandb_setting_common='--is_wandb True --wandb_project LbT --wandb_entity junhao-zheng --exp_prefix '$exp_prefix
wandb_setting_specific='--wandb_name step2_math'


for split_i in $(seq 0 1);
do
    echo 'Split '$split_i

    python scripts/exam.py ./examples/config/math/llama-3-8b_exam.yaml \
                            --output-path ./output/student_exp_default/teacher_exp_default_exams/math200_r256s$split_i \
                            --teaching-dataset-file ./output/teacher_exp_default/teaching/math200_r256s$split_i \
                            --exam-dataset-file ./examples/datasets/math/snapshots \
                            $wandb_setting $wandb_setting_specific
    

done
    
