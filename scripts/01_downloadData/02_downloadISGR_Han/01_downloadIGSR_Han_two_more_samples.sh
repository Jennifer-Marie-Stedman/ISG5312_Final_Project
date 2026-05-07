#!/bin/bash
#SBATCH --job-name=download_additional_two_samples
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

# Download two more samples

#NA18573

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251564/ERR251564_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251564/ERR251564_2.fastq.gz


#NA18574

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR032/SRR032163/SRR032163_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR032/SRR032163/SRR032163_2.fastq.gz


hostname
date

