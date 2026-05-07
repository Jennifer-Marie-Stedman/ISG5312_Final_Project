#!/bin/bash 
#SBATCH --job-name=combineFreqMissing
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


INDIR=../../results/07_pop_stats/frequencies/
OUTDIR=../../results/07_pop_stats/frequencies/
PREFIX=tibetan
POP=49


# Step 1: split allele frequencies
awk 'NR==1 {
  print "CHROM", "POS", "ALLELE1", "FREQ1", "ALLELE2", "FREQ2"
}
NR>1 {
  split($5, a1, ":");
  split($6, a2, ":");
  print $1, $2, a1[1], a1[2], a2[1], a2[2];
}' "${INDIR}/${PREFIX}.frq" > "${OUTDIR}/${PREFIX}_biallelic_clean.frq"


# Step 2: merge missingness
awk -v POP="${POP}" '
NR==FNR {
  key=$1":"$2
  miss[key]=$5
  next
}

FNR==1 {
  print $0, "POP_SAMPLES", "N_MISS", "N"
  next
}

{
  key=$1":"$2
  nmiss = miss[key]

  if (nmiss == "") {
    nmiss = "NA"
    n = "NA"
  } else {
    n = POP - (nmiss + 0)
  }

  print $0, POP, nmiss, n
}
' "${INDIR}/${PREFIX}.lmiss" "${OUTDIR}/${PREFIX}_biallelic_clean.frq" > "${OUTDIR}/${PREFIX}_final.frq"

hostname
date
