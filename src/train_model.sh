
#module load python/anaconda3
#module load cuda/11.1-gcc-9.1.0

#source activate bertsumext

pwd

# python train.py -task ext -mode train -bert_data_path ../bert_data/PLOS/PLOS -ext_dropout 0.1 -model_path ../models/PLOS -lr 2e-3 -visible_gpus 0,1 -report_every 50 -save_checkpoint_steps 2500 -batch_size 3000 -train_steps 50000 -accum_count 2 -log_file ../logs/ext_PLOS -use_interval true -warmup_steps 10000 -max_pos 1024 -max_tgt_len 200 -max_length 1024 
python train.py -task ext -mode train -bert_data_path ../bert_data/eLife/eLife -ext_dropout 0.1 -model_path ../models/eLife -lr 2e-3 -visible_gpus 0,1 -report_every 50 -save_checkpoint_steps 1000 -batch_size 3000 -train_steps 15000 -accum_count 2 -log_file ../logs/ext_eLife -use_interval true -warmup_steps 10000 -max_pos 1024 -max_tgt_len 400 -max_length 1024 
