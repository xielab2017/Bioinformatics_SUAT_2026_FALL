# Data files (Week 4 student package)

All files in this folder are **teaching synthetics**. They are fictional or simulated for homework practice.

- No real patient identifiers, clinical records, or protected health information (PHI).
- Gene names, ClinVar-style IDs, and genomic coordinates are illustrative and must not be treated as real clinical findings.
- Do not submit these tables to clinical databases as if they were patient data.

---

## `variants_q4.tsv`

Tab-separated variant table for **Question 4**.

| Column | Meaning |
|---|---|
| CHROM | Chromosome |
| POS | 1-based position (synthetic) |
| REF / ALT | Reference and alternate alleles |
| FILTER | Call filter status (e.g., PASS / Fail) |
| DP | Read depth |
| GQ | Genotype quality |
| AF | Population-style allele frequency (synthetic) |
| GENE | Gene symbol |
| CONSEQUENCE | Predicted consequence label |
| CLINVAR_SIG | ClinVar-style significance label (synthetic) |
| CLINVAR_ID | Placeholder ClinVar-like ID |
| NOTE | Short teaching hint (not a gold ranking) |

A comment line starting with `#` at the top of the file describes the overall teaching design. Students should still apply their own filters; the NOTE column is a light hint, not a graded ranking.

---

## `sample_manifest.csv`

Fictional paired-end Illumina sample sheet for **Question 2** context.

| Column | Meaning |
|---|---|
| sample_id | Sample identifier |
| condition | control / case |
| assay | Assay type (WGS, RNA-seq, ATAC-seq, ChIP-seq, …) |
| R1 / R2 | Fictional FASTQ filenames |
| notes | Optional context |

Only **S01** has a tiny synthetic FASTQ pair under `demo_fastq/` (120 PE reads, 80 bp). Other rows are filename context only. Do not run a production genome pipeline on this demo.

---

## `demo_fastq/`

| File | Meaning |
|---|---|
| `S01_CTRL_WGS_R1.fastq.gz` / `_R2.fastq.gz` | Optional hands-on PE FASTQ (synthetic; ~7 KB each) |
| `fastqc_snapshot.tsv` | Precomputed FastQC-style modules for the same demo |

Planted traps (for interpretation, not clinical truth): 3′ adapter, late-cycle quality drop, high-GC shoulder, duplicated template.

Regenerate with `python3 starter/make_demo_fastq.py`. FastQC is **optional**; the snapshot is enough to interpret ≥4 metrics.
