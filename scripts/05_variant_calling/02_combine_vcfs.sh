#!/bin/bash
#SBATCH --job-name=combine_vcfs
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 2
#SBATCH --mem=8G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH -o combine_%j.out
#SBATCH -e combine_%j.err


set -euo pipefail

hostname
date

# load modules

module load bcftools/1.19
module load htslib/1.21-gcc-11.4.0-m4swynp

# define variables

OUTDIR=../../results/05_variantCalling/freebayes_array
TARGETS=../../results/04_alignQC/makewindows_test_data/GRCh38_1mb.bed
LIST=${OUTDIR}/vcf_list.txt

# make list of vcf files

sed 's/\t/:/; s/\t/-/' ${TARGETS} | \
awk '{print "'"${OUTDIR}"'/"$0".vcf.gz"}' > ${LIST}

# confirm bed regions equal vcfs

echo "Regions:"
wc -l ${TARGETS}

echo "VCFs listed:"
wc -l ${LIST}

# concatenate many vcfs into one file

bcftools concat -f ${LIST} -Oz -o ${OUTDIR}/final.vcf.gz

# add index

tabix -p vcf ${OUTDIR}/final.vcf.gz

hostname
date
