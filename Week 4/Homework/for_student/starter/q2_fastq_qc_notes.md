# FastQC metric notes (Q2 cheat-sheet)

Brief interpretation cues only — not full answers. Always check FastQC/MultiQC docs for your software version.

| Metric | Typical “healthy” look | Common red flags | What to do next |
|---|---|---|---|
| **Per-base sequence quality** | High mean Q across most cycles; mild drop at read ends OK | Sharp early drop; large fraction of low-Q bases | Trim/filter; check chemistry or instrument run |
| **Per-sequence GC content** | Roughly matches expected for genome/transcriptome; unimodal | Sharp spikes or strong bi/multimodality | Contamination, biased enrichment, or adapter dimers |
| **Adapter content** | Near zero until late cycles (if at all) | Rising adapter % mid-read | Adapter trimming; re-QC after trim |
| **Sequence duplication levels** | Assay-dependent: low–moderate for WGS; higher OK for RNA-seq | Extreme duplication for intended assay | PCR over-amplification, low input, or collapse UMIs if used |
| **Overrepresented sequences** | Few / explainable (e.g., known primers) | Many high-% sequences | Adapters, rRNA, primers, or contamination — identify by BLAST/lookup |
| **Per-base N content** | Near zero across cycles | Rising N mid-read | Basecalling or chemistry failure |
| **Sequence length distribution** | Matches expected read length (or trim plan) | Unexpected multimodal lengths | Confirm trim settings / instrument config |

Optional demo: `data/demo_fastq/fastqc_snapshot.tsv` (S01). Interpret ≥4 modules against this table; FastQC install is not required.

**Workflow tip:** interpret QC in light of the **assay** (WGS vs RNA-seq vs ATAC-seq differ). Record genome build and tool versions when you move past QC into alignment.
