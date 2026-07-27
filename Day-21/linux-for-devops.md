# Complete Linux Commands Roadmap for DevOps Engineers

This roadmap covers the most important Linux commands used in production environments by DevOps Engineers, Site Reliability Engineers (SREs), System Administrators, and Cloud Engineers.

If you master these commands with real-world examples, shell scripting, and troubleshooting scenarios, you will be able to handle 80–90% of Linux-related tasks in production.

---

## Complete Learning Sequence

```text
1.  cut
2.  sort
3.  uniq
4.  wc
5.  grep
6.  head
7.  tail
8.  tee
9.  xargs
10. tr
11. sed
12. awk
13. find
14. locate
15. stat
16. du
17. df
18. ps
19. top
20. free
21. uptime
22. lsof
23. netstat
24. ss
25. curl
26. wget
27. tar
28. gzip
29. zip
30. journalctl
31. systemctl
32. crontab
33. chmod
34. chown
35. rsync
36. mount
37. lsblk
38. fdisk
39. kill
40. watch
```

---

## Text Processing Commands

| Command | Production Use Case                            |
| ------- | ---------------------------------------------- |
| `cut`   | Extract usernames, CSV columns, and log fields |
| `sort`  | Sort logs, reports, and metrics                |
| `uniq`  | Find duplicate entries and errors              |
| `wc`    | Count lines, words, and bytes                  |
| `grep`  | Search logs and configuration files            |
| `head`  | Display the first few lines of a file          |
| `tail`  | Display the last few lines and monitor logs    |
| `tee`   | Write output to both terminal and file         |
| `xargs` | Pass output as arguments to another command    |
| `tr`    | Translate or replace characters                |
| `sed`   | Perform stream editing                         |
| `awk`   | Advanced text processing and reporting         |

---

## Monitoring Commands

| Command   | Production Use Case                   |
| --------- | ------------------------------------- |
| `top`     | Real-time CPU monitoring              |
| `htop`    | Interactive system monitoring         |
| `free -h` | Memory usage analysis                 |
| `uptime`  | Check server uptime and load averages |
| `vmstat`  | Performance statistics                |
| `iostat`  | Disk I/O monitoring                   |
| `sar`     | Historical system metrics             |
| `watch`   | Execute commands repeatedly           |

---

## Process Management Commands

| Command | Production Use Case        |
| ------- | -------------------------- |
| `ps`    | List running processes     |
| `kill`  | Terminate processes        |
| `pkill` | Kill processes by name     |
| `pgrep` | Find process IDs           |
| `jobs`  | View background jobs       |
| `nohup` | Run processes after logout |

---

## Disk Management Commands

| Command  | Production Use Case      |
| -------- | ------------------------ |
| `df -h`  | Check filesystem usage   |
| `du -sh` | Display directory sizes  |
| `lsblk`  | List block devices       |
| `mount`  | Mount filesystems        |
| `fdisk`  | Manage disk partitions   |
| `blkid`  | Display filesystem UUIDs |

---

## Networking Commands

| Command      | Production Use Case           |
| ------------ | ----------------------------- |
| `ping`       | Test connectivity             |
| `curl`       | API testing and health checks |
| `wget`       | Download files                |
| `ss`         | Check listening ports         |
| `netstat`    | Display network statistics    |
| `dig`        | DNS lookups                   |
| `nslookup`   | DNS troubleshooting           |
| `traceroute` | Trace packet routes           |

---

## Service Management Commands

| Command       | Production Use Case       |
| ------------- | ------------------------- |
| `systemctl`   | Manage services           |
| `journalctl`  | View system logs          |
| `service`     | Legacy service management |
| `timedatectl` | Configure date and time   |
| `hostnamectl` | Manage hostname settings  |

---

## File Management Commands

| Command  | Production Use Case            |
| -------- | ------------------------------ |
| `find`   | Search files and directories   |
| `locate` | Fast file searching            |
| `stat`   | Display file metadata          |
| `chmod`  | Modify permissions             |
| `chown`  | Change ownership               |
| `ln`     | Create symbolic and hard links |

---

## Compression Commands

| Command | Production Use Case    |
| ------- | ---------------------- |
| `tar`   | Archive files          |
| `gzip`  | Compress files         |
| `zip`   | Create ZIP archives    |
| `unzip` | Extract ZIP archives   |
| `xz`    | High-ratio compression |

---

## Automation Commands

| Command   | Production Use Case            |
| --------- | ------------------------------ |
| `crontab` | Schedule recurring jobs        |
| `at`      | Schedule one-time jobs         |
| `sleep`   | Delay script execution         |
| `time`    | Measure command execution time |

---

## Production Commands Every DevOps Engineer Must Know

```text
cut
sort
uniq
wc
grep
head
tail
tee
xargs
tr
sed
awk
find
locate
stat
du
df
ps
top
free
uptime
lsof
netstat
ss
curl
wget
tar
gzip
zip
journalctl
systemctl
crontab
chmod
chown
rsync
mount
lsblk
fdisk
kill
watch
```

---

## Real Production Pipelines

### Top 10 Errors

```bash
grep ERROR app.log | sort | uniq -c | sort -nr | head -10
```

### Top CPU Consumers

```bash
ps aux | sort -nr -k3 | head -5
```

### Top Memory Consumers

```bash
ps aux | sort -nr -k4 | head -5
```

### Largest Directories

```bash
du -sh * | sort -hr | head -10
```

### Failed SSH Attempts

```bash
grep "Failed" /var/log/auth.log | awk '{print $11}' | sort | uniq -c
```

### Check Listening Ports

```bash
ss -tulnp
```

### Monitor Disk Usage

```bash
df -h
```

### Check Service Status

```bash
systemctl status nginx
```

### Monitor Logs in Real Time

```bash
tail -f /var/log/syslog
```

### API Health Check

```bash
curl http://localhost:8080/health
```

### Find Open Files

```bash
lsof -i :8080
```

### Synchronize Data

```bash
rsync -av source/ destination/
```

### Monitor a Command Every 2 Seconds

```bash
watch -n 2 df -h
```

---

## Commands Used Daily in Production

```text
grep
awk
sed
find
tail -f
journalctl
systemctl
df -h
du -sh
ps aux
ss -tulnp
curl
free -h
top
watch
lsof
```

---

## Commands Used During Incidents

```text
tail -f
grep
journalctl
systemctl
ps
top
ss
curl
df
du
lsof
kill
watch
```

---

## Commands Frequently Used in Shell Scripts

```text
grep
awk
sed
cut
sort
uniq
wc
find
date
tar
gzip
curl
tee
xargs
```

---

## Commands Frequently Asked in DevOps Interviews

```text
grep
awk
sed
find
xargs
tee
sort
uniq
cut
tail
head
df
du
ps
systemctl
journalctl
curl
crontab
lsof
ss
rsync
```

---

## Suggested Learning Order

```text
Phase 1:
cut
sort
uniq
wc
grep
head
tail

Phase 2:
tee
xargs
tr
sed
awk

Phase 3:
find
locate
stat
df
du

Phase 4:
ps
top
free
uptime
lsof
kill

Phase 5:
ss
netstat
curl
wget

Phase 6:
journalctl
systemctl
crontab

Phase 7:
tar
gzip
zip
rsync

Phase 8:
mount
lsblk
fdisk
watch
```

---

## Why These Commands Matter

These commands help DevOps Engineers:

* Troubleshoot production incidents.
* Analyze logs efficiently.
* Monitor system health.
* Automate repetitive tasks.
* Manage services and processes.
* Investigate networking issues.
* Monitor CPU, memory, and disk usage.
* Write robust shell scripts.
* Prepare for DevOps and SRE interviews.
* Manage Linux servers at scale.

---

## Final Thoughts

Linux powers the majority of cloud infrastructure, Kubernetes clusters, CI/CD pipelines, and production environments worldwide.

Mastering these 40 commands with practical examples, shell scripts, and production use cases will significantly improve your Linux, Shell Scripting, and DevOps skills.

> Learn them. Practice them. Automate with them. Troubleshoot with them. These commands form the foundation of a successful DevOps career.

