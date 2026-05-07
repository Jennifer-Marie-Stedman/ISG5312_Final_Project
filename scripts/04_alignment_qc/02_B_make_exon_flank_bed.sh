#!/bin/bash 
#SBATCH --job-name=make_exon_flank_bed
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --mem=5G
#SBATCH --qos=general
#SBATCH --partition=general
#SBATCH --mail-user=
#SBATCH --mail-type=ALL
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err


set -euo pipefail


hostname
date

# load required software
module load bedtools/2.31.1

# INPUTS
GTF="../../genome/Homo_sapiens.GRCh38.115.gtf.gz"
GENOME_FAI="../../genome/GRCh38_GIABv3_no_alt_analysis_set_maskedGRC_decoys_MAP2K3_KMT2C_KCNJ18.fasta.fai"

# OUTPUT SETTINGS
OUTDIR="../../results/04_alignQC/"
OUT_PREFIX="GRCh38_exons_flank1000"

# Make output directory if it doesn't exist
mkdir -p ${OUTDIR}

# STEP 1: Extract exons, add chr prefix, keep standard chromosomes
echo "Extracting exons from GTF..."
zcat ${GTF} | \
awk '$3 == "exon"' | \
awk 'BEGIN{OFS="\t"} $1 ~ /^[0-9]+$|^X$|^Y$/ {print "chr"$1, $4-1, $5}' \
> ${OUTDIR}/${OUT_PREFIX}.exons.bed

# STEP 2: Sort
echo "Sorting BED..."
sort -k1,1 -k2,2n ${OUTDIR}/${OUT_PREFIX}.exons.bed \
> ${OUTDIR}/${OUT_PREFIX}.exons.sorted.bed

# STEP 3: Add flanking sequence (±1000 bp)
echo "Adding flanking regions (±1000 bp)..."
bedtools slop \
  -i ${OUTDIR}/${OUT_PREFIX}.exons.sorted.bed \
  -g ${GENOME_FAI} \
  -b 1000 \
> ${OUTDIR}/${OUT_PREFIX}.flank1000.bed

# STEP 4: Merge overlapping regions
echo "Merging overlapping regions..."
bedtools merge \
  -i ${OUTDIR}/${OUT_PREFIX}.flank1000.bed \
> ${OUTDIR}/${OUT_PREFIX}.merged.bed

# STEP 5: Cleanup intermediate files (optional)
rm ${OUTDIR}/${OUT_PREFIX}.exons.bed \
   ${OUTDIR}/${OUT_PREFIX}.exons.sorted.bed \
   ${OUTDIR}/${OUT_PREFIX}.flank1000.bed

echo "Done!"
echo "Final BED file: ${OUTDIR}/${OUT_PREFIX}.merged.bed"
