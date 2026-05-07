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
#SBATCH --array=[0-39]

hostname
date

#################################################################
# Trimmomatic
#################################################################

module load Trimmomatic/0.39

# set input/output directory variables
INDIR=/core/projects/GAP/GDA/jstedman/Final_Project_SP26_Large_Files/han_fastq
TRIMDIR=../../results/02_qc/trimmed_han_fastq
mkdir -p $TRIMDIR

# adapters to trim out
ADAPTERS=/isg/shared/apps/Trimmomatic/0.39/adapters/TruSeq3-PE-2.fa

# sample bash array
ACCLIST=../../metadata/Han_accessionlist.txt

# run trimmomatic
SAMPLE=$(sed -n "$((SLURM_ARRAY_TASK_ID+1))p" $ACCLIST)


java -jar $Trimmomatic PE -threads 4 \
        ${INDIR}/${SAMPLE}_1.fastq.gz \
        ${INDIR}/${SAMPLE}_2.fastq.gz \
        ${TRIMDIR}/${SAMPLE}_trim_1.fastq.gz ${TRIMDIR}/${SAMPLE}_trim_orphans_1.fastq.gz \
        ${TRIMDIR}/${SAMPLE}_trim_2.fastq.gz ${TRIMDIR}/${SAMPLE}_trim_orphans_2.fastq.gz \
        ILLUMINACLIP:"${ADAPTERS}":2:30:10 \
        SLIDINGWINDOW:4:15 MINLEN:45

hostname
date
