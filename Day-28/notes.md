# ⚡ Day 28 – Quick-Fire Questions & Answers

These questions revise important concepts from **Linux, Shell Scripting, Networking, Git, GitHub, and LVM**.

---

## 1. What does `chmod 755 script.sh` do?

```bash
chmod 755 script.sh
```

This changes the permissions of `script.sh`.

Linux permissions have three categories:

```text
Owner | Group | Others
```

And the numeric values are:

```text
Read    = 4
Write   = 2
Execute = 1
```

Therefore:

```text
7 = 4 + 2 + 1 = rwx
5 = 4 + 1     = r-x
5 = 4 + 1     = r-x
```

So:

```text
Owner  → rwx
Group  → r-x
Others → r-x
```

Final permission:

```text
rwxr-xr-x
```

### In simple words:

The **owner** can read, write, and execute the script.

The **group** and **others** can read and execute the script, but cannot modify it.

Check the permission:

```bash
ls -l script.sh
```

---

# 2. What is the difference between a process and a service?

### Process

A **process** is a running instance of a program.

For example:

```bash
ps aux
```

shows running processes.

Every process has a **PID (Process ID)**.

Example:

```text
PID    COMMAND
1234   nginx
```

### Service

A **service** is an application or background function managed by a service manager such as `systemd`.

Example:

```bash
systemctl status nginx
```

This checks the Nginx service.

### Simple Difference

```text
Process
   ↓
A running instance of a program

Service
   ↓
A managed application/background function
```

A service can consist of one or more processes.

### Example

```text
nginx service
      ↓
nginx processes
      ↓
PID 1234
PID 1235
```

---

# 3. How do you find which process is using port 8080?

Use:

```bash
sudo ss -tulnp | grep :8080
```

Another useful command is:

```bash
sudo lsof -i :8080
```

Example:

```text
LISTEN 0 511 0.0.0.0:8080 ... users:(("java",pid=1234,...))
```

This tells us:

```text
Port      → 8080
Process   → java
PID       → 1234
```

Then inspect the process:

```bash
ps -p 1234 -f
```

### Quick Answer

```bash
sudo ss -tulnp | grep :8080
```

---

# 4. What does `set -euo pipefail` do in a shell script?

```bash
set -euo pipefail
```

This is commonly used to make Bash scripts safer.

It combines three settings.

### `-e`

```bash
set -e
```

Causes the script to exit when an unhandled command failure occurs.

Example:

```bash
false
echo "Hello"
```

With `set -e`, the script normally stops after `false`.

---

### `-u`

```bash
set -u
```

Treats references to unset variables as errors.

Example:

```bash
echo "$username"
```

If `username` has not been defined, Bash reports an error.

---

### `pipefail`

```bash
set -o pipefail
```

Makes a pipeline return a failure status if a command within the pipeline fails, rather than hiding the failure behind a successful final command.

Example:

```bash
false | true
```

With `pipefail`, the pipeline has a failure status.

---

### Easy Memory Trick

```text
-e
 ↓
Stop on unhandled command failure

-u
 ↓
Catch unset variables

pipefail
 ↓
Catch failures inside pipelines
```

Together:

```bash
set -euo pipefail
```

---

# 5. What is the difference between `git reset --hard` and `git revert`?

Both can be used when you want to undo changes, but they work differently.

---

## 🔴 `git reset --hard`

```bash
git reset --hard HEAD~1
```

Moves the current branch back to an earlier commit and resets the working tree and staging area to match that commit.

Example:

```text
Before:

A → B → C
        ↑
       HEAD
```

After:

```bash
git reset --hard HEAD~1
```

```text
A → B
    ↑
   HEAD
```

The commit `C` is no longer part of the current branch history.

> ⚠️ `--hard` can discard uncommitted changes, so use it very carefully.

---

## 🟢 `git revert`

```bash
git revert <commit-id>
```

Creates a **new commit** that reverses the changes introduced by an earlier commit.

Example:

```text
Before:

A → B → C
```

After reverting C:

```text
A → B → C → C'
```

`C'` is a new commit that undoes C's changes.

---

## Quick Difference

```text
git reset --hard
        ↓
Moves branch history backward
        ↓
Can discard working-tree changes


git revert
        ↓
Creates a new undo commit
        ↓
Preserves existing history
```

### Important DevOps Rule

For a shared branch such as `main`, **revert is generally safer** because it does not rewrite the existing shared history.

---

# 6. What branching strategy would you recommend for a team of 5 developers shipping weekly?

For a small team of 5 developers releasing weekly, I would generally recommend **GitHub Flow**.

The workflow is simple:

```text
main
 │
 ├── feature/login
 │
 ├── feature/payment
 │
 └── feature/dashboard
```

### Workflow

```text
Create feature branch
        ↓
Make changes
        ↓
Commit
        ↓
Push branch
        ↓
Create Pull Request
        ↓
Code Review
        ↓
Automated Tests
        ↓
Merge into main
        ↓
Release
```

Example:

```bash
git switch main
git pull origin main

git switch -c feature/login

# Make changes

git add .
git commit -m "Add login feature"

git push -u origin feature/login
```

Then create a Pull Request.

### Why GitHub Flow?

For a small team shipping weekly, it provides:

* Simple branching
* Pull Request-based review
* Easy collaboration
* Less branch-management overhead
* Good compatibility with CI/CD

### Quick Answer

```text
5 developers + weekly releases
              ↓
         GitHub Flow
              ↓
Feature Branch → PR → Review → Test → main
```

---

# 7. What does `git stash` do and when would you use it?

`git stash` temporarily stores your uncommitted changes.

Imagine you are working on:

```text
feature-login
```

and suddenly need to switch to another branch.

Your changes are unfinished, so you don't want to commit them yet.

Run:

```bash
git stash
```

Now the working directory becomes clean.

You can switch branches:

```bash
git switch main
```

After finishing the urgent task, return:

```bash
git switch feature-login
```

Restore your changes:

```bash
git stash pop
```

### Useful Commands

List stashes:

```bash
git stash list
```

Apply a stash without removing it:

```bash
git stash apply
```

Apply and remove the latest stash:

```bash
git stash pop
```

### Simple Meaning

```text
git stash
    ↓
Temporarily save unfinished work

git stash pop
    ↓
Restore that work
```

### When to Use It?

Use `git stash` when:

* Your changes are unfinished.
* You need to switch branches temporarily.
* You need to pull/switch for an urgent task.
* You don't want to create a temporary commit.

---

# 8. How do you schedule a script to run every day at 3 AM?

Use **cron**.

Open your crontab:

```bash
crontab -e
```

Add:

```cron
0 3 * * * /home/ubuntu/backup.sh
```

This means:

```text
0  → minute
3  → hour
*  → every day of month
*  → every month
*  → every day of week
```

Therefore:

```text
Every day at 03:00 AM
```

### Cron Format

```text
┌──────── minute
│ ┌────── hour
│ │ ┌──── day of month
│ │ │ ┌── month
│ │ │ │ ┌ day of week
│ │ │ │ │
* * * * *
```

### With Logging

A better production-style entry can be:

```cron
0 3 * * * /home/ubuntu/backup.sh >> /home/ubuntu/backup.log 2>&1
```

This saves both normal output and errors into `backup.log`.

Make sure the script works manually first:

```bash
chmod +x /home/ubuntu/backup.sh
/home/ubuntu/backup.sh
```

---

# 9. What is the difference between `git fetch` and `git pull`?

Both retrieve information from a remote repository, but they handle the changes differently.

---

## 🔵 git fetch

```bash
git fetch
```

Downloads the latest information from the remote repository.

It updates your remote-tracking references but does **not automatically merge the changes into your current branch**.

Think:

```text
GitHub
  ↓
git fetch
  ↓
Local repository information
```

You can inspect the changes before integrating them.

---

## 🟢 git pull

```bash
git pull
```

Normally performs:

```text
git fetch
    +
integration
```

The integration step is commonly a merge, although configuration/options can make it use rebase.

Example:

```bash
git pull origin main
```

### Easy Difference

```text
git fetch
     ↓
Download remote changes
     ↓
Don't automatically integrate them


git pull
     ↓
Fetch remote changes
     +
Integrate them into current branch
```

### Quick Answer

```text
fetch → download/check
pull  → download + integrate
```

---

# 10. What is LVM and why would you use it instead of regular partitions?

**LVM** stands for:

> **Logical Volume Manager**

It provides a flexible layer for managing storage.

Traditional partitioning might look like:

```text
Disk
 │
 ├── Partition 1
 ├── Partition 2
 └── Partition 3
```

With LVM:

```text
Physical Disk
      ↓
Physical Volume (PV)
      ↓
Volume Group (VG)
      ↓
Logical Volumes (LV)
      ↓
Filesystem
      ↓
Mount Point
```

---

## Important LVM Components

### PV – Physical Volume

The storage device prepared for LVM.

Example:

```bash
sudo pvcreate /dev/nvme1n1
```

---

### VG – Volume Group

A pool of storage made from one or more physical volumes.

```bash
sudo vgcreate my_vg /dev/nvme1n1
```

---

### LV – Logical Volume

A logical storage volume created from the volume group.

```bash
sudo lvcreate -L 5G -n my_lv my_vg
```

---

## Check LVM

```bash
sudo pvs
```

Shows Physical Volumes.

```bash
sudo vgs
```

Shows Volume Groups.

```bash
sudo lvs
```

Shows Logical Volumes.

---

## Why Use LVM?

LVM can provide more flexible storage management than traditional fixed partitions.

Advantages include:

* Flexible logical volume management
* Easier resizing in many situations
* Ability to combine physical storage into volume groups
* Snapshots
* Better storage administration for many server environments

### Example

Suppose you have:

```text
12 GB Disk
```

You could create:

```text
VG: bji_vg
 │
 ├── LV: first_lv → 4 GB
 │
 └── LV: second_lv → 6 GB
```

with some free space remaining in the volume group.

That gives you more flexibility to manage the logical volumes later.

---

# 🧠 Quick-Fire Cheat Sheet

| Question             | Quick Answer                                                  |
| -------------------- | ------------------------------------------------------------- |
| `chmod 755`          | Owner `rwx`, group `r-x`, others `r-x`                        |
| Process              | Running instance of a program                                 |
| Service              | Managed application/background function                       |
| Port 8080            | `sudo ss -tulnp \| grep :8080`                                |
| `set -e`             | Stop on unhandled command failure                             |
| `set -u`             | Catch unset variables                                         |
| `pipefail`           | Catch failures inside pipelines                               |
| `reset --hard`       | Move branch back and reset working tree/staging               |
| `revert`             | Create a new commit that undoes an earlier commit             |
| 5-person weekly team | GitHub Flow                                                   |
| `git stash`          | Temporarily save uncommitted work                             |
| 3 AM cron            | `0 3 * * * /path/to/script.sh`                                |
| `git fetch`          | Download remote information without automatically integrating |
| `git pull`           | Fetch + integrate                                             |
| LVM                  | Flexible logical storage management                           |

---

# 🎯 Interview-Style One-Line Answers

### 1. `chmod 755 script.sh`

> Gives the owner read/write/execute permissions and the group and others read/execute permissions.

### 2. Process vs Service

> A process is a running instance of a program, while a service is a managed application or background function, often controlled by systemd.

### 3. Find process using port 8080

```bash
sudo ss -tulnp | grep :8080
```

### 4. `set -euo pipefail`

> It makes Bash scripts safer by handling unhandled command failures, unset variables, and pipeline failures.

### 5. Branching strategy

> For a team of five developers shipping weekly, I would generally use GitHub Flow: feature branch → Pull Request → review → tests → main.

### 6. `git stash`

> Temporarily stores uncommitted changes so I can switch branches or handle another task without making an unfinished commit.

### 7. Daily 3 AM script

```cron
0 3 * * * /path/to/script.sh
```

### 8. Fetch vs Pull

> `git fetch` downloads remote information without automatically integrating it, while `git pull` fetches and then integrates the changes.

### 9. LVM

> LVM is Logical Volume Manager, which provides a flexible storage-management layer using Physical Volumes, Volume Groups, and Logical Volumes.

---

# 🏆 Day 28 Quick-Fire Revision Complete

These questions cover some of the most important practical concepts from the first 27 days:

```text
Linux
  ↓
Permissions → Processes → Networking → Services

Shell
  ↓
Scripting → Error Handling → Automation

Storage
  ↓
LVM → PV → VG → LV

Git
  ↓
Branches → Merge → Rebase → Reset → Revert

GitHub
  ↓
Push → Pull → PR → Collaboration
```

**Day 28 Quick-Fire Questions – Completed ✅**

#90DaysOfDevOps
#DevOpsKaJosh
#TrainWithShubham

