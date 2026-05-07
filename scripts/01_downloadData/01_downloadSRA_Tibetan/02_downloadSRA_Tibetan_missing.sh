#!/bin/bash
#SBATCH --job-name=fasterq_dump_xanadu
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 12
#SBATCH --mem=15G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=first.last@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

hostname
date

#################################################################
# Download fastq files from SRA 
#################################################################

# load software
module load parallel/20180122
module load sratoolkit/3.0.1

# Modified from rnaseq_tutorial

# The data are from this study:
    # https://www.science.org/doi/full/10.1126/science.1190371
    # 50 Tibetan Exomes
    # https://trace.ncbi.nlm.nih.gov/Traces/study/
    # SRP002446

OUTDIR=/core/projects/GAP/GDA/jstedman/Final_Project_SP26_Large_Files/tibetan_fastq

mkdir -p $OUTDIR


# Get a list of SRA accession numbers to download, put them in a file.
# Remove header if necessary.
# Transfer accession list from local pc to HPC.

ACCLIST=../metadata/Tibetan_accessionlist_missing.txt

echo "Accession list has been loaded"

# use parallel to download 2 accessions at a time. 
cat $ACCLIST | parallel -j 2 "fasterq-dump -O ${OUTDIR} {}"

echo "Accessions have been downloaded."

# compress the files 
ls ${OUTDIR}/*fastq | parallel -j 12 gzip

echo "Files have been compressed."

hostname
date
