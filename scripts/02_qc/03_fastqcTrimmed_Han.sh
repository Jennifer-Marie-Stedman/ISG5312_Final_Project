#!/bin/bash 
#SBATCH --job-name=fastqc_trimmed
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

# load software
module load fastqc/0.12.1

# input/output directory
INDIR=../../results/02_qc/trimmed_han_fastq
OUTDIR=../../results/02_qc/fastqc_han_trimmed
mkdir -p $OUTDIR

# run fastqc
fastqc -t 6 -o $OUTDIR ${INDIR}/*trim_{1..2}.fastq.gz

module load MultiQC/1.20

# run multiqc on fastqc output
multiqc -f -o $OUTDIR/multiqc $OUTDIR


hostname
date
