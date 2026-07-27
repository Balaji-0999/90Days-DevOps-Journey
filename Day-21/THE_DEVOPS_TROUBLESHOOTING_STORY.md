# The DevOps Troubleshooting Story: A Production Incident at 2 AM

Imagine it's **2:00 AM**.

Your phone rings.

> **"The production website is down!"**

Thousands of users cannot access the application. The engineering team is waiting for an update. As a DevOps Engineer, your job is simple:

> Find the problem. Fix it. Restore the service.

This is the exact thought process experienced DevOps engineers follow during production incidents.

---

## Step 1: Is the Service Running?

The first question is:

> Is the application even running?

Run:

```bash
systemctl status nginx
```

Example Output:

```text
● nginx.service - A high performance web server
   Active: failed
```

### Logic

```text
Website Down
      ↓
systemctl status nginx
      ↓
Running?
Stopped?
Failed?
```

### Why It Matters

This command tells you whether your service is:

* Running
* Stopped
* Failed
* Restarting

Think of it as checking a patient's pulse before doing anything else.

---

## Step 2: Why Did the Service Fail?

The service has failed.

Now ask:

> Why did it fail?

Run:

```bash
journalctl -u nginx
```

or

```bash
journalctl -xe
```

### Meaning

| Option | Meaning                 |
| ------ | ----------------------- |
| `-u`   | Unit (service)          |
| `-x`   | Explain errors          |
| `-e`   | Jump to the latest logs |

Example Output:

```text
nginx: Failed to bind to port 80.
Address already in use.
```

### Logic

```text
Service Failed
      ↓
journalctl
      ↓
Read the logs
      ↓
Find the root cause
```

### Why It Matters

Logs are the server's way of telling you what happened.

---

## Step 3: Is the Port Open?

You now know:

> "Port 80 is already in use."

The next question:

> Which application is using it?

Run:

```bash
ss -tulnp
```

### Full Form

```text
ss = Socket Statistics
```

### Options

| Option | Meaning                  |
| ------ | ------------------------ |
| `-t`   | TCP                      |
| `-u`   | UDP                      |
| `-l`   | Listening ports          |
| `-n`   | Numeric format           |
| `-p`   | Show process information |

Example Output:

```text
tcp LISTEN 0 80 apache
tcp LISTEN 0 22 ssh
```

### Logic

```text
Port Problem
      ↓
ss -tulnp
      ↓
Who owns the port?
```

### Why It Matters

This command answers:

* Which ports are open?
* Which service is listening?
* Is the application reachable?

---

## Step 4: Find the Process

You discovered Apache is using Port 80.

Let's identify the process.

Run:

```bash
lsof -i :80
```

### Full Form

```text
lsof = List Open Files
```

Example Output:

```text
COMMAND   PID
apache    1234
```

### Logic

```text
Port Conflict
      ↓
lsof -i :80
      ↓
Find PID
      ↓
Take action
```

### Why It Matters

Useful for:

* Port conflicts
* Debugging applications
* Identifying services

---

## Step 5: Stop the Problematic Process

If necessary:

```bash
kill -9 1234
```

### Full Form

```text
kill = Send a signal to a process
```

### Meaning

```text
-9 = SIGKILL
```

This forcefully terminates the process.

---

## Step 6: Restart the Service

Now restart Nginx:

```bash
systemctl start nginx
```

Verify:

```bash
systemctl status nginx
```

Output:

```text
Active: active (running)
```

---

## Step 7: Verify the Application

Run:

```bash
curl localhost
```

### Full Form

```text
curl = Client URL
```

Example Output:

```html
<html>
<h1>Welcome to Nginx!</h1>
</html>
```

The website is back online.

---

## But What If the Website Is Slow?

A few minutes later, another alert arrives:

> "The website is responding very slowly."

Now your troubleshooting changes.

---

## Step 8: Check CPU Usage

Run:

```bash
top
```

### Full Form

```text
top = Table Of Processes
```

Example Output:

```text
PID    CPU
1001   95%
1002   50%
```

### Logic

```text
Slow Server
      ↓
top
      ↓
Who is consuming CPU?
```

### Why It Matters

Shows:

* CPU usage
* Memory usage
* Running processes
* Load average

---

## Step 9: Check Memory

Run:

```bash
free -h
```

### Meaning

```text
free = Display used and free memory
-h   = Human readable
```

Example Output:

```text
Mem: 16G Total
      15G Used
       1G Free
```

### Logic

```text
Application Slow
      ↓
free -h
      ↓
Do we have enough RAM?
```

### Why It Matters

Helps identify:

* Memory leaks
* High RAM consumption
* Out-of-memory situations

---

## Step 10: Check Disk Space

Run:

```bash
df -h
```

### Full Form

```text
df = Disk Filesystem
```

Example Output:

```text
Filesystem      Size Used Avail
/dev/xvda1      50G   49G   1G
```

### Logic

```text
Application Errors
      ↓
df -h
      ↓
Is the disk full?
```

### Why It Matters

Many applications stop working when the disk reaches 100%.

---

## Step 11: Find Large Files

Disk usage is high.

Find what's consuming space:

```bash
du -sh *
```

### Full Form

```text
du = Disk Usage
```

### Meaning

| Option | Meaning        |
| ------ | -------------- |
| `-s`   | Summary        |
| `-h`   | Human readable |

Example Output:

```text
20G backups
15G logs
5G docker
```

### Logic

```text
Disk Full
      ↓
du -sh *
      ↓
Find large directories
```

---

## Step 12: Check Running Processes

Run:

```bash
ps aux
```

### Full Form

```text
ps = Process Status
```

### Meaning

| Option | Meaning              |
| ------ | -------------------- |
| `a`    | All users            |
| `u`    | User format          |
| `x`    | Background processes |

Example Output:

```text
root      nginx
root      docker
ubuntu    python
```

### Why It Matters

Useful for:

* Finding processes
* Troubleshooting applications
* Process monitoring

---

## Step 13: Monitor Logs in Real Time

Run:

```bash
tail -f /var/log/syslog
```

### Meaning

```text
tail = Display the end of a file
-f   = Follow changes
```

Example Output:

```text
INFO: Application Started
INFO: Connected to Database
ERROR: Database Timeout
```

### Logic

```text
Need live updates?
      ↓
tail -f
      ↓
Watch logs in real time
```

### Why It Matters

One of the most frequently used DevOps commands.

---

## Step 14: Monitor Continuously

Run:

```bash
watch -n 2 df -h
```

### Meaning

```text
watch = Run repeatedly
-n 2  = Every 2 seconds
```
[O
### Logic

```text
Monitor Situation
      ↓
watch
      ↓
Observe changes live
```

---

## The Seven Questions Every DevOps Engineer Asks

```text
1. Is the service running?
2. Why did it fail?
3. Is the port open?
4. Is CPU usage high?
5. Is memory exhausted?
6. Is the disk full?
7. What do the logs say?
```

---

## The Commands That Answer Those Questions

| Question                | Command            |
| ----------------------- | ------------------ |
| Is the service running? | `systemctl status` |
| Why did it fail?        | `journalctl -xe`   |
| Is the port open?       | `ss -tulnp`        |
| Is CPU high?            | `top`              |
| Is memory exhausted?    | `free -h`          |
| Is the disk full?       | `df -h`            |
| What do the logs say?   | `tail -f`          |

---

## The DevOps Golden Rule

Whenever production is down, follow this exact order:

```bash
systemctl status SERVICE
journalctl -xe
ss -tulnp
ps aux
top
free -h
df -h
du -sh *
tail -f LOG_FILE
lsof -i
```

---

## Final Thoughts

A DevOps Engineer's job is not to memorize commands.

A DevOps Engineer's job is to ask the right questions:

* Is the application running?
* Why did it fail?
* What changed?
* Is the server healthy?
* What do the logs say?

Every production incident becomes easier when you follow a structured troubleshooting process.

> The best DevOps engineers are not the ones who never see failures. They are the ones who can quickly understand what failed, why it failed, and how to bring production back online.

