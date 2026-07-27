# Essential Linux Troubleshooting Commands for DevOps

This guide explains the most important Linux troubleshooting commands used by DevOps Engineers in production environments. You'll learn:

* Full form (if applicable)
* Meaning
* Logic
* Why it matters in DevOps
* Real-world examples
* Common use cases

---

# 1. `systemctl status`

## Full Form

```text id="hqh6zs"
systemctl = System Control
```

`systemctl` is used to manage services in systems that use `systemd`.

### Command

```bash id="v8c8eb"
systemctl status nginx
```

### Example Output

```text id="amjqwo"
● nginx.service - A high performance web server
   Active: active (running)
```

### Logic

```text id="ehop5v"
Service Name
      ↓
systemctl status nginx
      ↓
Is it running?
Is it stopped?
Did it fail?
```

### Why It Matters

* Check application status.
* Verify services after deployment.
* Troubleshoot failed services.

---

# 2. `journalctl`

## Full Form

```text id="s0dxgt"
journalctl = Journal Control
```

Reads logs from the `systemd` journal.

---

## View All Logs

```bash id="x5p4r2"
journalctl
```

---

## Show Recent Errors

```bash id="h2t2zu"
journalctl -xe
```

### Meaning

```text id="mn83kt"
-x = Explain errors
-e = Jump to latest logs
```

### DevOps Use

```text id="12n1zm"
Application crashes
      ↓
journalctl -xe
      ↓
Find the root cause
```

---

## Service-Specific Logs

```bash id="gbg7oz"
journalctl -u nginx
```

### Meaning

```text id="nuhm0y"
-u = Unit (service)
```

Shows logs only for the specified service.

---

## Real-Time Logs

```bash id="25x14v"
journalctl -f
```

### Meaning

```text id="ryzqvl"
-f = Follow logs
```

Equivalent to:

```bash id="z9kqdd"
tail -f
```

---

# 3. `df -h`

## Full Form

```text id="ysgw9r"
df = Disk Filesystem
```

Displays filesystem usage.

### Command

```bash id="m9yb0r"
df -h
```

### Example Output

```text id="nhv9ik"
Filesystem      Size Used Avail Use%
/dev/xvda1       30G  20G   10G  67%
```

### Meaning

```text id="d1lkux"
-h = Human readable
```

### Why It Matters

```text id="r1yrbe"
No space left on device
        ↓
Run:
df -h
```

One of the first commands used during production incidents.

---

# 4. `free -h`

## Full Form

```text id="x9l2q5"
free = Display free and used memory
```

### Command

```bash id="0qwxkg"
free -h
```

### Example Output

```text id="dk6r7p"
Mem: 16G
Used: 10G
Free: 6G
```

### Why It Matters

Helps identify:

* Memory leaks
* High RAM usage
* Out-of-memory issues

---

# 5. `top`

## Full Form

```text id="u3v2gb"
top = Table Of Processes
```

### Command

```bash id="1oqmq1"
top
```

### Purpose

Shows:

* CPU usage
* Memory usage
* Running processes

### DevOps Use

```text id="x9pq79"
Server is slow
      ↓
Run top
      ↓
Identify high CPU process
```

---

# 6. `htop`

## Full Form

```text id="gk24kq"
htop = Interactive Process Viewer
```

### Install

```bash id="wyib6h"
sudo apt install htop
```

### Why Use It?

* Easier to read than `top`
* Interactive interface
* Search and kill processes

---

# 7. `ps aux`

## Meaning

```text id="69l3jl"
ps = Process Status

a = All users
u = User-oriented format
x = Include background processes
```

### Command

```bash id="1ch2dq"
ps aux
```

### Example

```text id="dwwm3l"
root      nginx
ubuntu    docker
```

### Why It Matters

Used to:

* Find processes
* Check resource usage
* Identify stuck applications

---

# 8. `ss -tulnp`

## Full Form

```text id="j9jltt"
ss = Socket Statistics
```

### Options

```text id="zjlwmn"
-t = TCP
-u = UDP
-l = Listening
-n = Numeric
-p = Process
```

### Command

```bash id="5tpf0t"
ss -tulnp
```

### Example

```text id="o0ezgc"
tcp LISTEN 0 80 nginx
```

### Why It Matters

Helps answer:

* Which ports are open?
* Which application is using the port?
* Is the service listening?

---

# 9. `lsof -i`

## Full Form

```text id="h1qqh5"
lsof = List Open Files
```

### Command

```bash id="09sh5x"
lsof -i :8080
```

### Example

```text id="ck56lg"
java  1234  TCP *:8080
```

### Logic

```text id="vr1vjq"
Port issue
     ↓
lsof -i :8080
     ↓
Find PID
     ↓
kill -9 PID
```

### Why It Matters

Useful for:

* Port conflicts
* Debugging applications
* Identifying running services

---

# 10. `tail -f`

## Full Form

```text id="2mtj3n"
tail = Display the end of a file
```

### Command

```bash id="jjjlwm"
tail -f /var/log/syslog
```

### Meaning

```text id="3l7zzq"
-f = Follow changes
```

### Example

```text id="hprgr2"
INFO: Application Started
ERROR: Connection Failed
```

### Why It Matters

Used for:

* Real-time log monitoring
* Incident response
* Debugging deployments

---

# 11. `du -sh *`

## Full Form

```text id="11q11a"
du = Disk Usage
```

### Command

```bash id="0vh0to"
du -sh *
```

### Meaning

```text id="h6ep2g"
-s = Summary
-h = Human readable
```

### Example

```text id="mv8t74"
5G backups
2G logs
```

### Why It Matters

Find large directories quickly.

---

# 12. `zip`

## Error

```bash id="aq0v9r"
zip: command not found
```

### Meaning

The `zip` package is not installed.

### Fix

```bash id="c6osar"
sudo apt install zip
```

### Verify

```bash id="g4iyqq"
zip --version
```

### Why It Matters

Used for:

* Backups
* Sharing files
* Archiving reports

---

# Common Troubleshooting Flow

```text id="dmpnve"
Application Down
        ↓
systemctl status
        ↓
journalctl -xe
        ↓
ss -tulnp
        ↓
df -h
        ↓
free -h
        ↓
top
        ↓
tail -f logs
```

---

# Daily Commands Used by DevOps Engineers

```bash id="gmy18m"
systemctl status nginx
journalctl -xe
journalctl -u nginx
journalctl -f
df -h
free -h
top
htop
ps aux
ss -tulnp
lsof -i
tail -f /var/log/syslog
du -sh *
```

---

# Most Important Interview Question

> Which Linux commands do you use first when a production application goes down?

### Answer

```text id="dh4u8o"
1. systemctl status
2. journalctl -xe
3. ss -tulnp
4. df -h
5. free -h
6. top
7. ps aux
8. tail -f logs
9. lsof -i
```

---

# Final Thoughts

A DevOps engineer's job is not just deploying applications—it's understanding why systems fail and how to recover them quickly.

If you master these commands, you'll be able to:

* Troubleshoot production incidents.
* Monitor Linux servers.
* Analyze logs.
* Identify performance bottlenecks.
* Manage services.
* Debug networking issues.
* Resolve disk and memory problems.

> These commands are the first tools a DevOps engineer reaches for when production systems are under pressure.

