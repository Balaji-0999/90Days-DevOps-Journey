# 🐧 Linux Revision – Day 28

## 1. Navigate the File System, Create/Move/Delete Files and Directories

Linux provides commands to navigate and manage files and directories.

### 📂 Navigation Commands

```bash
pwd
```

Shows the current working directory.

```bash
ls
```

Lists files and directories.

```bash
cd /etc
```

Changes to `/etc`.

```bash
cd ..
```

Moves one directory up.

```bash
cd ~
```

Moves to the user's home directory.

### 📁 Create Files and Directories

Create a file:

```bash
touch file.txt
```

Create a directory:

```bash
mkdir mydir
```

Create nested directories:

```bash
mkdir -p project/src/logs
```

### 📦 Copy, Move and Delete

Copy a file:

```bash
cp file.txt backup.txt
```

Copy a directory:

```bash
cp -r mydir backup
```

Move or rename:

```bash
mv file.txt newfile.txt
```

Delete a file:

```bash
rm file.txt
```

Delete a directory:

```bash
rm -r mydir
```

> ⚠️ `rm` permanently removes files. Always verify the path before using `rm -r` or `rm -rf`.

---

# 2. Manage Processes – List, Kill, Background and Foreground

A **process** is a running instance of a program.

### 🔍 List Processes

```bash
ps aux
```

Shows running processes.

```bash
top
```

Shows processes and live CPU/memory usage.

```bash
pgrep nginx
```

Finds the PID of a process by name.

### 🛑 Kill a Process

First find the PID:

```bash
ps aux | grep nginx
```

Then:

```bash
kill PID
```

Example:

```bash
kill 1234
```

If the process does not stop:

```bash
kill -9 1234
```

> `kill -9` forcefully terminates the process. It should generally be a last resort.

### ⏩ Background and Foreground

Run a command in the background:

```bash
sleep 100 &
```

See background jobs:

```bash
jobs
```

Bring a job to the foreground:

```bash
fg
```

Send the current process to the background:

```text
Ctrl + Z
```

Then:

```bash
bg
```

### Quick Summary

```text
ps/top    → view processes
kill      → terminate a process
jobs      → view shell jobs
bg        → continue a stopped job in background
fg        → bring a job to foreground
```

---

# 3. Work with systemd – Start, Stop, Enable and Check Services

**systemd** is the service and system manager used by modern Linux distributions.

`systemctl` is used to manage systemd services.

### 🔎 Check Service Status

```bash
systemctl status nginx
```

Shows whether Nginx is running, stopped, failed, etc.

### ▶️ Start a Service

```bash
sudo systemctl start nginx
```

Starts Nginx immediately.

### ⏹️ Stop a Service

```bash
sudo systemctl stop nginx
```

Stops Nginx.

### 🔄 Restart a Service

```bash
sudo systemctl restart nginx
```

Restarts Nginx.

### 🔁 Enable a Service at Boot

```bash
sudo systemctl enable nginx
```

Configures Nginx to start automatically during boot.

### 🚫 Disable a Service at Boot

```bash
sudo systemctl disable nginx
```

Prevents automatic startup at boot.

### Important Difference

```text
start   → start now
stop    → stop now
restart → restart now
enable  → start automatically at boot
disable → don't start automatically at boot
status  → check current state
```

---

# 4. Read and Edit Text Files Using vi/vim or nano

Linux provides several text editors.

## Using nano

Open a file:

```bash
nano notes.txt
```

Useful shortcuts:

```text
Ctrl + O → Save
Ctrl + X → Exit
Ctrl + W → Search
Ctrl + K → Cut line
Ctrl + U → Paste
```

## Using Vim

Open a file:

```bash
vim notes.txt
```

Vim has different modes.

### Normal Mode

Used for navigation and commands.

Press:

```text
Esc
```

### Insert Mode

Press:

```text
i
```

Then type your text.

### Save and Exit

Press:

```text
Esc
:wq
```

Then press Enter.

### Exit Without Saving

```text
Esc
:q!
```

### Important Vim Commands

```text
i       → insert mode
Esc     → normal mode
:w      → save
:q      → quit
:wq     → save and quit
:q!     → quit without saving
```

---

# 5. Troubleshoot CPU, Memory and Disk Issues

Linux provides several commands to identify resource problems.

## 🧠 CPU

Use:

```bash
top
```

It shows:

* CPU usage
* Memory usage
* Running processes
* Load information
* Process IDs

You can also use:

```bash
uptime
```

to see system uptime and load averages.

## 💾 Memory

Use:

```bash
free -h
```

Example:

```text
               total   used   free
Mem:            4Gi     2Gi    500Mi
```

`-h` means human-readable format.

## 💽 Disk Space

Check filesystem usage:

```bash
df -h
```

Find how much space a directory uses:

```bash
du -sh /var/log
```

Find large directories:

```bash
du -h --max-depth=1 /var
```

### Quick Troubleshooting Flow

```text
High CPU?
    ↓
top
    ↓
Find process using CPU
    ↓
ps / top
    ↓
Investigate process

Low memory?
    ↓
free -h
    ↓
Check memory-consuming processes
    ↓
top / ps

Low disk space?
    ↓
df -h
    ↓
Find large directories
    ↓
du -sh
```

---

# 6. Linux File System Hierarchy

Linux organizes everything under a single root directory:

```text
/
```

Important directories:

```text
/
├── /bin
├── /boot
├── /dev
├── /etc
├── /home
├── /lib
├── /media
├── /mnt
├── /opt
├── /proc
├── /root
├── /run
├── /sbin
├── /srv
├── /sys
├── /tmp
├── /usr
└── /var
```

### `/`

The root of the entire Linux filesystem.

### `/etc`

Contains system and application configuration files.

Example:

```bash
/etc/ssh/
/etc/nginx/
/etc/hosts
```

### `/home`

Contains normal users' home directories.

Example:

```text
/home/ubuntu
/home/devopsuser
```

### `/var`

Contains variable data such as:

* Logs
* Caches
* Spool files
* Application data

Example:

```bash
/var/log
```

### `/tmp`

Used for temporary files.

```text
/tmp
```

Temporary data is generally not intended for permanent storage.

### `/root`

Home directory of the root user.

```text
/root
```

It is different from `/`.

### `/usr`

Contains many user-space applications, libraries and supporting files.

### `/bin`

Contains essential user commands on systems where `/bin` is a separate directory. On many modern Linux distributions, `/bin` is a symlink into `/usr/bin`.

### `/sbin`

Contains system administration commands. On many modern distributions, this is also integrated into `/usr`.

### `/dev`

Contains device files.

Example:

```text
/dev/sda
/dev/nvme0n1
```

### `/proc`

A virtual filesystem containing information about processes and the running kernel.

### `/sys`

Provides information and interfaces for devices and the kernel.

### `/boot`

Contains files required for booting Linux.

### Easy Memory Trick

```text
/etc   → configuration
/home  → users
/var   → variable data/logs
/tmp   → temporary files
/root  → root user's home
/dev   → devices
/proc  → processes/kernel information
/usr   → user-space programs/files
/boot  → boot files
```

---

# 7. Create Users and Groups, Manage Passwords

Linux supports multiple users and groups.

## 👤 Create a User

```bash
sudo useradd -m devopsuser
```

Create a user with a home directory.

On Ubuntu, you can also use:

```bash
sudo adduser devopsuser
```

This provides an interactive setup.

## 🔐 Set a Password

```bash
sudo passwd devopsuser
```

## 👥 Create a Group

```bash
sudo groupadd developers
```

## ➕ Add User to Group

```bash
sudo usermod -aG developers devopsuser
```

Check group membership:

```bash
groups devopsuser
```

or:

```bash
id devopsuser
```

## ❌ Delete a User

```bash
sudo userdel devopsuser
```

Delete the user and its home directory:

```bash
sudo userdel -r devopsuser
```

> Be careful with `-r` because it removes the user's home directory and its contents.

### Important Commands

```text
useradd   → create user
adduser   → interactive user creation on Debian/Ubuntu
passwd    → manage password
groupadd  → create group
usermod   → modify user
groups    → show user's groups
id        → show UID, GID and groups
userdel   → delete user
```

---

# 8. Set File Permissions Using chmod

Linux permissions control who can:

```text
read
write
execute
```

The three permission categories are:

```text
Owner
Group
Others
```

Example:

```bash
ls -l script.sh
```

Output:

```text
-rwxr-xr--
```

This can be understood as:

```text
Owner  → rwx
Group  → r-x
Others → r--
```

## Numeric Permissions

Permission values:

```text
Read    = 4
Write   = 2
Execute = 1
```

Therefore:

```text
7 = rwx = 4 + 2 + 1
6 = rw- = 4 + 2
5 = r-x = 4 + 1
4 = r-- = 4
```

### Example

```bash
chmod 755 script.sh
```

Means:

```text
Owner  → rwx → 7
Group  → r-x → 5
Others → r-x → 5
```

Final:

```text
rwxr-xr-x
```

## Symbolic Permissions

Give owner execute permission:

```bash
chmod u+x script.sh
```

Remove write permission from group:

```bash
chmod g-w file.txt
```

Give others read permission:

```bash
chmod o+r file.txt
```

Where:

```text
u = user/owner
g = group
o = others
a = all
```

---

# 9. Change File Ownership Using chown and chgrp

Permissions and ownership are different concepts.

### Check Ownership

```bash
ls -l file.txt
```

Example:

```text
-rw-r--r-- 1 ubuntu developers 100 Aug 11 file.txt
```

Here:

```text
Owner → ubuntu
Group → developers
```

## Change Owner

```bash
sudo chown devopsuser file.txt
```

Now `devopsuser` owns the file.

## Change Group

```bash
sudo chgrp developers file.txt
```

Now `developers` is the file's group.

## Change Both

```bash
sudo chown devopsuser:developers file.txt
```

## Change Directory Recursively

```bash
sudo chown -R devopsuser:developers project/
```

`-R` means recursively.

### Easy Difference

```text
chmod  → change permissions
chown  → change owner
chgrp  → change group
```

---

# 10. Create and Manage LVM Volumes

LVM stands for:

**Logical Volume Manager**

LVM provides flexible storage management.

## LVM Architecture

```text
Physical Disk
      ↓
Physical Volume (PV)
      ↓
Volume Group (VG)
      ↓
Logical Volume (LV)
      ↓
Filesystem
      ↓
Mount Point
```

### Step 1 – Create Physical Volume

```bash
sudo pvcreate /dev/nvme1n1
```

Check:

```bash
sudo pvs
```

### Step 2 – Create Volume Group

```bash
sudo vgcreate my_vg /dev/nvme1n1
```

Check:

```bash
sudo vgs
```

### Step 3 – Create Logical Volume

```bash
sudo lvcreate -L 5G -n my_lv my_vg
```

Check:

```bash
sudo lvs
```

### Step 4 – Create Filesystem

```bash
sudo mkfs.ext4 /dev/my_vg/my_lv
```

### Step 5 – Create Mount Point

```bash
sudo mkdir -p /mnt/data
```

### Step 6 – Mount

```bash
sudo mount /dev/my_vg/my_lv /mnt/data
```

Check:

```bash
df -h
```

or:

```bash
lsblk
```

### Important Commands

```text
pvs → Physical Volumes
vgs → Volume Groups
lvs → Logical Volumes
lsblk → Block devices
df -h → Filesystem usage
```

### Why Use LVM?

LVM can make storage management more flexible because logical volumes can often be resized and managed independently from the underlying physical storage layout.

---

# 11. Check Network Connectivity

Linux provides many networking commands.

## 🌐 ping

Tests basic network reachability.

```bash
ping google.com
```

Stop with:

```text
Ctrl + C
```

## 🌍 curl

Tests HTTP/HTTPS communication.

```bash
curl https://example.com
```

Check only HTTP headers:

```bash
curl -I https://example.com
```

## 🔌 ss

Shows sockets and listening ports.

```bash
sudo ss -tulnp
```

Common options:

```text
-t → TCP
-u → UDP
-l → listening
-n → numeric addresses/ports
-p → process information
```

## netstat

Older networking utility:

```bash
netstat -tulnp
```

On modern Linux systems, `ss` is generally preferred.

## 🔎 dig

Used for DNS queries.

```bash
dig google.com
```

Specific record:

```bash
dig google.com A
```

## 🔎 nslookup

Another DNS lookup tool:

```bash
nslookup google.com
```

### Quick Reference

```text
ping     → test reachability
curl     → test HTTP/API communication
ss       → inspect sockets and listening ports
netstat  → older socket/network information tool
dig      → detailed DNS queries
nslookup → DNS lookup
```

---

# 12. DNS, IP Addressing, Subnets and Common Ports

## 🌐 What is an IP Address?

An IP address identifies a network interface on an IP network.

Example:

```text
192.168.1.10
```

IPv4 addresses contain four octets:

```text
192 . 168 . 1 . 10
```

Each octet ranges from:

```text
0–255
```

## 🔎 What is DNS?

DNS stands for:

**Domain Name System**

DNS translates domain names into IP addresses.

For example:

```text
google.com
     ↓
DNS
     ↓
IP address
```

Instead of remembering an IP address, users can use:

```text
google.com
```

### Basic DNS Flow

```text
User enters:
google.com
     ↓
DNS Resolver
     ↓
DNS lookup
     ↓
IP address
     ↓
Browser connects to server
```

---

## 🧩 What is a Subnet?

A subnet is a logical subdivision of an IP network.

Example:

```text
192.168.1.0/24
```

`/24` is the CIDR prefix length.

It means:

```text
Network portion = 24 bits
Host portion    = 8 bits
```

For a typical IPv4 `/24` network:

```text
Network:   192.168.1.0
Usable:    192.168.1.1 – 192.168.1.254
Broadcast: 192.168.1.255
```

> The exact usable-address rules can vary with special subnet types, but this is the standard example for learning IPv4 subnetting.

---

# 🔌 Common Ports

| Port | Protocol/Service | Common Use                  |
| ---: | ---------------- | --------------------------- |
|   22 | SSH              | Remote Linux access         |
|   53 | DNS              | Domain name resolution      |
|   80 | HTTP             | Web traffic                 |
|  443 | HTTPS            | Secure web traffic          |
|   25 | SMTP             | Email transfer              |
|  110 | POP3             | Email retrieval             |
|  143 | IMAP             | Email retrieval             |
| 3306 | MySQL            | Database                    |
| 5432 | PostgreSQL       | Database                    |
| 6379 | Redis            | In-memory database/cache    |
| 8080 | HTTP alternative | Common application/web port |

### Example

If an application is running on:

```text
192.168.1.10:8080
```

Then:

```text
192.168.1.10 → IP address
8080          → Port
```

The IP identifies the network destination, while the port identifies the service/application endpoint on that host.

---

# 🧠 Final Linux Cheat Sheet

```text
Navigation
──────────
pwd                 → current directory
ls                  → list files
cd                  → change directory
mkdir               → create directory
touch               → create file
cp                  → copy
mv                  → move/rename
rm                  → delete

Processes
─────────
ps aux              → list processes
top                 → live process/resource view
kill PID            → terminate process
jobs                → shell jobs
bg                  → background job
fg                  → foreground job

systemd
────────
systemctl status    → check service
systemctl start     → start service
systemctl stop      → stop service
systemctl restart   → restart service
systemctl enable    → enable at boot
systemctl disable   → disable at boot

Resources
─────────
top                 → CPU/processes
free -h             → memory
df -h               → filesystem disk usage
du -sh              → directory size

Users
─────
useradd             → create user
adduser             → interactive user creation
passwd              → password
groupadd            → create group
usermod             → modify user
id                  → user/group information

Permissions
───────────
chmod               → permissions
chown               → owner
chgrp               → group

LVM
───
pvs                 → physical volumes
vgs                 → volume groups
lvs                 → logical volumes
lsblk               → block devices

Networking
──────────
ip addr             → IP addresses
ip link             → interfaces
ping                → reachability
curl                → HTTP/HTTPS
ss                  → sockets/ports
netstat             → older socket tool
dig                 → DNS query
nslookup            → DNS lookup
```

## 🎯 Key Concepts to Remember

```text
Process    → running instance of a program
Service    → managed application/function, often running in background

chmod      → permissions
chown      → owner
chgrp      → group

PV         → Physical Volume
VG         → Volume Group
LV         → Logical Volume

DNS        → domain name → IP address
IP         → network interface address
Port       → service/application endpoint
Subnet     → logical division of an IP network

systemctl  → manage systemd services
ss         → inspect network sockets
df         → filesystem disk usage
du         → directory/file space usage
```

**Linux Revision – Day 28 ✅**

