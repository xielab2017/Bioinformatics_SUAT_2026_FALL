# Week 5 Homework
## From Verified Counts to an Interpretable DESeq2 Result

**Course:** Bioinformatics: From Multi-Omics Data to Discovery  
**Week:** 5 — Transcriptomics: RNA-Seq Principles and Differential Expression Analysis with DESeq2  
**Expected effort:** One focused hour

## Learning goal

Build a transparent bulk RNA-seq differential-expression workflow from a raw integer count matrix and sample metadata. The analysis should distinguish the treatment effect from a balanced batch effect and document every major decision.

## Input files

- `Week5_Homework_Count_Matrix.csv`
- `Week5_Homework_Sample_Metadata.csv`
- `Week5_Homework_Starter.R`

The matrix contains **1,000 genes × 12 samples**. The experimental design contains two conditions (`control`, `treated`) and three balanced batches (`A`, `B`, `C`).

## Required workflow

1. Import the count matrix and metadata.
2. Verify:
   - count values are non-negative integers;
   - count-matrix columns exactly match metadata row names;
   - `condition` and `batch` are factors;
   - `control` is the reference level.
3. Construct a DESeq2 object with:
   - `design = ~ batch + condition`
4. Pre-filter genes:
   - retain genes with at least 10 counts in at least 3 samples.
5. Run DESeq2 and inspect `resultsNames(dds)`.
6. Extract the `treated versus control` comparison.
7. Apply log2 fold-change shrinkage with `apeglm`.
8. Generate:
   - one PCA plot;
   - one MA or volcano plot.
9. Export the complete shrunken result table.
10. Save the fitted DESeq2 object and `sessionInfo()`.
11. Use AI for one clearly documented task.
12. Write a 100–150 word interpretation that states:
   - the comparison;
   - the strongest QC observation;
   - the number and direction of significant genes;
   - one biological interpretation;
   - one limitation;
   - what AI generated and what you independently verified.

## Recommended statistical threshold

Use:

- `padj < 0.05`
- `abs(log2FoldChange) >= 1`

Report both the statistical threshold and the effect-size threshold.

## Required submission

- `week5_deseq2_analysis.R`
- `week5_deseq2_results.csv`
- `week5_pca.png`
- `week5_de_plot.png`
- `week5_interpretation.md`
- `week5_AI_verification_log.md`
- `week5_deseq2_object.rds`
- `session_info.txt`

## Suggested time allocation

| Time | Task |
|---|---|
| 0–10 min | Inspect inputs and verify sample identity |
| 10–20 min | Construct the DESeq2 object |
| 20–35 min | Filter, fit, inspect coefficients, and extract the contrast |
| 35–50 min | Create PCA and differential-expression figures |
| 50–60 min | Export results, document AI use, and write interpretation |

## Scientific cautions

- Do not transform the count matrix to TPM, CPM, percentages, or z-scores before DESeq2.
- Do not assume the coefficient name; inspect `resultsNames(dds)`.
- Do not omit batch from the design.
- Do not remove a sample based on PCA alone.
- Do not call a gene biologically important solely because its adjusted p value is small.
- Do not overwrite the original input files.
