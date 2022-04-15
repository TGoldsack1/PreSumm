#!/bin/bash
#SBATCH --nodes=1
#SBATCH --gres=gpu:8
#SBATCH --time=02:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=tgoldsack1@sheffield.ac.uk

module load python/anaconda3
module load cuda/11.1-gcc-9.1.0

source activate bertsumext
pwd

#/jmain02/apps/docker/torch-batch -c train_model.sh


sh train_model.sh
