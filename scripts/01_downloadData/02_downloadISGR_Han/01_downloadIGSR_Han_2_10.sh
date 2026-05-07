#!/bin/bash
#SBATCH --job-name=download_IGSR_9_genomes
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

# Download 9 samples

#NA18526

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251539/ERR251539_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251539/ERR251539_2.fastq.gz

#NA18528

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR234/ERR234331/ERR234331_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR234/ERR234331/ERR234331_2.fastq.gz

#NA18530

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR022/ERR022345/ERR022345_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR022/ERR022345/ERR022345_2.fastq.gz

#NA18531

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR234/ERR234333/ERR234333_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR234/ERR234333/ERR234333_2.fastq.gz

#NA18532

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR009/ERR009015/ERR009015_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR009/ERR009015/ERR009015_2.fastq.gz

#NA18533

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR189/SRR189816/SRR189816_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR189/SRR189816/SRR189816_2.fastq.gz

#NA18534

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR022/ERR022317/ERR022317_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR022/ERR022317/ERR022317_2.fastq.gz

#NA18535

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR032/SRR032749/SRR032749_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR032/SRR032749/SRR032749_2.fastq.gz

#NA18536

wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251543/ERR251543_1.fastq.gz
wget -P $OUTDIR ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR251/ERR251543/ERR251543_2.fastq.gz

hostname
date
