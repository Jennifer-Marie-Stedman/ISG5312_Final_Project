# ISG5312_Final_Project
Repository made for UConn ISG-5312 Genomic Data Analysis Final Project

This repository will house the scripts and analyses for the final project in ISG-5312. Large files, such as fastq, will not be stored here.
Variant detection of SNPs and small indels will be performed on samples from Wong et al. (2025). 

The directory tree (below) outlines the anticipated workflow.

.
├── data
├── genome
├── results
│   ├── 02_qc
│   ├── 03_alignment
│   ├── 04_alignment_qc
│   ├── 05_variant_calling
│   └── 06_annotate
└── scripts
    ├── 02_qc
    ├── 03_alignment
    ├── 04_alignment_qc
    ├── 05_variant_calling
    └── 06_annotate

Wong, M., Liew, B., Hum, M. et al. Benchmarking of variant calling software for whole-exome sequencing using gold standard datasets. Sci Rep 15, 13697 (2025). https://doi.org/10.1038/s41598-025-97047-7
