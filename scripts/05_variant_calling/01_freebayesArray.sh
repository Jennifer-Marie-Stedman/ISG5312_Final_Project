#!/bin/bash
#SBATCH --job-name=freebayes_array
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 2
#SBATCH --mem=8G
#SBATCH --qos=general
#SBATCH --partition=general
#SBATCH --mail-user=
#SBATCH --mail-type=ALL
#SBATCH --array=1-3297
#SBATCH -o %x_%A_%a.out
#SBATCH -e %x_%A_%a.err

hostname
date

# Create Mantis verison of freebayes that can be run on a large data set
# with low coverage

# load required software
module load freebayes/1.3.10
module load htslib/1.21-gcc-11.4.0-m4swynp
module load bcftools/1.19
module load parallel/20240322
module load vcflib/1.0.13
# module load bedtools/2.29.0 

# directories/files

INDIR=../../results/03_Alignment/bwa_align_final

OUTDIR=../../results/05_variantCalling/freebayes_array
mkdir -p ${OUTDIR} 

# make a list of bam files
# commented out to prevent collisions. run manually prior to running this script.
# ls ${INDIR}/*.bam >${INDIR}/bam_list.txt

# set a variable for the reference genome location
GENOME=../../genome/GRCh38_GIABv3_no_alt_analysis_set_maskedGRC_decoys_MAP2K3_KMT2C_KCNJ18.fasta

# use target regions of 1mb
TARGETS=../../results/04_alignQC/makewindows_test_data/GRCh38_1mb.bed


# call variants using freebayes
REGION=$(cat "$TARGETS" | sed 's/\t/:/ ; s/\t/-/' | sed -n ${SLURM_ARRAY_TASK_ID}p)

freebayes -f ${GENOME} --bam-list ${INDIR}/bam_list.txt -r ${REGION} --skip-coverage 1000 -k |
	vcffirstheader |
	vcfstreamsort -w 1000 |
	vcfuniq |
	bgzip >"${OUTDIR}/${REGION}.vcf.gz"

#Index vcf
tabix -p vcf "${OUTDIR}/${REGION}.vcf.gz"


hostname
date

