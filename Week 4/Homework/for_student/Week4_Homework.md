# Week 4 Homework  
## Genomics — Sequencing, Variant Interpretation, and AI-Assisted Analysis

| | |
|---|---|
| **Course** | Bioinformatics: From Multi-Omics Data to Discovery |
| **Total** | 100 points |
| **Format** | Individual take-home homework |
| **Submission** | Markdown or PDF report |

Supporting files (variant table, sample manifest, templates, starters) live in this student package. See `README.md`.

---

## General requirement

AI use is **required**, but AI must not replace your own scientific reasoning.

For **each** question, your answer must contain exactly four short parts:

1. **Your reasoning before AI** — initial judgment or analysis plan.  
2. **AI-assisted workflow** — main prompt(s) or agent workflow you used.  
3. **Verification** — how you checked AI output using data, official documentation, databases, or literature.  
4. **Final conclusion** — your own scientific interpretation or hypothesis.

Do not submit an AI answer directly. You are responsible for the biological question, the evidence, the assumptions, and the final decision.

---

## Question 1 — Choose the Right Genomic Assay  
**25 points**

Gene X is significantly upregulated in a disease group compared with healthy controls. Possible explanations include a regulatory variant, altered chromatin accessibility, altered transcription-factor binding or histone modification, DNA methylation changes, or altered enhancer–promoter contact.

Design an experimental strategy to determine which mechanism is most likely responsible. Choose the most appropriate methods from:

WGS/WES · ATAC-seq · ChIP-seq / CUT&Tag / CUT&RUN · WGBS / EM-seq · CAGE / RAMPAGE · Hi-C / Micro-C · RNA-seq · MPRA · CRISPR perturbation

**Before AI:** state which assay you would choose first and why.  
**With AI:** ask AI to critique your design rather than replace it.  
**Verify:** check major recommendations with at least two authoritative sources; revise if needed.

### Submission

- One **workflow figure**
- A **~200-word explanation** answering: *What does each assay measure, what can it not prove, and how do the assays complement each other?*

**Required ending:**

> **The biological question chooses the assay because…**

Worksheet: `templates/Q1_assay_strategy.md`

---

## Question 2 — From FASTQ to a Trustworthy Analysis Workflow  
**25 points**

You receive paired-end Illumina FASTQ files from a human sequencing experiment. A fictional sample manifest is in `data/sample_manifest.csv`.

Q2 is a **workflow-design** question: you are not required to run a full alignment. A tiny synthetic PE demo (`data/demo_fastq/`, sample S01 only) is provided so you can inspect FASTQ format and optionally run FastQC. If FastQC is not installed, interpret **at least four** metrics from `data/demo_fastq/fastqc_snapshot.tsv` (planted QC traps, not a real sequencing run).

Design a complete analysis workflow from raw reads to interpretable genomic results. Include:

1. FASTQ quality control  
2. Reference genome selection  
3. Alignment  
4. Mapped-read processing  
5. Assay-specific downstream analysis  
6. Annotation  
7. Visualization  
8. Interpretation  

**Before AI:** draw your own workflow and explain the purpose of each major step.  
**With AI:** use a **plan-first** prompt to generate or refine the computational workflow. AI may propose Linux commands or R code.  
**Verify:** proposed reference genome, file formats, software, and major parameters against official documentation.

Use **FastQC** as an example and interpret **at least four** QC metrics (e.g., per-base quality, GC content, adapter content, duplication, overrepresented sequences). Brief notes: `starter/q2_fastq_qc_notes.md`.

### Submission

- One **final workflow diagram**
- A short **AI-audit table**:

| AI recommendation | My verification | Final decision |
|---|---|---|
| | | |

**Required ending:**

> **The analyst, not the AI, is responsible for…**

Worksheet: `templates/Q2_workflow_audit.md`

---

## Question 3 — Integrate Multi-Omics Evidence into a Regulatory Hypothesis  
**25 points**

A candidate regulatory region is located upstream of Gene Y. You have ATAC-seq, H3K27ac ChIP-seq/CUT&Tag, DNA methylation, Hi-C/Micro-C, and RNA-seq data from the same biological condition.

Determine whether this region is a plausible enhancer of Gene Y.

**Before AI:** interpret each omics layer independently (accessibility, histone state, methylation, 3D contact, transcription), then draft one integrated regulatory model.  
**With AI:** ask AI to separate **direct observations**, **biological interpretations**, and **missing evidence**.  
**Then:** propose at least one **alternative explanation** and design one **functional experiment** (e.g., MPRA, CRISPRi, enhancer deletion, or loop-anchor perturbation) that can distinguish correlation from causality.

### Submission

- One **integrated locus figure** showing:

> **Accessibility → chromatin state → methylation → 3D contact → expression → perturbation**

- A **~200-word interpretation**

**Required ending (testable hypothesis):**

> **The candidate element regulates Gene Y by ______, and this can be tested by ______.**

Worksheet: `templates/Q3_regulatory_hypothesis.md`

---

## Question 4 — AI-Assisted Variant Prioritization  
**25 points**

Use the synthetic variant table in `data/variants_q4.tsv` (columns include CHROM, POS, REF, ALT, FILTER, DP, GQ, AF, GENE, CONSEQUENCE, CLINVAR_SIG, CLINVAR_ID, NOTE).

Prioritize **one or two** variants for further investigation.

**Before AI:** define your own filtering logic (technical quality, population frequency, functional consequence, biological/clinical evidence).  
**With AI:** use a plan-first prompt to generate or refine the filtering workflow. R code is allowed (`starter/q4_filter_starter.R` is a skeleton); you must understand every major filter and verify assumptions.  
**Verify:** use at least two authoritative resources (e.g., ClinVar, ClinGen, Ensembl, NCBI/RefSeq, population-frequency databases, PubMed).  
**Critique:** after ranking, ask AI for the strongest reasons the top variant could be a **false lead**, then decide which concerns matter scientifically.

### Submission

- One **prioritization workflow**
- A **~200-word final interpretation** separating:

> **Known evidence → computational inference → scientific hypothesis → required experiment**

**Required ending:**

> **Variant ______ may influence ______ by affecting ______; this can be tested by ______.**

Worksheet: `templates/Q4_variant_prioritization.md`

---

## Grading rubric

| Criterion | Points |
|---|---:|
| Independent scientific reasoning | 25 |
| Appropriate use of AI / agent workflow | 20 |
| Verification using data and authoritative sources | 20 |
| Correct genomic and multi-omics interpretation | 20 |
| Scientific hypothesis and experimental design | 10 |
| Clarity and reproducibility | 5 |
| **Total** | **100** |

---

## Final principle

> **AI should accelerate your reasoning, not replace it.**

A strong submission clearly shows how you moved from **data → evidence → interpretation → hypothesis** while keeping human scientific judgment in control.
