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
#SBATCH --array=[0-2]

hostname
date

#################################################################
# Trimmomatic
#################################################################

module load Trimmomatic/0.39

# set input/output directory variables
INDIR=../../results/02_qc/trimmed_tibetan_fastq
TRIMDIR=../../results/02_qc/trimmed_tibetan_fastq/headcropped
mkdir -p $TRIMDIR

# sample bash array
SAMPLELIST=(SRR043124_trim SRR043142_trim SRR043155_trim)

# run trimmomatic
SAMPLE=${SAMPLELIST[$SLURM_ARRAY_TASK_ID]}

java -jar $Trimmomatic SE -threads 4 \
        ${INDIR}/${SAMPLE}.fastq.gz \
        ${TRIMDIR}/${SAMPLE}_trim.fastq.gz \
        HEADCROP:20

hostname
date
