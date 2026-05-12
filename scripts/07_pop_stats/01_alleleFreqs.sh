#!/bin/bash 
#SBATCH --job-name=allele_frequencies
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

# Define variables
POP1=../../metadata/british_pop_list.txt
POP2=../../metadata/han_pop_list.txt
POP3=../../metadata/tibetan_pop_list.txt

POP1_NAME=british
POP2_NAME=han
POP3_NAME=tibetan

INDIR=../../results/06_annotate/filtered_vcf
PREFIX=NR_MONDAYNIGHT

VCF_IN=../../results/06_annotate/filtered_vcf/NR_MONDAYNIGHT.recode.vcf.gz

OUTDIR=../../results/07_pop_stats/frequencies

echo "VCF: ${VCF_IN}"
# echo "BED: ${TARGETS}"
echo "OUT: ${OUTDIR}/${PREFIX}"

# Create directory

mkdir -p "${OUTDIR}"

# calculate allele frequencies for each population

# POP1
vcftools --gzvcf "${VCF_IN}" \
  --keep ${POP1} \
  --freq \
  --out "${OUTDIR}/${POP1_NAME}"

# POP2
vcftools --gzvcf "${VCF_IN}" \
  --keep ${POP2} \
  --freq \
  --out "${OUTDIR}/${POP2_NAME}"

# POP3
vcftools --gzvcf "${VCF_IN}" \
  --keep ${POP3} \
  --freq \
  --out "${OUTDIR}/${POP3_NAME}"

hostname
date

