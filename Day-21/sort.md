# Linux `sort` Command - Complete Guide for DevOps

The `sort` command is one of the most important text-processing utilities in Linux. It is widely used in DevOps to organize and analyze logs, reports, CPU usage, memory usage, user lists, and CSV data.

---

## What is `sort`?

> The `sort` command arranges lines of text in alphabetical or numerical order.

### Syntax

```bash
sort [OPTION] file
```

---

## 1. Basic `sort`

### File: `names.txt`

```text
Rohit
Amit
Raj
Zoya
```

### Command

```bash
sort names.txt
```

### Output

```text
Amit
Raj
Rohit
Zoya
```

### Logic

By default, `sort` performs alphabetical sorting (A → Z).

```text
A
B
C
...
Z
```

### DevOps Use Cases

- Sort usernames
- Sort service names
- Sort log entries

---

## 2. Reverse Sort (`-r`)

### Command

```bash
sort -r names.txt
```

### Output

```text
Zoya
Rohit
Raj
Amit
```

### Logic

```text
Z → A
```

Instead of ascending order, `-r` sorts data in descending order.

### DevOps Example

#### File: `services.txt`

```text
nginx
docker
jenkins
kubernetes
```

#### Command

```bash
sort -r services.txt
```

#### Output

```text
kubernetes
nginx
jenkins
docker
```

Useful when you want the latest or highest values at the top.

---

## 3. Numeric Sort (`-n`)

### File: `salary.txt`

```text
100
50
500
20
```

### Command

```bash
sort -n salary.txt
```

### Output

```text
20
50
100
500
```

### Why Use `-n`?

Without `-n`:

```bash
sort salary.txt
```

Output:

```text
100
20
50
500
```

### Logic

By default, `sort` treats everything as text.

```text
100  -> Starts with 1
20   -> Starts with 2
50   -> Starts with 5
```

Therefore:

```text
1 < 2 < 5
```

With `-n`, Linux understands the values as numbers:

```text
20 < 50 < 100 < 500
```

---

## 4. Human-Readable Sort (`-h`)

### Example

```bash
du -sh *
```

### Output

```text
5M logs
2G backup
500M data
```

### Command

```bash
du -sh * | sort -h
```

### Output

```text
5M logs
500M data
2G backup
```

### Logic

`-h` understands:

| Unit | Meaning |
|------|---------|
| K | Kilobytes |
| M | Megabytes |
| G | Gigabytes |
| T | Terabytes |

Without `-h`, Linux would sort these values as plain text.

---

## 5. Sorting CPU Usage

### Command

```bash
ps aux | sort -nr -k3
```

### Logic

```text
-n   -> Numeric sort
-r   -> Reverse order
-k3  -> Sort by the 3rd column (%CPU)
```

### Meaning

> Display processes consuming the highest CPU first.

---

## 6. Sorting Memory Usage

### File: `memory.txt`

```text
500
100
900
200
```

### Command

```bash
sort -nr memory.txt
```

### Output

```text
900
500
200
100
```

This displays memory usage from highest to lowest.

---

## 7. Sorting Linux Users

### Command

```bash
cut -d ":" -f1 /etc/passwd | sort
```

### Example Output

```text
adm
daemon
root
ubuntu
```

---

## 8. Finding Largest Directories

### Command

```bash
du -sh * | sort -hr
```

### Output

```text
5G backup
2G logs
500M data
```

### Logic

```text
-h -> Human-readable sorting
-r -> Reverse order
```

### Meaning

> Display the largest directories first.

This is one of the most commonly used DevOps commands for troubleshooting disk space issues.

---

## 9. Using `sort` in Shell Scripts

### Example

```bash
#!/bin/bash

echo "Top 5 Largest Directories"

du -sh * | sort -hr | head -5
```

### Example Output

```text
10G backups
5G logs
2G docker
500M app
100M temp
```

### Why?

Useful for detecting storage problems on Linux servers.

---

## 10. Combining `sort` with Other Commands

### `sort` + `uniq`

#### File

```text
nginx
docker
nginx
jenkins
```

#### Command

```bash
sort file | uniq
```

#### Output

```text
docker
jenkins
nginx
```

---

### `sort` + `wc`

```bash
sort users.txt | wc -l
```

Counts the number of lines.

---

### `sort` + `grep`

```bash
grep ERROR app.log | sort
```

Sort all error messages alphabetically.

---

### `sort` + `head`

```bash
sort -nr numbers.txt | head -3
```

#### Output

```text
900
800
700
```

Displays the top three values.

---

## Most Important Options

| Option | Description |
|--------|-------------|
| `sort` | Alphabetical sorting |
| `sort -r` | Reverse sorting |
| `sort -n` | Numeric sorting |
| `sort -nr` | Numeric sorting (highest first) |
| `sort -h` | Human-readable sorting (K, M, G, T) |
| `sort -u` | Remove duplicate entries |
| `sort -k` | Sort by a specific column |
| `sort -M` | Sort month names |
| `sort -V` | Version sorting |

---

## Why `sort` Matters in DevOps

| Task | Command |
|------|---------|
| Sort usernames | `sort` |
| Find largest files | `sort -hr` |
| Find highest CPU usage | `sort -nr -k3` |
| Find highest memory usage | `sort -nr` |
| Remove duplicates | `sort -u` |
| Sort CSV columns | `sort -k2` |
| Sort software versions | `sort -V` |
| Sort monthly reports | `sort -M` |

---

## Interview Question

### Why is `sort` Important in DevOps?

> The `sort` command is used to organize and analyze data efficiently. In DevOps, it helps process logs, identify top resource consumers, sort reports, remove duplicate entries, and automate monitoring tasks within shell scripts.

---

## Golden Rules

```bash
sort file            # A-Z
sort -r file         # Z-A
sort -n file         # Small to large
sort -nr file        # Large to small
sort -hr file        # Human-readable sizes
sort -u file         # Unique entries
sort -k2 file        # Sort by second column
```

---

## Final Logic

```text
sort      -> Alphabetical sorting
sort -r   -> Reverse alphabetical sorting
sort -n   -> Numeric sorting
sort -nr  -> Highest number first
sort -h   -> Human-readable size sorting
```

---

## Common DevOps Commands

```bash
du -sh * | sort -hr
ps aux | sort -nr -k3
cut -d ":" -f1 /etc/passwd | sort
grep ERROR app.log | sort
```

Mastering `sort` and combining it with tools like `grep`, `cut`, `awk`, `uniq`, `head`, and `wc` is essential for Linux, Shell Scripting, and DevOps automation.
