#!/usr/bin/env python3
"""Tiny synthetic PE FASTQ for Q2 (not a real genome). Re-run to regenerate demo files."""
from __future__ import annotations

import gzip
import random
from pathlib import Path

# ponytail: 120 read-pairs is enough to illustrate QC traps; not a real library.
N_PAIRS = 120
READ_LEN = 80
SEED = 4
ADAPTER = "AGATCGGAAGAGC"  # Illumina-like 3′ fragment (truncated)
OUT = Path(__file__).resolve().parents[1] / "data" / "demo_fastq"

rng = random.Random(SEED)


def phred(q: int) -> str:
    return chr(33 + max(0, min(40, q)))


def dna(n: int, gc: float = 0.41) -> str:
    alphabet = "AT" * int(100 * (1 - gc)) + "GC" * int(100 * gc)
    return "".join(rng.choice(alphabet) for _ in range(n))


def qual_string(n: int, *, crash: bool) -> str:
    qs = []
    for i in range(n):
        q = 36 - i // 12
        if crash and i > 50:
            q = 12
        qs.append(phred(q + rng.randint(-1, 1)))
    return "".join(qs)


def write_gz(path: Path, records: list[tuple[str, str, str]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with gzip.open(path, "wt") as fh:
        for name, seq, qual in records:
            fh.write(f"@{name}\n{seq}\n+\n{qual}\n")


def main() -> None:
    r1, r2 = [], []
    template = dna(READ_LEN)
    for i in range(N_PAIRS):
        if i < 18:
            seq = (template[: READ_LEN - len(ADAPTER)] + ADAPTER)[:READ_LEN]
            crash = True
        elif i < 30:
            seq = dna(READ_LEN, gc=0.78)
            crash = False
        elif i < 48:
            seq = template
            crash = False
        else:
            seq = dna(READ_LEN)
            crash = False
        mate = dna(READ_LEN) if i >= 18 else (dna(READ_LEN - len(ADAPTER)) + ADAPTER)[:READ_LEN]
        r1.append((f"DEMO:{i+1}:1", seq, qual_string(READ_LEN, crash=crash or i < 18)))
        r2.append((f"DEMO:{i+1}:2", mate, qual_string(READ_LEN, crash=i < 18)))

    write_gz(OUT / "S01_CTRL_WGS_R1.fastq.gz", r1)
    write_gz(OUT / "S01_CTRL_WGS_R2.fastq.gz", r2)
    print(f"wrote {N_PAIRS} pairs under {OUT}")


if __name__ == "__main__":
    main()
