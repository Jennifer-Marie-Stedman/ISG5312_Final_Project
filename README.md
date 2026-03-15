# ISG5312_Final_Project
This repository was created for UConn's ISG-5312 Genomic Data Analysis Final Project.

This repository will house the scripts and analyses for the final project in ISG-5312. Large files, such as fastq, will not be stored here.
Variant detection of SNPs and small indels will be performed on samples from Yi et al.(2010).

The general workflow is:

1. Download fastq files from SRA
2. Download the genome, then index the genome
3. QC reads, trim for adapters and low quality sequence, QC trimmed reads
4. Align reads to reference
5. Call variants
6. Filter variants
7. Annotate variants

Yi, X., Liang, Y., Huerta-Sanchez, E., Jin, X., Cuo, Z. X. P., Pool, J. E., Xu, X., Jiang, H., Vinckenbosch, N., et al. (2010). Sequencing of 50 human exomes reveals adaptation to high altitude. *Science, 329*(5987), 75–78. https://doi.org/10.1126/science.1190371

