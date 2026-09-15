# Q2 Worksheet — FASTQ Workflow & AI Audit

Context: fictional paired-end Illumina samples in `data/sample_manifest.csv`. Optional hands-on: `data/demo_fastq/` (S01 only, 120 synthetic pairs) plus `fastqc_snapshot.tsv`. Do not treat the demo as a real genome library.

---

## My workflow before AI (outline)

| Step | Purpose | Output / checkpoint |
|---|---|---|
| 1. FASTQ QC | | |
| 2. Reference genome | | |
| 3. Alignment | | |
| 4. Mapped-read processing | | |
| 5. Downstream (assay-specific) | | |
| 6. Annotation | | |
| 7. Visualization | | |
| 8. Interpretation | | |

Assay I am assuming for this workflow (e.g., WGS, RNA-seq, ATAC-seq): _______________

---

## FastQC metrics checklist (≥4 required)

Mark metrics you will interpret and jot what “good / concerning” looks like (see also `starter/q2_fastq_qc_notes.md`).

| # | Metric | Include? | Expected pattern / red flag | My interpretation notes |
|---|---|---|---|---|
| 1 | Per-base sequence quality | ☐ | | |
| 2 | Per-sequence GC content | ☐ | | |
| 3 | Adapter content | ☐ | | |
| 4 | Sequence duplication levels | ☐ | | |
| 5 | Overrepresented sequences | ☐ | | |
| 6 | Per-base N content | ☐ | | |
| 7 | Sequence length distribution | ☐ | | |
| 8 | Other: _______________ | ☐ | | |

---

## Plan-first AI prompt (paste abbreviated version)



---

## AI-audit table (submit this)

| AI recommendation | My verification (doc / source) | Final decision |
|---|---|---|
| | | |
| | | |
| | | |
| | | |
| | | |

---

## Verification checklist

- [ ] Genome build / annotation version named explicitly  
- [ ] FASTQ / BAM / VCF (or assay equivalent) formats correct for tools used  
- [ ] Software names + versions (or “as of documentation date”) noted  
- [ ] Major parameters justified (not just default-blind)  
- [ ] At least one step where I rejected or modified an AI suggestion  

---

## Draft ending line

> The analyst, not the AI, is responsible for…
