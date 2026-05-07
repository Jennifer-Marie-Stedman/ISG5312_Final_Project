#!/bin/bash 
#SBATCH --job-name=zip_index_NR_MONDAYNIGHT
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --mem=8G
#SBATCH --qos=general
#SBATCH --partition=general
#SBATCH --mail-user=
#SBATCH --mail-type=ALL
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err


set -euo pipefail

hostname
date

# Load modules

module load vcftools/0.1.16
module load htslib/1.21-gcc-11.4.0-m4swynp 

# Define variables

VCF_IN=../../results/06_annotate/filtered_vcf/NR_MONDAYNIGHT.recode.vcf

OUTDIR=../../results/06_annotate/filtered_vcf

PREFIX=NR_MONDAYNIGHT.recode

# Create directory, if not already created

mkdir -p "${OUTDIR}"

# Compress vcf

bgzip -c "$VCF_IN" > "${OUTDIR}"/"${PREFIX}.vcf.gz"

# Index 

tabix -p vcf "${OUTDIR}"/"${PREFIX}.vcf.gz"

hostname
date

