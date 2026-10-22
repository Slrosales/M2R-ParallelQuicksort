#!/usr/bin/env bash
# Parallel Quicksort benchmark.
# Improvements over the reference script:
#   - more sizes and more repetitions (configurable)
#   - randomized order of runs (avoids systematic bias: thermal state, cache)
#   - records machine info at the top of the output file
#
# Usage: ./scripts/run_benchmarking.sh [sizes...]
set -euo pipefail

SIZES="${*:-100 1000 10000 100000 1000000 5000000 10000000}"
REPS="${REPS:-10}"

OUTPUT_DIRECTORY="data/$(hostname)_$(date +%F)"
mkdir -p "$OUTPUT_DIRECTORY"
OUTPUT_FILE="$OUTPUT_DIRECTORY/measurements_$(date +%H:%M).txt"

# Machine / run metadata (lines starting with '#' are ignored by the parser).
{
  echo "# Machine: $(hostname)"
  echo "# Date:    $(date '+%F %T')"
  echo "# Kernel:  $(uname -srm)"
  echo "# CPU:     $(lscpu | grep 'Model name' | sed 's/^ *//')"
  echo "# CPUs:    $(lscpu | grep -E '^CPU\(s\):' | sed 's/^ *//')"
  echo "# Sizes:   $SIZES"
  echo "# Reps:    $REPS"
} > "$OUTPUT_FILE"

# Build the list of runs, then shuffle it to randomize execution order.
WORK=$(mktemp)
for size in $SIZES; do
  for rep in $(seq 1 "$REPS"); do
    echo "$size" >> "$WORK"
  done
done

shuf "$WORK" | while read -r size; do
  echo "Size: $size" >> "$OUTPUT_FILE"
  ./src/parallelQuicksort "$size" >> "$OUTPUT_FILE"
done
rm -f "$WORK"

echo "Done. Results in $OUTPUT_FILE"
