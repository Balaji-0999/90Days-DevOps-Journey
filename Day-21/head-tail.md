# `head` and `tail` Commands in Linux: A DevOps Guide

The `head` and `tail` commands are among the most frequently used Linux commands in DevOps and System Administration.

They help engineers quickly inspect files, analyze logs, and troubleshoot production issues without opening entire files.

> Think of them like this:
>
> * `head` → "Show me how the file starts."
> * `tail` → "Show me how the file ends."
> * `tail -f` → "Keep showing me what's happening right now."

---

## What is `head`?

The `head` command displays the first 10 lines of a file by default.

### Syntax

```bash
head [OPTION] file
```

---

## Basic Example

### File: `users.txt`

```text
Raj
Amit
Rohit
Zoya
Ankit
Neha
Priya
Rahul
Simran
Arjun
Karan
```

### Command

```bash
head users.txt
```

### Output

```text
Raj
Amit
Rohit
Zoya
Ankit
Neha
Priya
Rahul
Simran
Arjun
```

### Logic

```text
head
  ↓
Read file
  ↓
Display first 10 lines
```

---

## `head -10`

These two commands are identical:

```bash
head users.txt
```

```bash
head -10 users.txt
```

### Meaning

```text
-10 = Show first 10 lines
```

---

## More Examples

### Show First 5 Lines

```bash
head -5 users.txt
```

### Output

```text
Raj
Amit
Rohit
Zoya
Ankit
```

---

### Show First 20 Lines

```bash
head -20 app.log
```

---

## Why is `head` Important?

Imagine a log file with:

```text
1,000,000 lines
```

Instead of opening the entire file:

```bash
cat app.log
```

Use:

```bash
head app.log
```

This helps you:

* Preview files quickly.
* Verify CSV data.
* Inspect configuration files.
* Check the beginning of log files.

---

## Production Example

```bash
head /var/log/syslog
```

### Output

```text
Jul 27 System Started
Jul 27 SSH Started
Jul 27 Docker Started
```

---

## What is `tail`?

The `tail` command displays the last 10 lines of a file.

### Syntax

```bash
tail [OPTION] file
```

---

## Example

```bash
tail users.txt
```

### Output

```text
Amit
Rohit
Zoya
Ankit
Neha
Priya
Rahul
Simran
Arjun
Karan
```

### Logic

```text
tail
  ↓
Go to the end of the file
  ↓
Display the last 10 lines
```

---

## Why is `tail` Important?

Most applications continuously append logs to the bottom of a file.

That means the latest events are almost always found at the end.

Instead of:

```bash
cat app.log
```

Use:

```bash
tail app.log
```

---

## `tail -100`

Display the last 100 lines.

```bash
tail -100 app.log
```

### Use Cases

* Review recent application activity.
* Inspect the latest errors.
* Analyze recent deployments.

---

## `tail -f`

This is one of the most important Linux commands for DevOps Engineers.

### Syntax

```bash
tail -f file
```

### Meaning

```text
-f = Follow
```

The command continuously watches the file and prints new lines as they are added.

---

## Example

### Terminal 1

```bash
tail -f app.log
```

### Terminal 2

```bash
echo "ERROR: Database Timeout" >> app.log
```

### Output

```text
ERROR: Database Timeout
```

Add another line:

```bash
echo "INFO: Connected Successfully" >> app.log
```

### Output

```text
INFO: Connected Successfully
```

---

## Logic

```text
tail -f
     ↓
Open file
     ↓
Wait for changes
     ↓
Print new entries immediately
```

---

## Production Story

Imagine it's **2:00 AM**.

Your phone rings.

> "Users cannot log in to the application."

You connect to the production server and immediately run:

```bash
tail -f /var/log/app.log
```

### Output

```text
INFO User Login Attempt
ERROR Database Connection Failed
ERROR Database Connection Failed
ERROR Database Connection Failed
```

Within a few seconds, you've identified the issue:

> The application cannot connect to the database.

This is exactly why `tail -f` is used every day in production environments.

---

## `tail -f` with `grep`

Monitor only error messages:

```bash
tail -f app.log | grep ERROR
```

### Output

```text
ERROR Database Timeout
ERROR Connection Refused
```

### Why?

Useful for:

* Monitoring failures.
* Watching critical events.
* Troubleshooting incidents.

---

## `tail -f` with `awk`

```bash
tail -f app.log | awk '{print $3}'
```

Example Output:

```text
Database
Connection
```

Useful for real-time log parsing.

---

## `head` vs `tail`

| Command   | Purpose                   |
| --------- | ------------------------- |
| `head`    | Display beginning of file |
| `tail`    | Display end of file       |
| `tail -f` | Monitor file continuously |

---

## Common DevOps Use Cases

| Command     | Use Case                   |
| ----------- | -------------------------- |
| `head`      | Preview files              |
| `head -20`  | Check first 20 log entries |
| `tail`      | View latest entries        |
| `tail -100` | Review recent logs         |
| `tail -f`   | Real-time monitoring       |

---

## Real Production Commands

```bash
head /etc/passwd

head -20 app.log

tail app.log

tail -100 /var/log/syslog

tail -f /var/log/nginx/access.log

tail -f /var/log/nginx/error.log

tail -f app.log | grep ERROR
```

---

## Shell Script Example

```bash
#!/bin/bash

echo "Recent Application Errors"

tail -50 app.log | grep ERROR
```

### Example Output

```text
ERROR Database Timeout
ERROR Connection Refused
ERROR Service Unavailable
```

---

## Why `head` and `tail` Matter in DevOps

DevOps Engineers use these commands to:

* Inspect large files quickly.
* Analyze logs.
* Monitor production systems.
* Troubleshoot incidents.
* Verify deployments.
* Monitor services in real time.
* Investigate application failures.

---

## Interview Question

> Why is `tail -f` important in DevOps?

### Answer

> "`tail -f` allows DevOps engineers to monitor log files in real time. It is widely used during production incidents, deployments, and troubleshooting to observe application behavior as it happens."

---

## Golden Rules

```bash
head file           # First 10 lines
head -20 file       # First 20 lines

tail file           # Last 10 lines
tail -100 file      # Last 100 lines
tail -f file        # Follow file in real time
```

---

## Final Logic

```text
head     -> Beginning of a file
tail     -> End of a file
tail -f  -> Keep watching the file
```

If `grep` is the command used to search logs, then `tail -f` is the command used to watch production systems live.

Mastering these commands will make you significantly more effective at Linux administration, shell scripting, and DevOps troubleshooting.

