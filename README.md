# ISG5312_Final_Project
This repository was created for UConn's ISG-5312 Genomic Data Analysis Final Project.

This repository will house the scripts and analyses for the final project in ISG-5312. Large files, such as fastq, will not be stored here.
Variant detection of SNPs and small indels will be performed on samples from Wong et al. (2025). 

The general workflow is:

1. Download fastq files from SRA
2. Download the genome, then index the genome
3. QC reads, trim for adapters and low quality sequence, QC trimmed reads
4. Align reads to reference
5. Call variants
6. Filter variants
7. Annotate variants

Wong, M., Liew, B., Hum, M. et al. Benchmarking of variant calling software for whole-exome sequencing using gold standard datasets. Sci Rep 15, 13697 (2025). https://doi.org/10.1038/s41598-025-97047-7
