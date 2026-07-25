# Day 04 - Linux Processes, Services & Logs

## Objective

Today's goal was to practice Linux process management, service management, and log analysis using real Linux commands on an AWS EC2 instance.

---

# Process Commands

## 1. Check Running Processes

```bash
ps aux
```

Purpose:
Displays all running processes with detailed information.

---

## 2. Find a Specific Process

```bash
pgrep nginx
```

Purpose:
Finds the Process ID (PID) of the Nginx service.

---

# Service Commands

## 3. Check Nginx Status

```bash
systemctl status nginx
```

Purpose:
Shows whether the Nginx service is active, inactive, or failed.

Observation:
- Nginx service was running successfully.
- Service was enabled to start automatically after reboot.
- Main PID and worker processes were visible.

---

## 4. List Running Services

```bash
systemctl list-units --type=service --state=running
```

Purpose:
Lists all currently running services managed by systemd.

Observation:
I observed services like:
- nginx
- docker
- ssh
- cron
- rsyslog
- systemd-journald

---

# Log Commands

## 5. View Nginx Logs

```bash
journalctl -u nginx -n 20
```

Purpose:
Displays the latest 20 log entries for the Nginx service.

Observation:
The logs showed:
- Starting nginx.service
- Started nginx.service
- Stopping nginx.service
- Stopped nginx.service

---

## 6. View Recent System Logs

```bash
journalctl -n 50
```

Purpose:
Displays the latest 50 system log entries.

Observation:
I observed:
- Cron jobs
- systemd events
- service startup messages
- kernel messages

---

## 7. View Syslog

```bash
tail -n 50 /var/log/syslog
```

Purpose:
Displays the last 50 lines from the system log file.

---

# Mini Troubleshooting

Problem:
Wanted to verify whether Nginx was running correctly.

Steps:

1. Checked service status

```bash
systemctl status nginx
```

2. Viewed logs

```bash
journalctl -u nginx -n 20
```

3. Verified running services

```bash
systemctl list-units --type=service --state=running
```

4. Opened the EC2 Public IP in the browser.

Result:

Successfully accessed the default Nginx web page.

---

# Commands Practiced

- ps aux
- pgrep nginx
- systemctl status nginx
- systemctl list-units --type=service --state=running
- journalctl -u nginx -n 20
- journalctl -n 50
- tail -n 50 /var/log/syslog

---

# Key Learnings

- Learned the difference between processes and services.
- Understood how systemd manages services.
- Learned how to inspect service logs using journalctl.
- Practiced basic Linux troubleshooting.
- Successfully verified the Nginx web server from a browser..

---

**Day 04 Completed ✅**
