# Linux Text Processing Commands for DevOps: `grep`, `sort`, `uniq`, and `wc`

These four commands are part of the Linux and DevOps toolkit. They are frequently used together with pipes (`|`) to filter, organize, and analyze data.

```bash
command1 | command2 | command3
```

Pipeline Logic:

> Generate Output → Filter Data → Arrange Data → Count Results

---

## Table of Contents

* `grep` - Search Text
* `sort` - Arrange Data
* `uniq` - Remove Duplicate Entries
* `wc` - Count Lines, Words, and Characters
* Combining Commands
* Real-World DevOps Examples

---

## 1. grep

### Meaning

> Global Regular Expression Print

`grep` is used to search for patterns or text within files.

### Example

```bash
cat users.txt
```

```text
root
ubuntu
nginx
jenkins
```

Search for `ubuntu`:

```bash
grep "ubuntu" users.txt
```

### Output

```text
ubuntu
```

### Common Options

#### Ignore Case

```bash
grep -i "ROOT" users.txt
```

Output:

```text
root
```

#### Show Line Numbers

```bash
grep -n "nginx" users.txt
```

Output:

```text
3:nginx
```

#### Invert Match

```bash
grep -v "root" users.txt
```

Output:

```text
ubuntu
nginx
jenkins
```

### DevOps Examples

```bash
grep "Failed" /var/log/auth.log
```

Find failed login attempts.

```bash
grep "error" /var/log/nginx/error.log
```

Find NGINX errors.

---

## 2. sort

### Meaning

> Arrange data in ascending or descending order.

### Example

```bash
cat names.txt
```

```text
Raj
Amit
Rohit
Ankit
```

```bash
sort names.txt
```

### Output

```text
Amit
Ankit
Raj
Rohit
```

### Reverse Sort

```bash
sort -r names.txt
```

Output:

```text
Rohit
Raj
Ankit
Amit
```

### Numeric Sort

```bash
cat marks.txt
```

```text
10
5
100
50
```

```bash
sort -n marks.txt
```

Output:

```text
5
10
50
100
```

### Human-Readable Sort

```bash
du -sh * | sort -hr
```

Output:

```text
5G logs
2G backup
500M data
```

Useful for identifying directories consuming the most disk space.

---

## 3. uniq

### Meaning

> Remove consecutive duplicate lines.

### Example

```bash
cat file.txt
```

```text
apple
apple
banana
banana
banana
orange
```

```bash
uniq file.txt
```

### Output

```text
apple
banana
orange
```

### Important Note

`uniq` only removes duplicates that appear consecutively.

```text
apple
banana
apple
```

```bash
uniq file.txt
```

Output:

```text
apple
banana
apple
```

Therefore, it is commonly used with `sort`:

```bash
sort file.txt | uniq
```

### Count Duplicate Entries

```bash
sort file.txt | uniq -c
```

Output:

```text
2 apple
3 banana
1 orange
```

### DevOps Example

```bash
awk '{print $1}' access.log | sort | uniq -c
```

Output:

```text
120 192.168.1.1
50 192.168.1.2
```

This helps identify the most frequent IP addresses in server logs.

---

## 4. wc

### Meaning

> Word Count

The `wc` command counts lines, words, and characters.

### Example

```bash
cat notes.txt
```

```text
Hello Linux
Welcome to DevOps
```

### Count Lines

```bash
wc -l notes.txt
```

Output:

```text
2 notes.txt
```

### Count Words

```bash
wc -w notes.txt
```

Output:

```text
5 notes.txt
```

Word Breakdown:

1. Hello
2. Linux
3. Welcome
4. to
5. DevOps

### Count Characters

```bash
wc -c notes.txt
```

Output:

```text
31 notes.txt
```

### Display All Counts

```bash
wc notes.txt
```

Output:

```text
2 5 31 notes.txt
```

| Value     | Description      |
| --------- | ---------------- |
| 2         | Lines            |
| 5         | Words            |
| 31        | Characters/Bytes |
| notes.txt | File Name        |

---

## Combining All Four Commands

Given the following file:

```text
root
ubuntu
ubuntu
nginx
jenkins
ubuntu
```

Command:

```bash
grep "ubuntu" users.txt | sort | uniq | wc -l
```

### Step 1: grep

```text
ubuntu
ubuntu
ubuntu
```

### Step 2: sort

```text
ubuntu
ubuntu
ubuntu
```

### Step 3: uniq

```text
ubuntu
```

### Step 4: wc -l

```text
1
```

---

## Real-World DevOps Examples

### Top 5 Memory Consumers

```bash
ps aux --sort=-%mem | head -5
```

### Count Logged-in Users

```bash
who | wc -l
```

### Find Failed SSH Attempts

```bash
grep "Failed password" /var/log/auth.log
```

### Find Unique IP Addresses

```bash
awk '{print $1}' access.log | sort | uniq
```

### Count Unique IP Addresses

```bash
awk '{print $1}' access.log | sort | uniq | wc -l
```

### Find Most Frequent IP Addresses

```bash
awk '{print $1}' access.log | sort | uniq -c | sort -nr
```

Output:

```text
150 192.168.1.10
80 192.168.1.5
20 192.168.1.8
```

---

## Golden Rule

| Command | Purpose           |
| ------- | ----------------- |
| `grep`  | Find data         |
| `sort`  | Arrange data      |
| `uniq`  | Remove duplicates |
| `wc`    | Count data        |

Pipeline Logic:

```bash
grep | sort | uniq | wc
```

```text
Find → Arrange → Remove Duplicates → Count
```

---

## Conclusion

The combination of `grep`, `sort`, `uniq`, and `wc` is extremely powerful for Linux administration, shell scripting, log analysis, and DevOps workflows.

Mastering these commands will help you efficiently analyze users, processes, logs, metrics, and system information on any Linux server.

Happy Learning!

