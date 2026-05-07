#!/bin/bash
#SBATCH --job-name=download_IGSR_test
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
# Download fastq files from ISGR
#################################################################


# The data are from this study:
    # internationalgenome.org/data-portal/
    # 40 Han Chinese Low Coverage Genome Sequence

OUTDIR=/core/projects/GAP/GDA/jstedman/Final_Project_SP26_Large_Files/han_fastq

mkdir -p $OUTDIR

# Download test sample files, NA18525

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR741/SRR741372/SRR741372_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR741/SRR741372/SRR741372_2.fastq.gz

hostname
date


# Add to future tests
# wget -c -nc --tries=0 --waitretry=5 <URL>
# resume partial downloads, don't download duplicates, unlimited tries, wait 5 minutes between retries



