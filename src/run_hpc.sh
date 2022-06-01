#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --account=dcs-acad2
#SBATCH --partition=dcs-acad
#SBATCH --mem=96GB
#SBATCH --nodes=1 
#SBATCH --gpus-per-node=2
#SBATCH --mail-type=ALL
#SBATCH --mail-user=tgoldsack1@sheffield.ac.uk

#module load python/anaconda3
#module load cuda/11.1-gcc-9.1.0

module load Anaconda3/5.3.0
module load CUDA/10.2.89-GCC-8.3.0

source activate bertsumext
pwd

#/jmain02/apps/docker/torch-batch -c train_model.sh


sh train_model.sh
