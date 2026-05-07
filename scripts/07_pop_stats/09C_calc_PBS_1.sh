#!/bin/bash
#SBATCH --job-name=calc_pbs
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --mem=10G
#SBATCH --qos=general
#SBATCH --partition=general
#SBATCH --mail-user=
#SBATCH --mail-type=ALL
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err


set -euo pipefail

hostname
date


INDIR=../../results/07_pop_stats/pop_20n_filtering
OUTDIR=../../results/07_pop_stats/pop_20n_filtering
FST_T1=british_tibetan_fst.out # target population vs comparator1
FST_T2=han_tibetan_fst.out # target population vs comparator2
FST_C12=british_han_fst.out # comparator1 population against comparator2

mkdir -p "${OUTDIR}"

# Calculate PBS per SNP
	# Accounts for NA
	# Accounts for -nan
	# Accounts for negative Fst

awk '
function bad(x) {
  return (x == "" || x == "NA" || x == "NaN" || x == "-nan" || x != x)
}

function clamp(x) {
  if (bad(x)) return "NA"
  if (x < 0) x = 0
  if (x >= 1) x = 0.999999
  return x
}

function T(x) {
  return -log(1 - x)
}

# file 1: t1
ARGIND==1 {
  key=$1":"$2
  t1[key]=$3
  next
}

# file 2: t2
ARGIND==2 {
  key=$1":"$2
  t2[key]=$3
  next
}

# file 3: c12
ARGIND==3 {
  key=$1":"$2
  c12[key]=$3
  next
}

END {
  for (k in t1) {

    if (!(k in t2) || !(k in c12)) continue

    a = clamp(t1[k] + 0)
    b = clamp(t2[k] + 0)
    c = clamp(c12[k] + 0)

    if (bad(a) || bad(b) || bad(c)) continue

    ta = T(a)
    tb = T(b)
    tc = T(c)

    pbs = (ta + tb - tc) / 2

    split(k, arr, ":")
    print arr[1], arr[2], pbs
  }
}
' "${INDIR}/${FST_T1}" "${INDIR}/${FST_T2}" "${INDIR}/${FST_C12}" > "${OUTDIR}/tibetan_han_british_20n_pbs.out"

# For future use

# Filter and sort out so that it is R-ready

# grep -E '^chr([1-9]|1[0-9]|2[0-2]|X|Y)\b' "${OUTDIR}/tibetan_han_british_20n_pbs.out" | sort -k1,1V -k2,2n > "${OUTDIR}"/pbs_filtered_sorted.txt

hostname
date
