# Week 1 R/RStudio practice starter script
# Course: Bioinformatics: From Multi-Omics Data to Discovery

# 1. Set your working directory or open this folder as an RStudio Project.
# 2. Install packages once if needed:
# install.packages("tidyverse")

library(tidyverse)

metadata <- read_csv("sample_metadata.csv")
counts <- read_csv("toy_gene_counts.csv")
enzyme <- read_csv("enzyme_activity.csv")

# Inspect the first rows
head(metadata)
head(counts)
head(enzyme)

# Your homework starts here.
