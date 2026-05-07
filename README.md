# ISG5312_Final_Project
This repository was created for UConn's ISG-5312 Genomic Data Analysis Final Project.

This repository will house the scripts for the final project in ISG-5312. Large file types, such as fastq, bam, and vcf, will not be stored here.
Variant detection of biallelic SNPs will be performed on the 50 Tibetan samples from Yi et al. (2010), 40 Han samples from the 1000 Genomes Project, and
40 British samples from the 1000 Genomes Project. The analysis will inlcude calculating per SNP Fst for each population pair, and then calculating PBS.
This analysis is a conceptual reproduction of the analyis performed previously (Yi et al., 2010) in which the EPAS1 gene was associated with high-altitude adapation
in the Tibetan population.

The general workflow is:

1. Download fastq files from SRA and from the 1000 Genomes Project (sratoolkit and wget, respectively)
1. Download the genome from Genome in a Bottle (wget)
1. QC reads, trim for adapters and low quality sequence, QC trimmed reads (FastQC, Trimmomatic, MultiQC)
1. Index the reference and then align reads to the reference (bwa-mem2)
1. QC alignment (samtools, bedtools, R, MultiQC)
1. Call variants (freebayes)
1. Filter for high quality biallelic SNPs (vcftools)
1. Calculate Fst per SNP between populations (awk)
1. Calculate PBS per SNP with the Tibetan population as the target (awk)
1. Plot PBS by chromosome position in a Manhattan-style plot (R)

To replicate this conceptual reproduction, or apply it to your own project, run the scripts in order. Each major step of the process has a subdirectory. Start with the subdirectory
labeled "01_downloadData". Complete the scripts within each subdirectory before moving on to the next. Be sure to inspect your output, check your standard err and out files,
as well as confirming your job completed with an exit code of 0, before moving on. Many, but not all, scripts in this workflow are dependent on successful completion of the previous
script.

Yi, X., Liang, Y., Huerta-Sanchez, E., Jin, X., Cuo, Z. X. P., Pool, J. E., Xu, X., Jiang, H., Vinckenbosch, N., et al. (2010). Sequencing of 50 human exomes reveals adaptation to high altitude. *Science, 329*(5987), 75–78. https://doi.org/10.1126/science.1190371

