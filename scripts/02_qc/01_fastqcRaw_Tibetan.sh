#!/bin/bash 
#SBATCH --job-name=fastqc_raw
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

# Confirm the software versions on your HPC

hostname
date

# load software
module load fastqc/0.12.1

# create output directory
OUTDIR=../../results/02_qc/fastqc_raw
mkdir -p $OUTDIR

# run fastqc
fastqc -t 6 -o $OUTDIR /core/projects/GAP/GDA/jstedman/Final_Project_SP26_Large_Files/tibetan_fastq/*.fastq.gz

# load software
module load MultiQC/1.33

# run multiqc on fastqc output
multiqc -f -o $OUTDIR/multiqc $OUTDIR

hostname
date
