#!/bin/bash
#SBATCH --job-name=trimmomatic
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --mem=15G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=first.last@uconn.edu
#SBATCH -o %x_%A_%a.out
#SBATCH -e %x_%A_%a.err
#SBATCH --array=[0-49]

hostname
date

#################################################################
# Trimmomatic
#################################################################

module load Trimmomatic/0.39

# set input/output directory variables
INDIR=/core/projects/GAP/GDA/jstedman/Final_Project_SP26_Large_Files/tibetan_fastq
TRIMDIR=../../results/02_qc/trimmed_tibetan_fastq
mkdir -p $TRIMDIR

# adapters to trim out
ADAPTERS=/isg/shared/apps/Trimmomatic/0.39/adapters/TruSeq3-SE.fa

# sample bash array
ACCLIST=../../metadata/Tibetan_accessionlist.txt

# run trimmomatic
SAMPLE=$(sed -n "$((SLURM_ARRAY_TASK_ID+1))p" $ACCLIST)


java -jar $Trimmomatic SE -threads 4 \
        ${INDIR}/${SAMPLE}.fastq.gz \
        ${TRIMDIR}/${SAMPLE}_trim.fastq.gz \
        ILLUMINACLIP:"${ADAPTERS}":2:30:10 \
        LEADING:3 TRAILING:3 \
        SLIDINGWINDOW:4:15 MINLEN:45

hostname
date
