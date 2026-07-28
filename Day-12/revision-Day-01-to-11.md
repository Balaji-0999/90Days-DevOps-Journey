# Day 12 – Revision (Days 01–11)

## Learning Plan Review

Today I reviewed my progress from Day 01 to Day 11. My goal of becoming a skilled DevOps Engineer is still the same, and I feel much more confident working with Linux than when I started.

### Progress So Far
- Completed 11 days of consistent DevOps practice.
- Improved confidence in Linux command-line operations.
- Learned to troubleshoot services using logs.
- Practiced file permissions, ownership, users, and groups.
- Successfully deployed and managed Nginx on an AWS EC2 instance.

### Focus for the Coming Days
- Improve troubleshooting speed.
- Learn Docker in greater depth.
- Become more comfortable with Linux networking.

---

# Processes & Services Review

### Commands Practiced

```bash
ps aux | head
systemctl status nginx
journalctl -u nginx -n 20
```

### Observations

- Nginx service was active and running.
- Verified running processes using `ps`.
- Checked recent Nginx logs using `journalctl`.
- Understood how Linux services are managed with systemd.

---

# File Operations Practice

Commands I revised today:

```bash
echo "Revision Day 12" >> notes.txt
chmod 644 notes.txt
ls -l notes.txt
cp notes.txt notes-copy.txt
mkdir revision-test
```

What I observed:

- `echo >>` appends content without replacing existing data.
- `chmod` changes file permissions.
- `ls -l` quickly verifies permissions and ownership.
- `cp` creates a copy of files.
- `mkdir` creates directories instantly.

---

# Top 5 Linux Commands for Troubleshooting

| Command | Why I Use It |
|---------|--------------|
| `ls -l` | Check permissions, owner, and group |
| `ps aux` | View running processes |
| `systemctl status nginx` | Verify service health |
| `journalctl -u nginx -n 20` | Read recent service logs |
| `df -h` | Check disk usage |

---

# User & Group Practice

I practiced creating users, assigning groups, and changing file ownership.

Commands reviewed:

```bash
id tokyo
groups berlin
sudo chown professor:planners project-config.yaml
ls -l
```

Observation:

- Verified user and group membership.
- Successfully changed file ownership.
- Confirmed ownership changes using `ls -l`.

---

# Self Check

## 1. Which three Linux commands save me the most time?

### ls -l
Quickly checks file permissions, ownership, and file details.

### systemctl status
Immediately tells whether a service is running or failed.

### journalctl
Helps diagnose service problems by showing detailed logs.

---

## 2. How do I check whether a service is healthy?

Commands I run:

```bash
systemctl status nginx
ps aux | grep nginx
journalctl -u nginx -n 20
```

These commands confirm whether the service is running, the process exists, and whether any recent errors occurred.

---

## 3. How do I safely change ownership and permissions?

Example:

```bash
sudo chown ubuntu:developers project.txt
chmod 640 project.txt
```

I always verify the changes using:

```bash
ls -l project.txt
```

----

## 4. What will I improve during the next three days?

- Strengthen Linux troubleshooting skills.
- Learn Docker commands in more depth.
- Improve speed while working in the Linux terminal.
- Continue building consistent daily DevOps habits.

---

# Key Takeaways

- Linux permissions and ownership are essential for system security.
- Logs are the first place to check while troubleshooting.
- Small daily practice sessions build confidence over time.
- Consistency is more valuable than rushing through topics.
- Documentation helps reinforce learning and makes revision easier.

---

# Revision Summary

Days Reviewed: **Day 01 – Day 11**

Topics Revised:

- Linux Architecture
- Processes & Services
- Systemd
- File Management
- File Permissions
- Users & Groups
- File Ownership
- AWS EC2 Basics
- Nginx Deployment
- Linux Troubleshooting
- Git & GitHub Workflow

**Overall Result:**
I successfully revised everything learned in the first eleven days and feel much more confident working with Linux fundamentals.
