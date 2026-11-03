# Group Journal — Parallel Quicksort

> Each session: date, what was done, and the individual results of each member.
> Keep chronological (newest at bottom).

## Members

- Member 1: draken (WSL2 machine)
- Member 2: ____________
- Member 3: ____________

---

## 2026-10-18 — Project setup

**What was done**
- Analyzed the reference repo (structure, code, data, journal).
- Created the project skeleton (`TODO.md`, `journal.md`, `machines.md`, `Experiment/analysis.Rmd`).

**Individual results**
- draken: set up the project skeleton, will run the benchmark on WSL2.
- Member 2: ____________
- Member 3: ____________

---

## 2026-10-22 — Merge into a single repository layout

**What was done**
- Merged the former `Quicksort_project/` content into the repository root.
- Kept a single `src/`, `scripts/`, and `data/` tree; removed duplicated files.
- Kept the improved benchmark driver (randomized runs, metadata, configurable
  sizes/repetitions) and both CSV extractors (long and legacy wide formats).
- Consolidated the docs: `TODO.md`, `journal.md`, `machines.md`,
  `Experiment/analysis.Rmd`, and `data/README.md` now live at the root.

**Individual results**
- draken: performed the merge and verified that the duplicated sources were
  identical before deleting them.
- Member 2: ____________
- Member 3: ____________

---

## 2026-11-03 — Smoke tests and first full baseline on WSL2

**What was done**
- Built the baseline (`-O0`, `THREAD_LEVEL=10`).
- Smoke tests at 20:40 and 20:46: sizes 1000, 10000, 100000, 1000000 with 2
  repetitions each (8 size records and 24 CSV data rows per run).
- Full benchmark at 20:58 with Opera GX open (~1.6 GiB RAM) and at 21:02
  without it: sizes 100 to 10,000,000 with 10 repetitions (70 size records and
  210 CSV data rows per run).
- All runs completed with no `Oops` lines.
- Preliminary mean speedup (Sequential / Parallel) crosses 1 between 1M
  (0.84x) and 5M (1.02x), reaching 1.07x at 10M. The 20:58 run is slower than
  the 21:02 run mainly around 1M (parallel ~5% slower), so Opera GX adds noise
  but does not change the trend.

**Individual results**
- draken: ran the smoke tests and both full runs on WSL2; all datasets are in
  `data/Draken_2026-11-03/`.
- Member 2: ____________
- Member 3: ____________

Note: the 21:02 run is the clean baseline. Ten repetitions are enough for a
first analysis; a second clean session would still be useful to check
session-to-session stability.

---

<!-- TEMPLATE: copy this block for each new session

## YYYY-MM-DD — <short title>

**What was done**
- ...

**Individual results**
- Member 1: ...
- Member 2: ...
- Member 3: ...

-->
