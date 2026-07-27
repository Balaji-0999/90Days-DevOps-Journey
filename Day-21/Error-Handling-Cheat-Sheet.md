# DevOps Error Handling Cheat Sheet

This cheat sheet contains common Linux, Shell Scripting, Git, Docker, and system administration errors that DevOps engineers frequently encounter in production and during interviews.

For each error, you'll find:

* What it means
* Why it happens
* How to fix it

---

# Linux Errors

| Error                       | Meaning                                                  | Solution                                        |
| --------------------------- | -------------------------------------------------------- | ----------------------------------------------- |
| `Permission denied`         | You don't have permission to execute or access the file. | Use `chmod +x file.sh` or `sudo`.               |
| `Command not found`         | Linux cannot find the command in `$PATH`.                | Install the package or check the command name.  |
| `No such file or directory` | File/path does not exist.                                | Verify using `ls` or `pwd`.                     |
| `File exists`               | Trying to create something that already exists.          | Rename or remove the existing file.             |
| `Read-only file system`     | Filesystem is mounted as read-only.                      | Remount with `mount -o remount,rw`.             |
| `Disk quota exceeded`       | User has exceeded storage limits.                        | Free up space or increase quota.                |
| `Device or resource busy`   | File/device is currently in use.                         | Use `lsof` or `fuser`.                          |
| `Too many open files`       | Open file limit exceeded.                                | Increase limits in `/etc/security/limits.conf`. |

---

# Shell Scripting Errors

| Error                                       | Meaning                                  | Solution                                      |
| ------------------------------------------- | ---------------------------------------- | --------------------------------------------- |
| `syntax error near unexpected token`        | Incorrect shell syntax.                  | Check brackets, quotes, and loops.            |
| `unexpected EOF while looking for matching` | Missing quote or `fi`, `done`, `}`.      | Verify opening and closing symbols.           |
| `unbound variable`                          | Variable used before initialization.     | Define the variable or use `${VAR:-default}`. |
| `integer expression expected`               | String used where a number was expected. | Validate input before comparison.             |
| `Permission denied`                         | Script isn't executable.                 | `chmod +x script.sh`                          |
| `bad substitution`                          | Unsupported variable expansion.          | Ensure Bash is used (`#!/bin/bash`).          |
| `command not found`                         | Invalid command or missing package.      | Install package or fix typo.                  |
| `too many arguments`                        | Improper spacing or quoting.             | Use quotes around variables.                  |

---

# Common Bash Mistakes

### Missing Spaces

Incorrect:

```bash
if [ "$a"=="$b" ]
```

Correct:

```bash
if [ "$a" == "$b" ]
```

---

### Missing `fi`

Incorrect:

```bash
if [ $a -gt 10 ]
then
echo "Hi"
```

Correct:

```bash
if [ $a -gt 10 ]
then
echo "Hi"
fi
```

---

### Missing Quotes

Incorrect:

```bash
echo $name
```

Better:

```bash
echo "$name"
```

---

# File Permission Errors

## Error

```bash
./script.sh: Permission denied
```

### Why?

File is not executable.

### Fix

```bash
chmod +x script.sh
./script.sh
```

---

# Disk Errors

## Error

```bash
No space left on device
```

### Why?

Disk is full.

### Check

```bash
df -h
```

### Find Large Files

```bash
du -sh * | sort -hr | head -10
```

### Fix

* Delete old logs.
* Remove unused Docker images.
* Compress files.

---

# Memory Issues

## Check Memory

```bash
free -h
```

## High Memory Processes

```bash
ps aux | sort -nr -k4 | head
```

---

# CPU Issues

## Check CPU Usage

```bash
top
```

or

```bash
ps aux --sort=-%cpu
```

---

# Service Errors

## Error

```bash
Unit nginx.service could not be found
```

### Why?

* Service not installed.
* Wrong service name.

### Fix

```bash
systemctl list-units --type=service
```

---

## Error

```bash
Job for nginx.service failed
```

### Check Logs

```bash
systemctl status nginx
journalctl -u nginx
```

---

# SSH Errors

## Error

```bash
Permission denied (publickey)
```

### Why?

* Incorrect SSH key.
* Key not added.

### Fix

```bash
ssh -i key.pem ubuntu@IP
```

---

## Error

```bash
Connection refused
```

### Why?

* SSH service stopped.
* Port blocked.

### Fix

```bash
systemctl status ssh
ss -tulnp
```

---

# Networking Errors

## Error

```bash
Connection timed out
```

### Why?

* Firewall issue.
* Security Group issue.
* Server unreachable.

### Fix

```bash
ping SERVER_IP
```

```bash
telnet SERVER_IP 22
```

---

## Error

```bash
Address already in use
```

### Why?

Another process is using the port.

### Find Process

```bash
lsof -i :8080
```

### Kill Process

```bash
kill -9 PID
```

---

# Docker Errors

## Error

```bash
docker: command not found
```

### Fix

Install Docker:

```bash
sudo apt install docker.io
```

---

## Error

```bash
Cannot connect to the Docker daemon
```

### Fix

```bash
sudo systemctl start docker
```

---

## Error

```bash
Port is already allocated
```

### Why?

Another container/process is using the port.

### Check

```bash
docker ps
lsof -i :80
```

---

# Git Errors

## Error

```bash
fatal: not a git repository
```

### Fix

```bash
git init
```

---

## Error

```bash
fatal: Authentication failed
```

### Fix

* Use Personal Access Token.
* Verify Git credentials.

---

## Error

```bash
Updates were rejected
```

### Fix

```bash
git pull
git push
```

or

```bash
git push --force
```

(Use force push carefully.)

---

# Cron Errors

## Error

```bash
no crontab for ubuntu
```

### Meaning

No cron jobs exist.

### Add One

```bash
crontab -e
```

---

# Tar Errors

## Error

```bash
tar: Cannot open
```

### Why?

File does not exist.

### Verify

```bash
ls
```

---

# Zip Errors

## Error

```bash
zip: command not found
```

### Fix

```bash
sudo apt install zip
```

---

# Journalctl Commands

```bash
journalctl -xe
journalctl -u nginx
journalctl -f
```

Useful for troubleshooting service failures.

---

# Most Useful Troubleshooting Commands

```bash
top
htop
free -h
df -h
du -sh *
ps aux
systemctl status
journalctl -xe
ss -tulnp
lsof -i
tail -f
```

---

# Production Troubleshooting Flow

```text
Application Down
       ↓
systemctl status
       ↓
journalctl -u service
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

# Most Common DevOps Errors

```text
Permission denied
Command not found
No such file or directory
Unexpected EOF
Unbound variable
Connection refused
Connection timed out
No space left on device
Address already in use
Authentication failed
Cannot connect to Docker daemon
Job for service failed
```

---

# Golden Rule

Whenever something breaks, check:

```bash
systemctl status SERVICE
journalctl -xe
df -h
free -h
top
ps aux
ss -tulnp
tail -f /var/log/syslog
```

These seven commands solve a huge percentage of Linux and DevOps issues in production.

> A good DevOps engineer is not someone who never sees errors—it's someone who can quickly understand what the error means, why it happened, and how to fix it.

