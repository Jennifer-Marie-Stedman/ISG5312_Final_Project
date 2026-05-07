#!/bin/bash
#SBATCH --job-name=download_IGSR_22_30
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

# Download data for samples 22 through 30

#NA18549

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR022/ERR022324/ERR022324_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR022/ERR022324/ERR022324_2.fastq.gz

#NA18550

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR008/ERR008987/ERR008987_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR008/ERR008987/ERR008987_2.fastq.gz

#NA18552

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251891/ERR251891_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251891/ERR251891_2.fastq.gz

#NA18553

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR032/SRR032179/SRR032179_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR032/SRR032179/SRR032179_2.fastq.gz

#NA18555

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251893/ERR251893_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251893/ERR251893_2.fastq.gz

#NA18557

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR022/ERR022381/ERR022381_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR022/ERR022381/ERR022381_2.fastq.gz

#NA18558

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR034/ERR034772/ERR034772_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR034/ERR034772/ERR034772_2.fastq.gz

#NA18559

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR022/ERR022389/ERR022389_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR022/ERR022389/ERR022389_2.fastq.gz

#NA18560

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR032/SRR032741/SRR032741_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR032/SRR032741/SRR032741_2.fastq.gz

hostname
date
