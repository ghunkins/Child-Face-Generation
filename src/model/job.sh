#!/bin/bash
#SBATCH -p gpu
#SBATCH -t 0-08:00:00
#SBATCH --mem 10GB
#SBATCH --job-name=PIX
#SBATCH --output=output_PIX_%j.txt
#SBATCH -e error_PIX_%j.txt
#SBATCH --gres=gpu:2

source activate new_pix
python main.py --backend tensorflow --dset audio_10000_new --nb_epoch 400 --generator deconv --img_dim 256 256 256