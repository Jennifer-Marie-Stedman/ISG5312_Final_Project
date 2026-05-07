#!/bin/bash
#SBATCH --job-name=download_IGSR_11_21
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 1
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

# Download data for missing file

#NA18545

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251551/ERR251551_2.fastq.gz

hostname
date

