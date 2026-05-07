#!/bin/bash 
#SBATCH --job-name=makewindows_100K
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 5
#SBATCH --mem=5G
#SBATCH --qos=general
#SBATCH --partition=general
#SBATCH --mail-user=
#SBATCH --mail-type=ALL
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

hostname
date

# load required software

module load bedtools/2.31.1
module load bamtools/2.5.2-gcc-11.4.0-dn4cduw
module load samtools/1.19.2
module load htslib/1.22.1

# define and/or create input, output directories

INDIR=../../results/03_Alignment/bwa_align_test_data

OUTDIR=../../results/04_alignQC/makewindows_test_data
mkdir -p $OUTDIR

# create faidx genome index file
GENOME=../../genome/GRCh38_GIABv3_no_alt_analysis_set_maskedGRC_decoys_MAP2K3_KMT2C_KCNJ18.fasta
FAI=../../genome/GRCh38_GIABv3_no_alt_analysis_set_maskedGRC_decoys_MAP2K3_KMT2C_KCNJ18.fasta.fai
samtools faidx ${GENOME}

# make a "genome" file, required by bedtools makewindows command, set variable for location
GFILE=${OUTDIR}/GRCh38.genome
cut -f 1-2 $FAI > $GFILE

# make 100kb window bed file, set variable for location
WIN100KB=${OUTDIR}/GRCh38_100kb.bed
bedtools makewindows -g ${GFILE} -w 100000 >${WIN100KB}

hostname
date

