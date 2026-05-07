

########## README ########################################################################

# Before running this script, be sure to remove non-standard contigs form the pbs list, and
# sort by chromosome number and then position number. 
# This formatting is required for this R script.

# Use this code to filter and sort. Adjust filenames as necessary.

# grep -E '^chr([1-9]|1[0-9]|2[0-2]|X|Y)\b' pbs.file | sort -k1,1V -k2,2n > pbs_filtered_sorted_xxn.txt

# Given section 2 below, the step above may seem redundant, but the script has not been testesd without
# this filtering and sorting.

# If running on an HPC, create a conda environment with R installed, plus
# the packages data.table and ggplot.

# This script has not been tested on a local pc or outside a conda enviroment.

##########################################################################################

library(data.table)
library(ggplot2)

# ---------------------------
# 1. Read data
# ---------------------------
pbs <- fread("../../results/07_pop_stats/pop_20n_filtering/pbs_filtered_sorted_20n.txt", header = FALSE)
colnames(pbs) <- c("CHR", "POS", "PBS")

pbs[, CHR := as.character(CHR)]
pbs[, POS := as.integer(POS)]

# ---------------------------
# 1.5 Set negative PBS to 0
# ---------------------------
pbs[PBS < 0, PBS := 0]

# ---------------------------
# 2. Filter chromosomes (1-22, X, Y)
# ---------------------------
pbs <- pbs[grepl("^chr([0-9]{1,2}|X|Y)$", CHR)]

# ---------------------------
# 3. Order chromosomes properly
# ---------------------------
pbs[, chr_num := NA_integer_]

# Autosomes
pbs[grepl("^chr[0-9]+$", CHR),
    chr_num := as.integer(sub("^chr", "", CHR))]

# Sex chromosomes
pbs[CHR == "chrX", chr_num := 23L]
pbs[CHR == "chrY", chr_num := 24L]

pbs <- pbs[!is.na(chr_num)]
setorder(pbs, chr_num, POS)

# ---------------------------
# 4. Genome-wide coordinates
# ---------------------------
chr_sizes <- pbs[, .(maxPOS = max(POS)), by = .(CHR, chr_num)]
setorder(chr_sizes, chr_num)

chr_sizes[, offset := c(0, cumsum(as.numeric(head(maxPOS, -1))))]

pbs <- merge(pbs, chr_sizes[, .(CHR, offset)], by = "CHR")
pbs[, POS_CUM := POS + offset]

axis_df <- pbs[, .(center = (min(POS_CUM) + max(POS_CUM)) / 2), by = .(CHR, chr_num)]
setorder(axis_df, chr_num)

# ---------------------------
# 5. Alternate chromosome colors
# ---------------------------
pbs[, chr_col := ifelse(chr_num %% 2 == 0, "even", "odd")]

# ---------------------------
# 6. Plot
# ---------------------------
png("pbs_manhattan_20n_filtered_alternating_chr.png",
    width = 1800, height = 600, res = 150)

ggplot(pbs, aes(x = POS_CUM, y = PBS, color = chr_col)) +

  # bigger, more visible points
  geom_point(size = 0.8, alpha = 0.7) +

  # blue / red alternating chromosomes
  scale_color_manual(values = c("odd" = "blue", "even" = "red")) +

  scale_x_continuous(
    breaks = axis_df$center,
    labels = axis_df$CHR
  ) +

  theme_bw() +
  labs(x = "Chromosome", y = "PBS") +
  theme(
    axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
    panel.grid.major.x = element_blank(),
    legend.position = "none"
  )

dev.off()
