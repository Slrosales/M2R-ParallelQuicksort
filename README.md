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

Build and run one instance:

```bash
make -C src/
./src/parallelQuicksort 1000000
```

## Running the benchmark

Always smoke-test before a full run:

```bash
LC_ALL=C REPS=2 ./scripts/run_benchmarking.sh 1000 10000 100000 1000000
```

Then run the full benchmark (default sizes `100 ... 10000000`, 10 repetitions):

```bash
LC_ALL=C REPS=10 ./scripts/run_benchmarking.sh
```

`REPS` sets the number of repetitions; positional arguments override the default
sizes. `LC_ALL=C` keeps the `lscpu | grep` metadata extraction working under
`set -o pipefail`.

After a run, check that no sort failed and that every repetition is present:

```bash
ls data/$(hostname)_$(date +%F)/
grep -R "Oops" data/$(hostname)_$(date +%F)/ || echo "no sorting failures"
```

Notes:

- Results go to `data/<machine>_<date>/measurements_<HH:MM>.txt`. The filename
  has minute resolution, so do not launch two runs in the same minute.
- Keep the raw `.txt` file: it contains the machine and run metadata as `#`
  lines.
- The script randomizes the `(size, repetition)` order only. Within a process
  the algorithms still run Sequential -> Parallel -> libc.
- `THREAD_LEVEL` and the optimization level are compile-time settings
  (`src/parallelQuicksort.c`, `src/Makefile`). Record them with the results.
- On WSL2, close heavy applications and repeat the session; the CPU is shared
  with Windows.
- Do not modify `data/sama_2014-10-13/`, which is the reference dataset.
- Record the environment if the script does not: `gcc --version | head -1` and
  `git rev-parse --short HEAD`.

## Parsing results

Parse raw output into long-format CSV:

```bash
perl scripts/csv_quicksort_extractor.pl < data/$(hostname)_$(date +%F)/measurements_HH:MM.txt \
  > data/$(hostname)_$(date +%F)/measurements_HH:MM.csv
```

## Rendering the analysis

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
