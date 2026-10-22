# Machine Features

Every machine on which the benchmark is run must be described here to justify
the results. Collect the info with:

```bash
hostname
uname -srm
lscpu
free -h
```

## Machine 1 — draken (WSL2)

| Feature | Value |
|---|---|
| Host OS | Windows / WSL2 |
| Kernel | Linux 6.18.54.1-microsoft-standard-WSL2 x86_64 |
| CPU | 12th Gen Intel(R) Core(TM) i5-12450H |
| Cores / threads | 6 cores / 12 threads |
| Logical CPUs | 12 |
| RAM | 11 GiB |
| Compiler | `gcc` |
| Compiler flags | `-O0` (baseline Makefile), test `-O2`/`-O3` |

Notes: WSL2 shares CPU with the Windows host — background Windows load can
affect timings; prefer quiet periods and more repetitions.

## Machine 2 — (name)

| Feature | Value |
|---|---|
| OS | ____________ |
| Kernel | ____________ |
| CPU | ____________ |
| Cores / threads | ____________ |
| RAM | ____________ |
| Compiler | ____________ |

## Machine 3 — (name)

| Feature | Value |
|---|---|
| OS | ____________ |
| Kernel | ____________ |
| CPU | ____________ |
| Cores / threads | ____________ |
| RAM | ____________ |
| Compiler | ____________ |
