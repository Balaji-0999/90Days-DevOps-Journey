# Linux Architecture Notes

## Core Components

- **Kernel**: The core of Linux. It manages CPU, memory, devices, filesystems, and system calls.
- **User Space**: Area where users run commands, shells, applications, and services.
- **systemd/init**: The first process started by the kernel. It has PID 1 and manages services.

## Processes

- A process is a running program.
- Every process has a PID.
- A parent process can create a child process.
- The kernel schedules processes on the CPU.
- Processes can run in foreground or background.

## Process States

| State | Meaning |
|---|---|
| R | Running or ready to run |
| S | Sleeping, waiting for an event |
| D | Waiting for I/O and cannot be interrupted |
| T | Stopped or suspended |
| Z | Zombie process, finished but not cleaned by parent |

## systemd

- systemd is the service manager used by many Linux distributions.
- It starts system services during boot.
- It can start, stop, restart, enable, and disable services.
- It keeps service logs using journald.
- It helps DevOps engineers debug failed or crashed services.

## Daily Commands

| Command | Use |
|---|---|
| `ps aux` | View running processes |
| `top` | Monitor CPU and memory usage |
| `systemctl status <service>` | Check service status |
| `journalctl -u <service>` | View service logs |
| `kill <PID>` | Stop a process |

## What I Practiced Today

- Checked PID 1 using `ps -p 1 -o pid,comm,args`.
- Started a background process using `sleep 300 &`.
- Viewed process states using `ps`.
- Checked running services using `systemctl`.
- Viewed logs using `journalctl.
