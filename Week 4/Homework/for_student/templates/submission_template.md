# Week 4 Homework Report

**Name:**  
**Student ID:**  
**Date:**  
**Course:** Bioinformatics: From Multi-Omics Data to Discovery  

---

## Question 1 — Choose the Right Genomic Assay (25 pts)

### 1. Reasoning before AI

<!-- First assay choice and why; brief overall strategy -->



### 2. AI-assisted workflow

<!-- Main prompt(s) or agent steps; how AI critiqued your design -->



### 3. Verification

<!-- ≥2 authoritative sources; what you confirmed or revised -->



### 4. Final conclusion

**~200-word explanation** (what each assay measures, cannot prove, and how assays complement):



**Figure:** `figures/Q1_workflow.png` (or .pdf / .svg)

> **The biological question chooses the assay because…**

---

## Question 2 — From FASTQ to a Trustworthy Analysis Workflow (25 pts)

### 1. Reasoning before AI

<!-- Your hand-drawn / self-designed workflow steps and purpose of each -->



### 2. AI-assisted workflow

<!-- Plan-first prompt; key commands/tools AI suggested -->



### 3. Verification

<!-- Docs checked for genome build, formats, software, parameters -->

**FastQC metrics (≥4):**

| Metric | What I looked for | Interpretation |
|---|---|---|
| | | |
| | | |
| | | |
| | | |

**AI-audit table:**

| AI recommendation | My verification | Final decision |
|---|---|---|
| | | |
| | | |
| | | |

### 4. Final conclusion

**Figure:** `figures/Q2_workflow.png`

> **The analyst, not the AI, is responsible for…**

---

## Question 3 — Multi-Omics Regulatory Hypothesis (25 pts)

### 1. Reasoning before AI

<!-- Independent layer reads + preliminary integrated model -->



### 2. AI-assisted workflow

<!-- Prompt asking AI to separate observations / interpretations / missing evidence -->



### 3. Verification

<!-- How you checked AI framing; sources consulted -->



### 4. Final conclusion

**Observations vs interpretations vs missing evidence:**

| Layer | Direct observation | Interpretation | Missing evidence |
|---|---|---|---|
| ATAC-seq | | | |
| H3K27ac | | | |
| Methylation | | | |
| Hi-C / Micro-C | | | |
| RNA-seq | | | |

**Alternative explanation:**



**Functional experiment (correlation vs causality):**



**~200-word integrated interpretation:**



**Figure:** `figures/Q3_locus_chain.png`  
Chain: Accessibility → chromatin state → methylation → 3D contact → expression → perturbation

> **The candidate element regulates Gene Y by ______, and this can be tested by ______.**

---

## Question 4 — Variant Prioritization (25 pts)

### 1. Reasoning before AI

<!-- Your filtering logic: quality, AF, consequence, clinical/biological evidence -->



### 2. AI-assisted workflow

<!-- Plan-first prompt; filtering code/workflow used -->



### 3. Verification

<!-- ≥2 resources (ClinVar, Ensembl, gnomAD-style AF sources, PubMed, etc.) -->



### 4. Final conclusion

**Top 1–2 variants and why:**



**False-lead critique (and which concerns matter):**



**~200-word interpretation** structured as:

Known evidence → computational inference → scientific hypothesis → required experiment



**Figure:** `figures/Q4_prioritization.png`

> **Variant ______ may influence ______ by affecting ______; this can be tested by ______.**

---

## Appendix (optional)

- Prompts used (abbreviated)  
- Code snippets / filter thresholds  
- Extra figures  
