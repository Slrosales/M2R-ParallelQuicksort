# data/

Raw experimental results and parsed CSV files.

## Layout

    data/<machine>_<date>/measurements_<HH:MM>.txt   # raw output
    data/<machine>_<date>/measurements_<HH:MM>.csv   # long format: Size, Type, Time

The benchmark script `scripts/run_benchmarking.sh` creates the directory and the
raw `.txt` file automatically, and records machine metadata as `#` comments.
Parse the raw output into long-format CSV with:

```bash
perl scripts/csv_quicksort_extractor.pl < data/<machine>_<date>/measurements_<HH:MM>.txt \
    > data/<machine>_<date>/measurements_<HH:MM>.csv
```

`scripts/csv_quicksort_extractor2.pl` produces the legacy wide format
(`Size, Seq, Par, Libc`) used by the gnuplot section of `journal.org`.

## Reference dataset

`data/sama_2014-10-13/` is the original dataset from the reference project,
kept for comparison. It contains the raw text, long and wide CSV files, and the
two plots referenced in `journal.org`.
