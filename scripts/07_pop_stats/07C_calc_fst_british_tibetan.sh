#!/bin/bash 
#SBATCH --job-name=calc_fst
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
OUTDIR=../../results/07_pop_stats/pop_20n_filtering
POP1=british
POP2=tibetan

mkdir -p "${OUTDIR}"

# Calculate Fst

awk '
function pi(p, n) {
  if (n <= 1) return 0
  return 2 * p * (1 - p) * (n / (n - 1))
}

function dxy(p1, p2) {
  return p1 * (1 - p2) + (1 - p1) * p2
}

NR==FNR {
  key=$1":"$2
  af1[key]=$6
  n1[key]=$9
  next
}

FNR==1 { next }

{
  key=$1":"$2

  if (!(key in af1)) next

  p1 = af1[key]
  p2 = $6

  n1_val = n1[key]
  n2_val = $9

# Add sample size filter, update from 10 to 20

if (n1_val <= 20 || n2_val <= 20) {
  fst = "NA"
  print $1, $2, fst
  next
}


  pi1 = pi(p1, n1_val)
  pi2 = pi(p2, n2_val)
  d   = dxy(p1, p2)

  if (d > 0) {
    fst = 1 - (pi1 + pi2) / (2 * d)
  } else {
    fst = "NA"
  }

  print $1, $2, fst
}
' "${INDIR}"/"${POP1}"_final.frq "${INDIR}"/"${POP2}"_final.frq > "${OUTDIR}"/"${POP1}"_"${POP2}"_fst.out

hostname
date
