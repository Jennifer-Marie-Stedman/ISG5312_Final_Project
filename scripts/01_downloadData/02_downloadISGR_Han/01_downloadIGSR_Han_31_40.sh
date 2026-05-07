#!/bin/bash
#SBATCH --job-name=download_IGSR_31_40
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

# Download data from samples 31 through 40

#NA18561

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251901/ERR251901_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251901/ERR251901_2.fastq.gz

#NA18562

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR009/ERR009036/ERR009036_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR009/ERR009036/ERR009036_2.fastq.gz

#NA18563

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR032/SRR032179/SRR032179_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR032/SRR032179/SRR032179_2.fastq.gz

#NA18564

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251558/ERR251558_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251558/ERR251558_2.fastq.gz

#NA18565

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR032/SRR032161/SRR032161_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR032/SRR032161/SRR032161_2.fastq.gz

#NA18566

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR009/ERR009026/ERR009026_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR009/ERR009026/ERR009026_2.fastq.gz

#NA18567

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR032/SRR032157/SRR032157_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR032/SRR032157/SRR032157_2.fastq.gz

#NA18570

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR009/ERR009037/ERR009037_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR009/ERR009037/ERR009037_2.fastq.gz

#NA18571

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR008/ERR008912/ERR008912_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR008/ERR008912/ERR008912_2.fastq.gz

#NA18572

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR009/ERR009009/ERR009009_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR009/ERR009009/ERR009009_2.fastq.gz

hostname
date
