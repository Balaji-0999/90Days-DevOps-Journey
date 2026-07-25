# Day 07 - Linux File System Hierarchy & Scenario-Based Practice

## Objective

Today's goal was to understand the Linux File System Hierarchy and practice troubleshooting scenarios like a DevOps Engineer.

---

# Part 1 - Linux File System Hierarchy

## 1. /

**Purpose:**

The root (/) directory is the starting point of the Linux filesystem. Every file and directory exists under it.

**Command**

```bash
ls -l /
```

**Observation**

I observed directories like:

- bin
- boot
- dev
- etc
- home
- opt
- root
- tmp
- usr
- var

**I would use this when**

I need to navigate the complete Linux filesystem.

---

## 2. /home

**Purpose**

Stores home directories of normal users.

**Command**

```bash
ls -l /home
```

**Observation**

I found the ubuntu user's home directory.

**I would use this when**

Managing user files and personal data.

----

## 3. /root

**Purpose**

Home directory of the root (administrator) user.

**Command**

```bash
sudo ls -l /root
```

**Observation**

Contains files used by the root user.

**I would use this when**

Working with administrative tasks.

---

## 4. /etc

**Purpose**

Contains Linux configuration files.

**Command**

```bash
ls -l /etc
```

**Observation**

I saw files like:

- hostname
- hosts
- passwd
- shadow

**I would use this when**

Changing Linux or application configurations.

---

## 5. /var/log

**Purpose**

Stores system and application log files.

**Command**

```bash
ls -l /var/log
```

**Observation**

I found log files such as:

- syslog
- auth.log
- journal

**I would use this when**

Troubleshooting Linux or application issues.

---

## 6. /tmp

**Purpose**

Stores temporary files.

**Command**

```bash
ls -l /tmp
```

**Observation**

Contains temporary files created by users and applications.

**I would use this when**

Testing scripts or storing temporary files.

---

## 7. /bin

**Purpose**

Contains essential Linux commands.

**Command**

```bash
ls -l /bin
```

**Observation**

Contains commands like ls, cp, mv and cat.

**I would use this when**

Running basic Linux commands.

---

## 8. /usr/bin

**Purpose**

Contains most user commands and installed applications.

**Command**

```bash
ls -l /usr/bin | head
```

**Observation**

Contains many executable programs.

**I would use this when**

Running installed software.

---

## 9. /opt

**Purpose**

Stores optional third-party applications.

**Command**

```bash
ls -l /opt
```

**Observation**

Usually contains manually installed software.

**I would use this when**

Installing third-party applications.

---

# Hands-on Practice

## Find Largest Log Files

```bash
du -sh /var/log/* 2>/dev/null | sort -h | tail -5
```

### Observation

Displayed the largest files and folders inside /var/log.

---

## Check Hostname

```bash
cat /etc/hostname
```

### Observation

Displayed the hostname of my EC2 instance.

---

## Check Home Directory

```bash
ls -la ~
```

### Observation

Displayed all files including hidden files like:

- .bashrc
- .profile
- .ssh

---

# Part 2 - Scenario Practice

## Scenario 1 - Service Not Starting

### Step 1

```bash
systemctl status myapp
```

Why:

Check whether the service is running or failed.

---

### Step 2

```bash
journalctl -u myapp -n 50
```

Why:

View the latest logs to identify the reason for failure.

---

### Step 3

```bash
systemctl is-enabled myapp
```

Why:

Check whether the service starts automatically after reboot.

---

### Step 4

```bash
systemctl list-units --type=service
```

Why:

List all available services.

---

## Scenario 2 - High CPU Usage

### Step 1

```bash
top
```

Why:

Monitor CPU and memory usage in real time.

---

### Step 2

```bash
ps aux --sort=-%cpu | head -10
```

Why:

Find the processes consuming the most CPU.

---

## Scenario 3 - Finding Docker Logs

### Step 1

```bash
systemctl status docker
```

Why:

Check Docker service status.

---

### Step 2

```bash
journalctl -u docker -n 50
```

Why:

View the latest Docker logs.

---

### Step 3

```bash
journalctl -u docker -f
```

Why:

Follow Docker logs in real time.

---

## Scenario 4 - Permission Denied

### Step 1

```bash
ls -l backup.sh
```

Why:

Check current permissions.

---

### Step 2

```bash
chmod +x backup.sh
```

Why:

Add execute permission.

---

### Step 3

```bash
ls -l backup.sh
```

Why:

Verify execute permission was added.

---

### Step 4

```bash
./backup.sh
```

Why:

Execute the script.

---

# What I Learned Today

- Learned the Linux File System Hierarchy.
- Understood where configuration files, logs, binaries and user data are stored.
- Practiced finding logs and troubleshooting Linux services.
- Learned how to investigate high CPU usage.
- Understood how to solve "Permission denied" errors using chmod.
- Improved my Linux troubleshooting skills through real-world scenarios.
