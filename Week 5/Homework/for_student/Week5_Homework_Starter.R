# ================================================================
# Week 5 Homework Starter
# Bulk RNA-seq differential expression with DESeq2
# ================================================================

# Required packages:
# BiocManager::install(c("DESeq2", "apeglm"))
# install.packages(c("tidyverse", "pheatmap", "ggrepel"))
library(rstudioapi) 
# Set working directory
setwd(dirname(getActiveDocumentContext()$path))
#################Load Necessary tools##########################

suppressPackageStartupMessages({
  library(DESeq2)
  library(apeglm)
  library(tidyverse)
  library(ggrepel)
})

# ----------------------------
# 1. Project paths
# ----------------------------
count_file <- "Week5_Homework_Count_Matrix.csv"
metadata_file <- "Week5_Homework_Sample_Metadata.csv"

dir.create("outputs", showWarnings = FALSE)
dir.create("figures", showWarnings = FALSE)

# ----------------------------
# 2. Import
# ----------------------------
counts <- read.csv(
  count_file,
  row.names = 1,
  check.names = FALSE
)

coldata <- read.csv(
  metadata_file,
  row.names = 1,
  check.names = FALSE
)

# ----------------------------
# 3. Mandatory validation
# ----------------------------
stopifnot(ncol(counts) == nrow(coldata))
stopifnot(identical(colnames(counts), rownames(coldata)))
stopifnot(all(counts >= 0))
stopifnot(all(as.matrix(counts) == round(as.matrix(counts))))

coldata$condition <- relevel(factor(coldata$condition), ref = "control")
coldata$batch <- factor(coldata$batch)

print(table(coldata$batch, coldata$condition))
print(summary(colSums(counts)))

# ----------------------------
# 4. Construct DESeq2 object
# ----------------------------
dds <- DESeqDataSetFromMatrix(
  countData = counts,
  colData = coldata,
  design = ~ batch + condition
)

# TODO: Explain why batch is included in the design.

# ----------------------------
# 5. Pre-filter
# ----------------------------
keep <- rowSums(counts(dds) >= 10) >= 3
cat("Genes before filtering:", nrow(dds), "\n")
dds <- dds[keep, ]
cat("Genes after filtering:", nrow(dds), "\n")

# ----------------------------
# 6. Fit model
# ----------------------------
dds <- DESeq(dds)

coef_names <- resultsNames(dds)
print(coef_names)

# TODO: Confirm the exact treated-versus-control coefficient name.
target_coef <- "condition_treated_vs_control"

if (!target_coef %in% coef_names) {
  stop(
    "Expected coefficient was not found. Inspect resultsNames(dds) and update target_coef."
  )
}

# ----------------------------
# 7. Extract and shrink results
# ----------------------------
res <- results(
  dds,
  contrast = c("condition", "treated", "control"),
  alpha = 0.05
)

res_shrunk <- lfcShrink(
  dds,
  coef = target_coef,
  type = "apeglm"
)

res_df <- as.data.frame(res_shrunk) |>
  rownames_to_column("gene_id") |>
  mutate(
    significant = !is.na(padj) &
      padj < 0.05 &
      abs(log2FoldChange) >= 1,
    direction = case_when(
      significant & log2FoldChange > 0 ~ "Up in treated",
      significant & log2FoldChange < 0 ~ "Down in treated",
      TRUE ~ "Not significant"
    )
  ) |>
  arrange(padj)

write.csv(
  res_df,
  "outputs/week5_deseq2_results.csv",
  row.names = FALSE
)

cat("Significant genes:", sum(res_df$significant), "\n")
print(table(res_df$direction))

# ----------------------------
# 8. PCA
# ----------------------------
vsd <- vst(dds, blind = FALSE)

pca_df <- plotPCA(
  vsd,
  intgroup = c("condition", "batch"),
  returnData = TRUE
)

percent_var <- round(100 * attr(pca_df, "percentVar"))

p_pca <- ggplot(
  pca_df,
  aes(
    x = PC1,
    y = PC2,
    color = condition,
    shape = batch,
    label = name
  )
) +
  geom_point(size = 4) +
  geom_text_repel(size = 3, max.overlaps = Inf) +
  labs(
    title = "Week 5 RNA-seq PCA",
    x = paste0("PC1: ", percent_var[1], "% variance"),
    y = paste0("PC2: ", percent_var[2], "% variance")
  ) +
  theme_bw(base_size = 12)

ggsave(
  "figures/week5_pca.png",
  p_pca,
  width = 7,
  height = 5,
  dpi = 300
)

# ----------------------------
# 9. Volcano plot
# ----------------------------
plot_df <- res_df |>
  mutate(
    neg_log10_padj = -log10(pmax(padj, 1e-300))
  )

p_volcano <- ggplot(
  plot_df,
  aes(
    x = log2FoldChange,
    y = neg_log10_padj,
    color = direction
  )
) +
  geom_point(alpha = 0.7, size = 1.8) +
  geom_vline(
    xintercept = c(-1, 1),
    linetype = "dashed"
  ) +
  geom_hline(
    yintercept = -log10(0.05),
    linetype = "dashed"
  ) +
  scale_color_manual(
    values = c(
      "Up in treated" = "#C0392B",
      "Down in treated" = "#2F6DB3",
      "Not significant" = "grey70"
    )
  ) +
  labs(
    title = "Differential expression: treated versus control",
    x = "Shrunken log2 fold change",
    y = "-log10 adjusted p value",
    color = NULL
  ) +
  theme_bw(base_size = 12)

ggsave(
  "figures/week5_de_plot.png",
  p_volcano,
  width = 7,
  height = 5,
  dpi = 300
)

# ----------------------------
# 10. Save reproducibility files
# ----------------------------
saveRDS(
  dds,
  "outputs/week5_deseq2_object.rds"
)

capture.output(
  sessionInfo(),
  file = "outputs/session_info.txt"
)

# ----------------------------
# 11. Student interpretation
# ----------------------------
# TODO: Write 100–150 words describing:
# - comparison and design
# - strongest QC observation
# - significant-gene count and direction
# - one biological interpretation
# - one limitation
# - how AI was used and independently verified
