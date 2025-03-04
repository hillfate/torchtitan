#!/bin/bash
#SBATCH --job-name=train_llama
#SBATCH --nodelist=dgx10
#SBATCH --gres=gpu:4
#SBATCH --time=7-00:00:00                  # Job time limit (7 days)
#SBATCH --cpus-per-task=64
#SBATCH --mem=320GB
#SBATCH --output=llama_train_%j.out
#SBATCH --error=llama_train_%j.err

# Load the conda setup script to enable `conda activate`
source /network/rit/home/yd291146/miniconda3/etc/profile.d/conda.sh

# Activate the conda environment
conda activate torchtitan_official

# Change directory to the project folder
cd ~/projects/torchtitan/

# Run the training script
LOG_RANK=0,1 NGPU=4 ./run_train.sh