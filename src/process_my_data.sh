#!/bin/bash
# Author: Tomas Goldsack

mkdir ../merged_tokenized_data/PLOS
mkdir ../merged_tokenized_data/PLOS/train
mkdir ../merged_tokenized_data/PLOS/valid
mkdir ../merged_tokenized_data/PLOS/test

mkdir ../merged_tokenized_data/eLife
mkdir ../merged_tokenized_data/eLife/train
mkdir ../merged_tokenized_data/eLife/valid
mkdir ../merged_tokenized_data/eLife/test

python preprocess.py -mode tokenize -raw_path ../raw_data/PLOS/train -save_path ../merged_tokenized_data/PLOS/train -log_file ../logs/plos.log
python preprocess.py -mode tokenize -raw_path ../raw_data/PLOS/val -save_path ../merged_tokenized_data/PLOS/valid -log_file ../logs/plos.log
python preprocess.py -mode tokenize -raw_path ../raw_data/eLife/train -save_path ../merged_tokenized_data/eLife/train -log_file ../logs/elife.log
python preprocess.py -mode tokenize -raw_path ../raw_data/eLife/val -save_path ../merged_tokenized_data/eLife/valid -log_file ../logs/elife.log

mkdir ../json_data/PLOS
mkdir ../json_data/eLife

python preprocess.py -mode format_to_lines -raw_path ../merged_tokenized_data/PLOS -save_path ../json_data/PLOS -log_file ../logs/plos.log -n_cpus 1 -use_bert_basic_tokenizer false -map_path ../urls 
python preprocess.py -mode format_to_lines -raw_path ../merged_tokenized_data/eLife -save_path ../json_data/eLife -log_file ../logs/elife.log -n_cpus 1 -use_bert_basic_tokenizer false -map_path ../urls 

mkdir ../bert_data/PLOS
mkdir ../bert_data/eLife

python preprocess.py -mode format_to_bert -raw_path ../json_data/PLOS -save_path ../bert_data/PLOS -lower -n_cpus 1 -log_file ../logs/preprocess_plos.log
python preprocess.py -mode format_to_bert -raw_path ../json_data/eLife -save_path ../bert_data/eLife -lower -n_cpus 1 -log_file ../logs/preprocess_elife.log
