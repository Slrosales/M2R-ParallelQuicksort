# M2R-ParallelQuicksort

Parallel quicksort benchmark for the SMPE 2026-2027 experimental-methodology
assignment (Homework 3 / lecture 3). The project starts from
[Arnaud Legrand's reference repository](https://github.com/alegrand/M2R-ParallelQuicksort)
and aims at improving its experimental methodology.

Original idea: teach 2nd-year master students how to improve their experimental
methodology through a small multi-threaded quicksort implementation.

## Structure

| Path | Purpose |
|---|---|
| `src/` | C implementation (sequential + Pthreads parallel + libc `qsort`) and Makefile |
| `scripts/` | Benchmark driver and CSV parsers |
| `data/` | Raw results, parsed CSV, and the reference `sama_2014-10-13` dataset |
| `Experiment/analysis.Rmd` | R Markdown analysis (ggplot, confidence intervals, trend, extrapolation) |
| `journal.org` | Reference lab notebook (original 2014 experiments) |
| `journal.md` | Group journal (sessions and individual contributions) |
| `machines.md` | Hardware/software description of every machine used |
| `TODO.md` | Task tracker |

## Quick start

```bash
make -C src/                          # compile
./src/parallelQuicksort 1000000       # single run
./scripts/run_benchmarking.sh         # full benchmark (randomized order)
```

Parse raw output into long-format CSV:

```bash
perl scripts/csv_quicksort_extractor.pl < data/<machine>_<date>/measurements_<HH:MM>.txt \
    > data/<machine>_<date>/measurements_<HH:MM>.csv
```

Render the analysis notebook from `Experiment/`:

```bash
Rscript -e 'rmarkdown::render("Experiment/analysis.Rmd")'
```

## Choices

- **Journal/docs**: Markdown for the group deliverables; the original Org journal
  is kept for reference.
- **Benchmark code**: C (that is what we measure; Pthreads parallelism).
- **Analysis**: R + R Markdown (`tidyverse`/`ggplot2`) as taught in the course.

## License

GPL-2.0. See [LICENSE](LICENSE). Original authors: Joshua Stough and
Arnaud Legrand.
