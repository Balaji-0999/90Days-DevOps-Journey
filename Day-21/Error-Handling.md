# Linux One-Liners and Error Handling for DevOps

Linux one-liners and proper error handling are essential skills for every DevOps Engineer. During production incidents, engineers often have only a few minutes to identify and fix issues.

This guide covers:

* Useful Linux one-liners
* Error handling techniques
* Strict mode in Shell Scripting
* Exit codes
* Trap commands
* Real production use cases
* Why these concepts matter in DevOps

---

# Step 7: Useful One-Liners

## 1. Delete Logs Older Than 30 Days

### Command

```bash id="jv8u7v"
find /var/log -name "*.log" -mtime +30 -delete
```

### Command Breakdown

| Part            | Meaning                        |
| --------------- | ------------------------------ |
| `find`          | Search files                   |
| `/var/log`      | Search here                    |
| `-name "*.log"` | Only `.log` files              |
| `-mtime +30`    | Modified more than 30 days ago |
| `-delete`       | Delete them                    |

### Logic

```text id="n0z8hk"
Search logs
     ↓
Find files older than 30 days
     ↓
Delete them automatically
```

### Example

Before:

```text id="yxjsli"
app.log        (45 days old)
nginx.log      (10 days old)
error.log      (35 days old)
```

After:

```text id="sfdx3o"
nginx.log
```

### Production Use Case

A server alert appears:

```text id="uxkhhc"
Disk Usage: 95%
```

Run:

```bash id="94n3mg"
find /var/log -name "*.log" -mtime +30 -delete
```

### Why It Matters

* Log rotation
* Automatic cleanup
* Prevents disk exhaustion
* Used in cron jobs

---

## 2. Count All Log Lines

### Command

```bash id="sb4icm"
wc -l *.log
```

### Breakdown

| Part    | Meaning       |
| ------- | ------------- |
| `wc`    | Word Count    |
| `-l`    | Count lines   |
| `*.log` | All log files |

### Example Output

```text id="ljsltx"
app.log       500
nginx.log    1000
error.log     200
--------------
1700 total
```

### Production Use

Useful for answering:

> "How many log entries were generated today?"

---

## 3. Replace Text

### Command

```bash id="h3s5yw"
sed -i 's/http/https/g' file.txt
```

### Command Breakdown

| Part    | Meaning                 |
| ------- | ----------------------- |
| `sed`   | Stream Editor           |
| `-i`    | Edit file directly      |
| `s`     | Substitute              |
| `http`  | Old text                |
| `https` | New text                |
| `g`     | Replace all occurrences |

### Logic

```text id="p2x63s"
Read file
     ↓
Find "http"
     ↓
Replace with "https"
     ↓
Save changes
```

### Example

#### Before

```text id="k7e5wx"
http://example.com
http://api.example.com
```

#### Command

```bash id="4dgf3l"
sed -i 's/http/https/g' urls.txt
```

#### After

```text id="skl7h1"
https://example.com
https://api.example.com
```

### Production Use Case

Suppose your organization has migrated to SSL.

Instead of manually editing hundreds of files:

```bash id="s11szw"
sed -i 's/http/https/g' nginx.conf
```

### Why It Matters

* Configuration updates
* Automated migrations
* Bulk text replacement
* Infrastructure automation

---

## 4. Check Service Status

### Command

```bash id="x8b7yk"
systemctl status nginx
```

### Logic

```text id="hr4cng"
Website Down
      ↓
Check service
      ↓
Running?
Stopped?
Failed?
```

### Example Output

```text id="93j5cx"
Active: active (running)
```

or

```text id="x80dd6"
Active: failed
```

### Why It Matters

This is usually the first command used during a production incident.

---

## 5. Monitor Errors in Real Time

### Command

```bash id="v4ocp6"
tail -f app.log | grep ERROR
```

### Breakdown

| Part         | Meaning                          |
| ------------ | -------------------------------- |
| `tail -f`    | Follow the log file in real time |
| `grep ERROR` | Display only error messages      |

### Logic

```text id="2mwr5h"
Watch logs
     ↓
Filter errors
     ↓
Show only failures
```

### Example Output

```text id="hquq4d"
ERROR Database Timeout
ERROR Connection Refused
ERROR Service Unavailable
```

### Why It Matters

Used during:

* Deployments
* Production incidents
* Monitoring
* Debugging applications

---

# Step 8: Error Handling

Professional Shell Scripts always include proper error handling.

---

## Exit Codes

Every Linux command returns an exit code.

### Check Exit Code

```bash id="j5s8tl"
echo $?
```

### Meaning

| Exit Code | Meaning |
| --------- | ------- |
| `0`       | Success |
| Non-zero  | Failure |

---

### Example

```bash id="6ed0my"
mkdir test
echo $?
```

Output:

```text id="n8nkjr"
0
```

---

### Failed Example

```bash id="m6qmy6"
cd does_not_exist
echo $?
```

Output:

```text id="i6ug2k"
1
```

### Logic

```text id="g1s3cg"
Command runs
      ↓
Linux returns a number
      ↓
0 = Success
1+ = Failure
```

---

## `exit 0`

### Meaning

```bash id="bfb9du"
exit 0
```

> The script completed successfully.

---

## `exit 1`

### Meaning

```bash id="cyhrho"
exit 1
```

> The script failed.

### Example

```bash id="hwr94o"
if [ ! -f backup.tar.gz ]
then
    echo "Backup not found!"
    exit 1
fi
```

---

# Strict Mode

Most production shell scripts begin with:

```bash id="djlwkt"
set -euo pipefail
```

---

## `set -e`

### Meaning

```bash id="thn9pg"
set -e
```

Exit immediately if any command fails.

### Example

```bash id="0f2oww"
mkdir test
cd missing_directory
echo "Hello"
```

Without `set -e`:

```text id="jlwmk0"
Error
Hello
```

With `set -e`:

```text id="jlwmk1"
Error
```

### Logic

```text id="jlwmk2"
Command fails
      ↓
Stop script immediately
```

---

## `set -u`

### Meaning

```bash id="jlwmk3"
set -u
```

Treat undefined variables as errors.

Example:

```bash id="jlwmk4"
echo $USERNAME
```

Output:

```text id="jlwmk5"
unbound variable
```

Useful for catching typos.

---

## `set -o pipefail`

### Meaning

```bash id="jlwmk6"
set -o pipefail
```

If any command in a pipeline fails, the entire pipeline fails.

Example:

```bash id="jlwmk7"
cat missing.txt | grep Raj
```

### Logic

```text id="jlwmk8"
cmd1 | cmd2 | cmd3
  ↓
If cmd1 fails
  ↓
Entire pipeline fails
```

---

## `set -x`

### Meaning

```bash id="jlwmk9"
set -x
```

Print every command before execution.

Example:

```text id="jlwmk10"
+ mkdir test
+ cd test
+ echo Hello
```

Useful for debugging shell scripts.

---

# Trap

The `trap` command allows you to catch signals and execute commands before a script exits.

### Basic Example

```bash id="jlwmk11"
trap 'echo "Cleanup"' EXIT
```

### Breakdown

| Part               | Meaning                 |
| ------------------ | ----------------------- |
| `trap`             | Catch signal            |
| `'echo "Cleanup"'` | Execute this command    |
| `EXIT`             | Run before script exits |

### Logic

```text id="jlwmk12"
Script starts
      ↓
Script finishes
      ↓
Run cleanup command
```

---

## Trap with Ctrl+C

### Command

```bash id="jlwmk13"
trap 'echo "Script stopped!"' SIGINT
```

### Breakdown

| Part                       | Meaning              |
| -------------------------- | -------------------- |
| `trap`                     | Catch signal         |
| `'echo "Script stopped!"'` | Execute this command |
| `SIGINT`                   | Ctrl+C signal        |

### Example

```bash id="jlwmk14"
#!/bin/bash

trap 'echo "Script stopped!"' SIGINT

while true
do
    echo "Running..."
    sleep 1
done
```

Press:

```text id="jlwmk15"
Ctrl+C
```

Output:

```text id="jlwmk16"
Script stopped!
```

### Logic

```text id="jlwmk17"
User presses Ctrl+C
       ↓
SIGINT received
       ↓
trap executes
       ↓
Print message
```

---

## Real Production Example

```bash id="jlwmk18"
#!/bin/bash

TEMP=$(mktemp)

trap 'rm -f "$TEMP"' EXIT

echo "Processing..."
```

### Logic

```text id="jlwmk19"
Create temporary file
         ↓
Run script
         ↓
Script exits
         ↓
Delete temporary file
```

---

# Production Troubleshooting Flow

```text id="jlwmk20"
Application Down
       ↓
systemctl status
       ↓
tail -f app.log | grep ERROR
       ↓
Check exit codes
       ↓
Review script logs
       ↓
Fix issue
```

---

# Commands Every DevOps Engineer Should Know

```bash id="jlwmk21"
find /var/log -name "*.log" -mtime +30 -delete

wc -l *.log

sed -i 's/http/https/g' file.txt

systemctl status nginx

tail -f app.log | grep ERROR

echo $?

exit 0
exit 1

set -e
set -u
set -o pipefail
set -x

trap 'echo Cleanup' EXIT

trap 'echo "Script stopped!"' SIGINT
```

---

# Final Thoughts

Linux one-liners help DevOps engineers solve problems quickly.

Error handling ensures shell scripts behave predictably and safely.

```text id="jlwmk22"
One-Liners:
    Work faster.

Exit Codes:
    Know if commands succeeded.

Strict Mode:
    Prevent hidden failures.

Trap:
    Perform cleanup before exiting.
```

The difference between a beginner shell script and a production-ready shell script is usually just a few lines:

```bash id="jlwmk23"
#!/bin/bash

set -euo pipefail

trap 'echo "Script Finished"' EXIT
```

Master these concepts, and you'll be writing safer, cleaner, and production-ready automation scripts like experienced DevOps engineers.

