# Week 5 DESeq2 Verification Checklist

## Inputs
- [ ] Count matrix contains only non-negative integer values.
- [ ] Count-matrix columns are identical to metadata row names and in the same order.
- [ ] No duplicated sample IDs are present.
- [ ] `condition` and `batch` have the expected levels.
- [ ] `control` is the reference condition.

## Model
- [ ] The design formula is `~ batch + condition`.
- [ ] The design is balanced and the model matrix is full rank.
- [ ] The filtering rule is reported.
- [ ] `resultsNames(dds)` was inspected.
- [ ] The extracted comparison is treated versus control.

## Outputs
- [ ] PCA uses VST or another appropriate transformation.
- [ ] The DE plot labels its axes and thresholds.
- [ ] Adjusted p values, not raw p values, are used for significance.
- [ ] Effect size is considered together with FDR.
- [ ] The full results table is exported, including nonsignificant genes.
- [ ] The fitted object and `sessionInfo()` are saved.

## AI use
- [ ] The AI prompt is preserved.
- [ ] Generated code was run locally.
- [ ] Package functions and arguments were checked.
- [ ] Sample identity and coefficient direction were independently verified.
- [ ] Any AI-generated error or revision is documented.
