#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --account=dcs-acad2
#SBATCH --partition=dcs-acad
#SBATCH --mem=96GB
#SBATCH --nodes=1 
#SBATCH --gpus-per-node=2
#SBATCH --mail-type=ALL
#SBATCH --mail-user=tgoldsack1@sheffield.ac.uk
 
module load Anaconda3/5.3.0
module load CUDA/10.2.89-GCC-8.3.0

source activate bertsumext

python train.py -task ext -mode test -test_from ../models/PLOS/model_step_7500.pt -batch_size 3000 -test_batch_size 500 -bert_data_path ../bert_data/PLOS/PLOS -log_file ../logs/ext_PLOS_test_7500 -model_path ../models/PLOS -sep_optim true -use_interval true -visible_gpus 1 -alpha 0.95 -min_length 50 -max_pos 1024 -max_tgt_len 200 -max_length 1024 -result_path ../logs/ext_bert_PLOS_test 
