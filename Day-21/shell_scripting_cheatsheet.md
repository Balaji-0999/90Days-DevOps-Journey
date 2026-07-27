# Shell Scripting Foundations for DevOps

Shell scripting is one of the most important skills for every DevOps Engineer. Whether you're automating backups, monitoring servers, deploying applications, or troubleshooting production issues, these concepts are used every day.

This guide covers the fundamental building blocks of Shell Scripting that every DevOps Engineer should master:

* Variables
* Arguments
* Conditional Statements
* Loops
* Functions
* `grep`
* `awk`
* `sed`

> If Linux commands are the tools of DevOps, then Variables, Arguments, If Statements, Loops, Functions, Grep, AWK, and Sed are the building blocks of every production shell script.

---

## Quick Reference Table

| Topic        | Key Syntax          | Example                            |
| ------------ | ------------------- | ---------------------------------- |
| Variable     | `VAR="value"`       | `NAME="Raj"`                       |
| Argument     | `$1`                | `./script.sh Docker`               |
| If Statement | `if [ condition ]`  | `if [ -f file ]`                   |
| Loop         | `for i in list`     | `for i in 1 2 3`                   |
| Function     | `name() {}`         | `greet() {}`                       |
| Grep         | `grep pattern file` | `grep ERROR app.log`               |
| AWK          | `awk '{print $1}'`  | `awk -F: '{print $1}' /etc/passwd` |
| Sed          | `sed 's/old/new/g'` | `sed -i 's/foo/bar/g' file`        |

---

## 1. Variables

Variables are used to store data that can be reused throughout a script.

### Syntax

```bash id="j1p3ak"
VAR="value"
```

### Example

```bash id="6ulxik"
NAME="Raj"

echo $NAME
```

### Output

```text id="p9yr0u"
Raj
```

### Logic

```text id="bnp4au"
Variable
    ↓
Store value
    ↓
Reuse anywhere
```

### DevOps Example

```bash id="gmgfph"
LOG_DIR="/var/log"
BACKUP_DIR="/backup"
SERVICE="nginx"
```

### Why It Matters

Variables make scripts:

* Reusable
* Readable
* Maintainable
* Easy to update

---

## 2. Arguments

Arguments allow users to pass values to scripts.

### Syntax

```bash id="6f1kz5"
$1
$2
$3
```

### Meaning

| Symbol | Meaning                     |
| ------ | --------------------------- |
| `$1`   | First positional parameter  |
| `$2`   | Second positional parameter |
| `$3`   | Third positional parameter  |

### Example

```bash id="xmd71m"
./script.sh Docker Jenkins
```

Script:

```bash id="f1lx8w"
echo $1
echo $2
```

### Output

```text id="cb67yz"
Docker
Jenkins
```

### Logic

```text id="h7e0me"
User Input
     ↓
Script receives it
     ↓
Process value
```

### Why It Matters

Production scripts should be dynamic.

Instead of:

```bash id="mq5q4w"
systemctl restart nginx
```

Use:

```bash id="8g5bjp"
systemctl restart "$1"
```

Run:

```bash id="uf0qzy"
./restart.sh nginx
./restart.sh docker
```

---

## 3. If Statements

Conditional statements are used to make decisions.

### Syntax

```bash id="1r5o3j"
if [ condition ]
then
    command
fi
```

### Example

```bash id="8qaq4v"
if [ -f file.txt ]
then
    echo "File Exists"
fi
```

### Breakdown

| Part   | Meaning              |
| ------ | -------------------- |
| `if`   | Start condition      |
| `-f`   | Check if file exists |
| `then` | Execute commands     |
| `fi`   | End of if block      |

### Logic

```text id="6o4ecm"
Condition True?
      ↓
YES → Execute
NO  → Skip
```

### Production Example

```bash id="jbn1tz"
if [ ! -d backups ]
then
    mkdir backups
fi
```

### Why It Matters

DevOps automation depends on decisions:

* Is the server running?
* Is disk space available?
* Does the backup exist?
* Has the deployment succeeded?

---

## 4. Loops

Loops are used to execute commands repeatedly.

### Syntax

```bash id="8h6i6d"
for i in list
do
    command
done
```

### Example

```bash id="3g3j0o"
for i in 1 2 3
do
    echo $i
done
```

### Output

```text id="vwiv1u"
1
2
3
```

### Logic

```text id="sj34uw"
Take item
    ↓
Execute command
    ↓
Move to next item
    ↓
Repeat
```

### Production Example

```bash id="g1z0bh"
for server in app1 app2 app3
do
    ping $server
done
```

### Why It Matters

Automation relies heavily on loops.

Without loops:

```bash id="b9a8bm"
systemctl restart app1
systemctl restart app2
systemctl restart app3
```

With loops:

```bash id="x8a6or"
for app in app1 app2 app3
do
    systemctl restart $app
done
```

---

## 5. Functions

Functions help organize and reuse code.

### Syntax

```bash id="tdqv6m"
name() {
    commands
}
```

### Example

```bash id="d9lk7x"
greet() {
    echo "Hello"
}

greet
```

### Output

```text id="93jlwm"
Hello
```

### Logic

```text id="30vhqb"
Write once
    ↓
Call many times
```

### Production Example

```bash id="nfe20m"
check_disk() {
    df -h
}

check_memory() {
    free -h
}
```

### Why It Matters

Functions:

* Reduce duplicate code
* Improve readability
* Simplify maintenance

---

## 6. Grep

### Full Form

```text id="n4jhrd"
Global Regular Expression Print
```

### Syntax

```bash id="oijq5n"
grep pattern file
```

### Example

```bash id="hlcyc8"
grep ERROR app.log
```

### Output

```text id="zw08ah"
ERROR Database Failed
ERROR Timeout
```

### Logic

```text id="9jlwmx"
Read file
    ↓
Find pattern
    ↓
Print matches
```

### Production Use Cases

```bash id="6y4mtr"
grep ERROR app.log
grep Failed auth.log
grep nginx syslog
```

### Why It Matters

Used for:

* Searching logs
* Finding failures
* Troubleshooting incidents
* Monitoring applications

---

## 7. AWK

### Full Form

Named after its creators:

```text id="bzfijm"
A -> Alfred Aho
W -> Peter Weinberger
K -> Brian Kernighan
```

### Syntax

```bash id="8p7zhq"
awk '{print $1}'
```

### Example

```bash id="it94gd"
awk '{print $1}' users.txt
```

### Output

```text id="hdt9z1"
Raj
Amit
```

### Using a Delimiter

```bash id="a1m0c8"
awk -F: '{print $1}' /etc/passwd
```

### Breakdown

| Part  | Meaning              |
| ----- | -------------------- |
| `-F:` | Use `:` as separator |
| `$1`  | First column         |

### Output

```text id="c3zq9d"
root
ubuntu
daemon
```

### Why It Matters

Useful for:

* Parsing logs
* Processing CSV files
* Extracting columns
* Generating reports

---

## 8. Sed

### Full Form

```text id="oixrns"
Stream Editor
```

### Syntax

```bash id="b8u7q5"
sed 's/old/new/g'
```

### Example

```bash id="2xjgbw"
sed -i 's/foo/bar/g' file.txt
```

### Breakdown

| Part  | Meaning                 |
| ----- | ----------------------- |
| `s`   | Substitute              |
| `foo` | Old text                |
| `bar` | New text                |
| `g`   | Replace all occurrences |
| `-i`  | Edit file directly      |

### Logic

```text id="o1dq0q"
Find text
    ↓
Replace text
    ↓
Save changes
```

### Production Example

```bash id="n9f7j1"
sed -i 's/http/https/g' nginx.conf
```

### Why It Matters

Used for:

* Updating configurations
* SSL migrations
* Bulk text replacements
* Infrastructure automation

---

## Real Production Script Example

```bash id="9u6xci"
#!/bin/bash

SERVICE=$1

if systemctl status "$SERVICE" >/dev/null
then
    echo "Service is running."
else
    echo "Service is stopped."
fi
```

### Run

```bash id="x3gyrq"
./check.sh nginx
```

### Concepts Used

```text id="j2q9k7"
Variable   -> SERVICE
Argument   -> $1
If         -> Conditional check
Function   -> Can organize code
Grep       -> Search logs
AWK        -> Parse output
Sed        -> Update configs
```

---

## Why These Concepts Matter in DevOps

| Topic         | Why It Matters            |
| ------------- | ------------------------- |
| Variables     | Store reusable values     |
| Arguments     | Make scripts dynamic      |
| If Statements | Decision making           |
| Loops         | Automate repetitive tasks |
| Functions     | Organize code             |
| Grep          | Search logs               |
| AWK           | Parse structured data     |
| Sed           | Edit files automatically  |

---

## Commands Used Daily in Production

```bash id="0nywkg"
grep ERROR app.log

awk -F: '{print $1}' /etc/passwd

sed -i 's/http/https/g' nginx.conf

for server in app1 app2 app3
do
    ping $server
done
```

---

## Interview Question

> What are the most important Shell Scripting concepts for DevOps?

### Answer

> Variables, arguments, conditional statements, loops, functions, and Linux text-processing tools such as `grep`, `awk`, and `sed` are essential for building production-ready automation scripts.

---

## Golden Rules

```bash id="63bch5"
VAR="value"

echo $1

if [ condition ]
then
fi

for i in list
do
done

function_name() {}

grep ERROR file

awk '{print $1}' file

sed -i 's/old/new/g' file
```

---

## Final Logic

```text id="mjlwmf"
Variables  -> Store data
Arguments  -> Receive input
If         -> Make decisions
Loops      -> Repeat tasks
Functions  -> Reuse code
Grep       -> Search
AWK        -> Parse
Sed        -> Edit
```

Master these concepts, and you'll be able to read, write, and troubleshoot most shell scripts used in Linux, automation, and production DevOps environments.

