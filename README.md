# ISG5312 Final Project
This repository contains scripts and workflow documentation for UConn's ISG-5312 Genomic Data Analysis Final Project. Large file types, such as fastq, bam, and vcf, will not be stored here.

## Project Overview
This project implements an end-to-end population genomics workflow to investigate genomic differentiation associated with high-altitude adaptation in the Tibetan population. Using publicly available sequencing datasets, the workflow processes raw FASTQ files through alignment, variant calling, population genetic analysis, and genome-wide visualization of Population Branch Statistic (PBS) signals.

## Background
Variant detection of biallelic SNPs was performed on the 50 Tibetan samples from Yi et al. (2010), 40 Han samples from the 1000 Genomes Project, and
40 British samples from the 1000 Genomes Project. The analysis included calculating per-SNP FST for each population pair, then computing PBS.
This analysis is a conceptual reproduction of the analysis performed previously (Yi et al., 2010) in which the EPAS1 gene was associated with high-altitude adaptation
in the Tibetan population.

## Tools Used
- sratoolkit
- wget
- FastQC
- Trimmomatic
- MultiQC
- bwa-mem2
- samtools
- bedtools
- freebayes
- vcftools
- awk
- R
- ggplot2

## Repository Structure

```text
scripts/
├── 01_downloadData/
├── 02_qc/
├── 03_alignment/
├── 04_alignment_qc/
├── 05_variant_calling/
├── 06_annotate/
├── 07_pop_stats/
└── .gitignore
```

## General Workflow

1. Download fastq files from SRA and from the 1000 Genomes Project (sratoolkit and wget, respectively)
1. Download the genome from Genome in a Bottle (wget)
1. QC reads, trim for adapters and low quality sequence, QC trimmed reads (FastQC, Trimmomatic, MultiQC)
1. Index the reference and then align reads to the reference (bwa-mem2)
1. QC alignment (samtools, bedtools, R, MultiQC)
1. Call variants (freebayes)
1. Filter for high-quality biallelic SNPs (vcftools)
1. Calculate FST per SNP between populations (awk)
1. Calculate PBS per SNP with the Tibetan population as the target (awk)
1. Plot PBS by chromosome position in a Manhattan-style plot (R)

## Computational Environment

Analyses were performed on a Linux-based HPC environment using SLURM job scheduling.

## Representative Results

<img width="1800" height="600" alt="pbs_manhattan_20n_filtered_alternating_chr" src="https://github.com/user-attachments/assets/581a1ff4-981d-4865-af89-e4853f3df433" />

**Figure 1.** Manhattan-style visualization of Population Branch Statistic (PBS) values across genomic positions for the Tibetan population. PBS was calculated from pairwise FST estimates among Tibetan, Han, and British populations following SNP filtering. Some extreme outlier values likely reflect residual low-coverage and missingness effects observed during exploratory filtering analyses.


## Reproducing the Workflow
To reproduce this conceptual analysis, or apply it to your own project, run the scripts in order. Each major step of the process has a subdirectory. Start with the subdirectory
labeled "01_downloadData". Complete the scripts within each subdirectory before moving on to the next. Be sure to inspect your output, check your standard err and out files,
as well as confirming your job completed with an exit code of 0, before moving on. Many, but not all, scripts in this workflow are dependent on the successful completion of the previous
script.

## Citation

Yi, X., Liang, Y., Huerta-Sanchez, E., Jin, X., Cuo, Z. X. P., Pool, J. E., Xu, X., Jiang, H., Vinckenbosch, N., et al. (2010). Sequencing of 50 human exomes reveals adaptation to high altitude. *Science, 329*(5987), 75–78. https://doi.org/10.1126/science.1190371

