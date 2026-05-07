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

# Download data for samples 11 through 21

#NA18537

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR034/ERR034771/ERR034771_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR034/ERR034771/ERR034771_2.fastq.gz

#NA18538

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR032/SRR032183/SRR032183_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR032/SRR032183/SRR032183_2.fastq.gz

#NA18539

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR032/SRR032191/SRR032191_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR032/SRR032191/SRR032191_2.fastq.gz

#NA18541

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR032/SRR032173/SRR032173_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR032/SRR032173/SRR032173_2.fastq.gz

#NA18542

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR009/ERR009032/ERR009032_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR009/ERR009032/ERR009032_2.fastq.gz

#NA18543

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR022/ERR022322/ERR022322_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR022/ERR022322/ERR022322_2.fastq.gz

#NA18544

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251549/ERR251549_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251549/ERR251549_2.fastq.gz

#NA18545

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251551/ERR251551_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251551/ERR251551_2.fastq.gz

#NA18546

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR022/ERR022370/ERR022370_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR022/ERR022370/ERR022370_2.fastq.gz

#NA18547

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251555/ERR251555_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251555/ERR251555_2.fastq.gz

#NA18548

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251556/ERR251556_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251556/ERR251556_2.fastq.gz

hostname
date
