# Parallel Quicksort — TODO

Mark tasks as `[x]` when done and note who did what in `journal.md`.
Debrief is during **lecture 6 (12/11/26)**.

## 0. Setup
- [ ] Fork https://github.com/alegrand/M2R-ParallelQuicksort (public) and
      keep the GPL-2.0 license + original authors (Joshua Stough, Arnaud Legrand).
- [ ] Compile the baseline: `make -C src/`
- [ ] Validate the code runs: `./src/parallelQuicksort 1000000` (check "did not get sorted" never appears).

## 1. Experimental design (improve vs the reference)
- [ ] Increase **number of repetitions** (5 -> 10/30).
- [ ] Widen **range of sizes** (add finer points, e.g. 5e5, 2e6, 5e6, 1e7).
- [ ] Randomize **order of runs** (see `scripts/run_benchmarking.sh`, uses `shuf`).
- [ ] Record the **compiler flags** used (note: baseline Makefile uses `-O0`; test `-O2`/`-O3` too).

## 2. Machines (run on several)
- [ ] Machine 1: WSL2 — 12th Gen Intel Core i5-12450H, 6c/12t, 11 GiB (draken)
- [ ] Machine 2: (name / specs) — assigned to: ____________
- [ ] Machine 3: (name / specs) — assigned to: ____________
- [ ] Fill `machines.md` for every machine used (justification of results).

## 3. Data collection
- [ ] Run benchmark on each machine: `./scripts/run_benchmarking.sh`
- [ ] Store raw output in `data/<machine>_<date>/` (already automated).
- [ ] Parse raw `.txt` -> long CSV: `perl scripts/csv_quicksort_extractor.pl < ...txt > ...csv`

## 4. Analysis (R Markdown in `Experiment/analysis.Rmd`)
- [ ] Mean + 95% confidence interval per (size, algorithm).
- [ ] `ggplot2` figures (log-log) with CI ribbons — replace base R / gnuplot.
- [ ] Fit a scaling trend (n·log n) and **extrapolate** beyond measured sizes.
- [ ] Speedup plot (Sequential / Parallel) to show the crossover point.

## 5. Comparison
- [ ] Compare our results with the reference `data/sama_2014-10-13` (parallel "worth it" above ~400000).

## 6. Group journal (`journal.md`)
- [ ] Every session: date, what was done, individual results of each member.

## 7. Deliverable
- [ ] Push everything to the public repo, share link on the Pad / Mattermost.
