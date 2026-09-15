# Minimal starter for Week 4 Q4 — students fill thresholds and ranking logic.
# Data: ../data/variants_q4.tsv (synthetic teaching table).

# Suggested packages (install if needed):
# install.packages(c("readr", "dplyr"))

library(readr)
library(dplyr)

variants_path <- file.path("..", "data", "variants_q4.tsv")

# Comment lines start with '#'; readr skips them by default for comments.
variants <- read_tsv(variants_path, comment = "#", show_col_types = FALSE)

# --- Placeholders: replace NA / defaults with YOUR thresholds ---
min_dp <- NA_real_      # e.g. depth floor
min_gq <- NA_real_      # e.g. genotype quality floor
max_af <- NA_real_      # e.g. rare-variant AF ceiling
require_pass <- TRUE    # keep only FILTER == "PASS"?

# Consequences you consider potentially impactful (edit freely):
impact_consequences <- c(
  "stop_gained",
  "frameshift_variant",
  "splice_acceptor_variant",
  "splice_donor_variant",
  "missense_variant"
  # add / remove as justified
)

filtered <- variants %>%
  filter(
    if (require_pass) FILTER == "PASS" else TRUE,
    if (!is.na(min_dp)) DP >= min_dp else TRUE,
    if (!is.na(min_gq)) GQ >= min_gq else TRUE,
    if (!is.na(max_af)) AF <= max_af else TRUE,
    CONSEQUENCE %in% impact_consequences
  )

# Optional: further prioritize by ClinVar label, gene list, etc.
# prioritized <- filtered %>% arrange(...)

print(filtered)

# Write your shortlist for the report (path optional):
# write_tsv(filtered, "q4_shortlist.tsv")

# Reminder: understand every filter; verify AF/ClinVar assumptions with
# authoritative resources before drawing biological conclusions.
