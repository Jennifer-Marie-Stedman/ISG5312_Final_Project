#!/bin/bash 
#SBATCH --job-name=multiqc_trimmed
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 6
#SBATCH --mem=10G
#SBATCH --qos=general
#SBATCH --partition=general
#SBATCH --mail-user=
#SBATCH --mail-type=ALL
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err


hostname
date

# output directory
OUTDIR=../../results/02_qc/fastqc_tibetan_trimmed
mkdir -p $OUTDIR

module load MultiQC/1.9

# run multiqc on fastqc output
multiqc -f -o $OUTDIR/multiqc $OUTDIR

hostname
date



