# Day 18 – Shell Scripting: Functions & Intermediate Concepts

## Scripts Created

- functions.sh
- disk_check.sh
- strict_demo.sh
- local_demo.sh
- system_info.sh

## Commands Used

- function_name()
- local
- set -euo pipefail
- df -h
- free -h
- du
- ps aux
- uptime
- hostname

## What I Learned

- Functions make Bash scripts modular, reusable, and easier to maintain.
- `set -euo pipefail` makes scripts safer by stopping execution on errors and catching undefined variables.
- Local variables prevent accidental changes outside a function, making scripts more reliable.

## Why It Matters in Production

- Functions simplify large automation scripts.
- Strict mode prevents failed or partial deployments.
- Modular scripts are easier to debug, update, and reuse across multiple servers..
