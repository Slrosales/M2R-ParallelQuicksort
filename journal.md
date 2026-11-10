# Group Journal — Parallel Quicksort

> Each session: date, what was done, and the individual results of each member.
> Keep chronological (newest at bottom).

## Members

- Member 1: draken (WSL2 machine)
- Member 2: Ubuntu (OrbStack on Apple M3)
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

## 2026-11-10 — Ubuntu/OrbStack benchmark on Apple M3

**What was done**
- Built and ran the same baseline configuration as the WSL2 experiments:
  `-O0` and `THREAD_LEVEL=10`.
- Ran a smoke test at 10:43 with sizes 1000, 10000, 100000, and 1000000,
  using 2 repetitions (8 size records and 24 CSV data rows).
- Ran the complete benchmark with sizes 100 to 10,000,000, including both
  5000000 and 10000000, using 10 repetitions. Complete runs are stored at
  `data/ubuntu_2026-11-10/measurements_10:04.*`,
  `measurements_10:48.*`, and `measurements_10:51.*`.
- The last complete run, at 10:51, was performed as a clean run with the
  applications consuming resources on the host machine closed.
- All runs completed without `Oops` sorting failures. The raw `.txt` files
  record the same Linux environment: OrbStack kernel on `aarch64`, Apple M3,
  and 8 reported CPUs.

**Individual results**
- Ubuntu: completed the smoke test and the full benchmark on a separate
  Linux virtualized environment running on an Apple M3. 

**Analysis**
- The measurements show a clear fixed overhead for the parallel version at
  small and medium sizes. For sizes up to 100000, it is consistently slower
  than the sequential version, so creating and synchronizing threads costs
  more than the parallel execution saves.
- The parallel version becomes closer to the sequential one for larger
  arrays, but it does not become consistently faster on this machine. In the
  clean 10:51 run, the parallel/sequential mean speedup was approximately
  0.93x at both 5000000 and 10000000. A value below 1 means that the
  parallel version was slower; at 10000000, for example, it took about
  1.63 seconds compared with about 1.52 seconds for the sequential version.
- The 10:04 run was the closest to parity at 1000000, with a speedup of
  approximately 1.01x, but the later complete runs were below 1 at that
  size. This variation shows that the result near the crossover point is
  sensitive to run conditions, even with repeated measurements.
- Compared with the clean Draken run, where the parallel version reached
  approximately 1.02x at 5000000 and 1.07x at 10000000, the Apple M3
  environment does not show the same speedup trend. This comparison is
  descriptive rather than a direct hardware ranking, the experiments ran
  on different processors and virtualization environments.
- Overall, these results complement the WSL2 baseline by showing that the
  usefulness of this parallel implementation depends on the machine and
  workload size. The same benchmark configuration does not guarantee a
  speedup on every platform.

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
