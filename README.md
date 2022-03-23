# gradle-profiler-no-daemon-issue-sample

This is a simple multi-module project created with `gradle init`.

Relevant files:

- [`profile-out`](./profile-out): output of a profiler run with `--configuration-cache --dry-run`, which re-uses daemons even with `--no-daemon`
- [`gradle-user-home-1`](./gradle-user-home-1): daemon log files that were present after that profiler run
---
- [`reproduce.sh`](./reproduce.sh): script showing how the issue can be reproduced. Also shows some cases with expected behavior to help narrow down the issue.
- [`reproduce.log`](./reproduce.log): output of a `reproduce.sh` run, so you don't have to run it yourself.
