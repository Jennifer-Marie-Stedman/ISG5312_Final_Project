#!/bin/bash 
#SBATCH --job-name=align_pipe
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mem=30G
#SBATCH --qos=general
#SBATCH --partition=general
#SBATCH --mail-user=
#SBATCH --mail-type=ALL
#SBATCH -o %x_%A_%a.out
#SBATCH -e %x_%A_%a.err
#SBATCH --array=[0-80]

hostname
date

# load required software
module load samtools/1.19.2
module load samblaster/0.1.24
module load bwa-mem2/2.2.1

#set directories
SAMPDIR=/core/projects/GAP/GDA/final_project2/results/02_qc/England_trimmed_fastq

OUTDIR=../../results/03_Alignment/bwa_align_british
mkdir -p $OUTDIR

INDEX=../../results/03_Alignment/bwa_index/GRCh38

# sample ID list
ACCLIST=/core/projects/GAP/GDA/final_project2/metadata/accessionlistEngland.txt

# extract one sample ID
SAMPLE=$(sed -n "$((SLURM_ARRAY_TASK_ID+1))p" $ACCLIST)

# create read group string
RG=$(echo \@RG\\tID:$SAMPLE\\tSM:$SAMPLE)

# execute the alignment pipe:
bwa-mem2 mem -t 7 -R ${RG} ${INDEX} ${SAMPDIR}/${SAMPLE}_trim_1.fastq.gz $SAMPDIR/${SAMPLE}_trim_2.fastq.gz | \
	samblaster | \
	samtools view -S -h -u - | \
	samtools sort -T ${OUTDIR}/${SAMPLE}.temp -O BAM >$OUTDIR/${SAMPLE}.bam 

# index alignment file
samtools index ${OUTDIR}/${SAMPLE}.bam

hostname
date
