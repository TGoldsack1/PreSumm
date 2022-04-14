#!/bin/bash
# Author: Tomas Goldsack

python train.py -task ext -mode train -bert_data_path ../bert_data/PLOS/PLOS -ext_dropout 0.1 -model_path ../models/PLOS -lr 2e-3 -visible_gpus 0 -report_every 50 -save_checkpoint_steps 1000 -batch_size 3000 -train_steps 50000 -accum_count 2 -log_file ../logs/ext_PLOS -use_interval true -warmup_steps 10000 -max_pos 512