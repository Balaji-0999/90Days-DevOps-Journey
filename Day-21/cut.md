# Mastering the `cut` Command in Linux

The `cut` command is a lightweight and efficient text-processing utility used to extract specific portions of text from files or command output. It is widely used in Linux, Shell Scripting, and DevOps for processing logs, CSV files, system files, and automation scripts.

## Why is `cut` Important in DevOps?

`cut` is commonly used to:

* Parse `/etc/passwd`
* Process CSV files
* Extract log information
* Generate monitoring reports
* Automate shell scripts
* Work with command pipelines (`grep`, `sort`, `uniq`, `wc`, etc.)

---

## Syntax

```bash
cut [OPTION]... [FILE]
```

### Golden Formula

```bash
cut -d "DELIMITER" -f FIELD FILE
```

| Option         | Description                        |
| -------------- | ---------------------------------- |
| `-d`           | Specify the delimiter.             |
| `-f`           | Select field number(s).            |
| `-c`           | Extract characters by position.    |
| `-b`           | Extract bytes by position.         |
| `--complement` | Exclude specified fields.          |
| `-s`           | Suppress lines without delimiters. |

---

## Sample File

`users.txt`

```text
raj:devops:50000
amit:sre:60000
rohit:cloud:70000
```

---

## 1. Delimiter (`-d`)

Specify the character used to separate fields.

```bash
cut -d ":" -f1 users.txt
```

### Output

```text
raj
amit
rohit
```

---

## 2. Field Selection (`-f`)

Extract a specific field.

```bash
cut -d ":" -f2 users.txt
```

### Output

```text
devops
sre
cloud
```

---

## 3. Multiple Fields

```bash
cut -d ":" -f1,3 users.txt
```

### Output

```text
raj:50000
amit:60000
rohit:70000
```

### Visualization

```text
raj:devops:50000
f1    f2      f3
```

---

## 4. Field Ranges

### Specific Range

```bash
cut -d ":" -f1-2 users.txt
```

### Output

```text
raj:devops
amit:sre
rohit:cloud
```

### Open Range

#### From Field 2 to the End

```bash
cut -d ":" -f2- users.txt
```

#### Output

```text
devops:50000
sre:60000
cloud:70000
```

#### From Beginning to Field 2

```bash
cut -d ":" -f-2 users.txt
```

#### Output

```text
raj:devops
amit:sre
rohit:cloud
```

---

## 5. Character Extraction (`-c`)

Extract characters based on position.

File:

```text
RajKumar
```

```bash
cut -c1-3 file
```

Output:

```text
Raj
```

```bash
cut -c4-8 file
```

Output:

```text
Kumar
```

### Use Cases

* Extract timestamps
* Parse fixed-width reports

---

## 6. Byte Extraction (`-b`)

```bash
cut -b1-5 file
```

Output:

```text
RajKu
```

> Note: For ASCII files, `-b` and `-c` often produce the same result.

---

## 7. Excluding Fields (`--complement`)

Exclude the specified field(s) and print everything else.

```bash
cut -d ":" -f2 --complement users.txt
```

### Output

```text
raj:50000
amit:60000
rohit:70000
```

### Visualization

```text
raj:devops:50000
     XXXXX
```

> `--complement` means: "Print everything except the specified field(s)."

---

## 8. Custom Output Delimiter

```bash
cut -d ":" -f1,2 --output-delimiter=" | " users.txt
```

### Output

```text
raj | devops
amit | sre
rohit | cloud
```

---

## 9. Suppress Invalid Lines (`-s`)

File:

```text
raj:devops
amit:sre
hello
```

```bash
cut -d ":" -f1 -s file
```

### Output

```text
raj
amit
```

Without `-s`:

```text
raj
amit
hello
```

> Useful when working with inconsistent log files.

---

## 10. Combining `cut` with Other Commands

### With `grep`

```bash
grep "ERROR" app.log | cut -d ":" -f2
```

---

### With `sort`

```bash
cut -d ":" -f2 users.txt | sort
```

---

### With `uniq`

```bash
cut -d ":" -f2 file | sort | uniq
```

---

### With `wc`

Count Linux users:

```bash
cut -d ":" -f1 /etc/passwd | wc -l
```

---

## 11. Shell Script Example

```bash
#!/bin/bash

USER=$(cut -d ":" -f1 /etc/passwd | head -1)

echo "First user: $USER"
```

### Output

```text
First user: root
```

---

## 12. Real-World DevOps Examples

### Get Linux Usernames

```bash
cut -d ":" -f1 /etc/passwd
```

### Get User IDs (UIDs)

```bash
cut -d ":" -f3 /etc/passwd
```

### Get Home Directories

```bash
cut -d ":" -f6 /etc/passwd
```

### Get Login Shells

```bash
cut -d ":" -f7 /etc/passwd
```

### Parse CSV Files

```bash
cut -d "," -f1 employees.csv
```

### Extract IP Address

```bash
echo "192.168.1.10:8080" | cut -d ":" -f1
```

### Extract Port Number

```bash
echo "192.168.1.10:8080" | cut -d ":" -f2
```

---

## 13. Kubernetes Example

```bash
kubectl get pods --no-headers | cut -d " " -f1
```

Example Output:

[O```text
nginx-pod
redis-pod
jenkins-pod
```

> **Note:** `awk '{print $1}'` is generally preferred because command output may contain multiple spaces.

---

## 14. Docker Example

```bash
docker images | cut -d " " -f1
```

### Output

```text
ubuntu
nginx
redis
```

---

## 15. Understanding `/etc/passwd`

Example:

```text
root:x:0:0:root:/root:/bin/bash
```

### Field Mapping

```text
|     | | |    |      |
1     2 3 4    5      6          7
root:x:0:0:root:/root:/bin/bash
```

| Field | Description                |
| ----- | -------------------------- |
| 1     | Username                   |
| 2     | Password Placeholder (`x`) |
| 3     | UID                        |
| 4     | GID                        |
| 5     | User Description           |
| 6     | Home Directory             |
| 7     | Login Shell                |

---

## Most Useful DevOps Commands

| Command                            | Purpose              |
| ---------------------------------- | -------------------- |
| `cut -d ":" -f1 /etc/passwd`       | Get usernames        |
| `cut -d ":" -f3 /etc/passwd`       | Get UIDs             |
| `cut -d ":" -f6 /etc/passwd`       | Get home directories |
| `cut -d ":" -f7 /etc/passwd`       | Get login shells     |
| `cut -d "," -f1 file.csv`          | Parse CSV files      |
| `cut -c1-5 file`                   | Extract characters   |
| `cut -b1-3 file`                   | Extract bytes        |
| `cut -d ":" -f2 --complement file` | Exclude a field      |
| `cut ... \| sort \| uniq`          | Remove duplicates    |
| `cut ... \| wc -l`                 | Count entries        |

---

## Interview Question

### Q: Why is the `cut` command important in DevOps?

> The `cut` command is a fast and lightweight text-processing utility used to extract specific fields, characters, or bytes from structured data. It is commonly used in DevOps for parsing system files such as `/etc/passwd`, processing logs, reading CSV reports, and building automation scripts.

---

## Key Takeaways

* `cut` is best suited for structured data.
* It works efficiently with delimiters such as `:`, `,`, and tabs.
* It integrates well with `grep`, `sort`, `uniq`, and `wc`.
* It is frequently used in Shell Scripting and DevOps automation.
* For variable whitespace, prefer `awk` over `cut`.

Happy Learning!

