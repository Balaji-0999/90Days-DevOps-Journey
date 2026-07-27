# AWK for Linux and DevOps

AWK is one of the most powerful text-processing tools available in Linux. It is widely used by Linux administrators, Shell Scripting enthusiasts, and DevOps engineers for parsing command outputs, filtering logs, generating reports, and automating monitoring tasks.

If you're pursuing a career in DevOps, mastering AWK is essential because you'll use it daily with tools like Docker, Kubernetes, Jenkins, Nginx, and various Linux utilities.

---

## AWK Golden Rule

```bash
awk 'condition {action}' file
```

Or:

```bash
command | awk 'condition {action}'
```

> Think of AWK as:
>
> - **Condition** → Decide which lines to process.
> - **Action** → Decide what to do with those lines.

---

## Basic AWK Examples

### 1. Print the First Column

```bash
awk '{print $1}' file
```

### Input

```text
Raj Linux
Amit Docker
Rohit Kubernetes
```

### Output

```text
Raj
Amit
Rohit
```

---

### 2. Print Multiple Columns

```bash
awk '{print $1,$2}'
```

### Output

```text
Raj Linux
Amit Docker
Rohit Kubernetes
```

---

### 3. Print the Entire Line

```bash
awk '{print $0}'
```

- `$0` = Entire line

---

### 4. Print the Last Column

```bash
awk '{print $NF}'
```

### Input

```text
Raj Linux AWS
```

### Output

```text
AWS
```

- `NF` = Number of Fields

---

### 5. Print Line Numbers

```bash
awk '{print NR,$0}'
```

### Output

```text
1 Raj Linux
2 Amit Docker
3 Rohit Kubernetes
```

| Variable | Meaning |
|----------|---------|
| `NR` | Record Number (line number) |
| `NF` | Number of Fields |
| `$0` | Entire line |

---

### 6. Print Specific Lines

```bash
awk 'NR==2'
```

Output:

```text
Amit Docker
```

Print a range of lines:

```bash
awk 'NR==1,NR==3'
```

Output:

```text
Raj Linux
Amit Docker
Rohit Kubernetes
```

---

### 7. Search Patterns

```bash
awk '/Docker/'
```

Output:

```text
Amit Docker
```

Equivalent:

```bash
awk '$2=="Docker"'
```

---

## Comparison Operators

### Greater Than

```bash
awk '$2 > 100'
```

### Less Than

```bash
awk '$2 < 100'
```

### Greater Than or Equal To

```bash
awk '$2 >= 100'
```

### Less Than or Equal To

```bash
awk '$2 <= 50'
```

### Not Equal

```bash
awk '$1 != "Raj"'
```

---

## Logical Operators

### AND

```bash
awk '$2 > 50 && $2 < 200'
```

### OR

```bash
awk '$1=="Raj" || $1=="Rohit"'
```

---

## Mathematical Operations

### Sum

```bash
awk '{sum+=$2} END {print sum}'
```

### Output

```text
350
```

---

### Average

```bash
awk '{sum+=$2} END {print sum/NR}'
```

### Output

```text
116.66
```

---

### Maximum Value

```bash
awk 'max<$2 {max=$2} END {print max}'
```

### Output

```text
200
```

---

### Minimum Value

```bash
awk 'min==0 || $2<min {min=$2} END {print min}'
```

### Output

```text
50
```

---

## Count Information

### Count Lines

```bash
awk 'END {print NR}'
```

### Count Fields

```bash
awk '{print NF}'
```

---

## Using Custom Delimiters

AWK uses spaces as the default delimiter. You can change it using `-F`.

### Example

```bash
awk -F: '{print $1}' /etc/passwd
```

### Input

```text
root:x:0:0
ubuntu:x:1000:1000
```

### Output

```text
root
ubuntu
```

---

## BEGIN and END Blocks

### BEGIN

```bash
awk 'BEGIN {print "REPORT"}'
```

Output:

```text
REPORT
```

---

### END

```bash
awk 'END {print "Done"}' file
```

Output:

```text
Done
```

---

### BEGIN + Main + END

```bash
awk '
BEGIN {print "START"}

{print $1}

END {print "FINISH"}'
```

### Output

```text
START
Raj
Amit
Rohit
FINISH
```

---

# Linux + DevOps Use Cases

## 1. Check Available Disk Space

```bash
df -h | awk '$6=="/" {print $4}'
```

### Output

```text
16G
```

---

## 2. Check Memory Usage

```bash
free -h | awk '/Mem/ {print $3}'
```

### Output

```text
2.4Gi
```

---

## 3. Check CPU Load

```bash
uptime | awk '{print $10}'
```

---

## 4. Show Logged-in Users

```bash
who | awk '{print $1}'
```

---

## 5. List Running Processes

```bash
ps aux | awk '{print $11}'
```

---

## 6. Top Memory-Consuming Processes

```bash
ps aux --sort=-%mem | awk '{print $11,$4}'
```

### Example Output

```text
COMMAND %MEM
chrome 20.1
docker 5.4
```

---

## 7. Generate a User Report

```bash
awk -F: '{print $1}' /etc/passwd
```

---

## 8. List Docker Containers

```bash
docker ps | awk '{print $NF}'
```

### Example Output

```text
NAMES
web
database
redis
```

---

## 9. List Kubernetes Pods

```bash
kubectl get pods | awk '{print $1}'
```

---

## 10. Find Failed Pods

```bash
kubectl get pods | awk '$3=="CrashLoopBackOff"'
```

---

## 11. Analyze Jenkins Logs

```bash
awk '/FAILED/' build.log
```

---

## 12. Analyze Nginx Access Logs

Get all IP addresses:

```bash
awk '{print $1}' access.log
```

Get unique IPs:

```bash
awk '{print $1}' access.log | sort | uniq
```

---

## 13. Count HTTP Status Codes

```bash
awk '{print $9}' access.log | sort | uniq -c
```

### Example Output

```text
100 200
20 404
5 500
```

---

## 14. Print Environment Variables

```bash
env | awk -F= '{print $1}'
```

---

## 15. List Running Services

```bash
systemctl list-units --type=service | awk '{print $1}'
```

---

# Most Useful AWK Conditions

```bash
awk '$1=="Linux"'
awk '$2>50'
awk '$2<100'
awk '$2>=100'
awk '$2<=50'
awk '$1!="Raj"'
awk '$1=="Raj" && $2>50'
awk '$1=="Raj" || $1=="Amit"'
awk 'NR==1'
awk 'NR>5'
awk 'NF==3'
awk '/error/'
awk '/warning/'
awk '/failed/'
```

---

# Shell Script Examples

## Disk Monitoring Script

```bash
#!/bin/bash

AVAILABLE=$(df -h | awk '$6=="/" {print $4}')

echo "Available Space: $AVAILABLE"
```

---

## Check if a User Exists

```bash
#!/bin/bash

if id "$1" &>/dev/null
then
    echo "User Found"
fi
```

---

## Memory Monitoring Script

```bash
#!/bin/bash

MEM=$(free -h | awk '/Mem/ {print $3}')

echo "Memory Used: $MEM"
```

---

## Docker Monitoring Script

```bash
#!/bin/bash

docker ps | awk '{print $NF}'
```

---

# Top 10 AWK Commands Every DevOps Engineer Should Know

```bash
awk '{print $1}'
awk '{print $NF}'
awk '{print NR,$0}'
awk 'NR==2'
awk '/error/'
awk '$2>100'
awk -F:
awk '{sum+=$2} END {print sum}'
awk 'END {print NR}'
awk '{print NF}'
```

---

# AWK in DevOps

| DevOps Task | AWK Usage |
|-------------|------------|
| Disk Monitoring | `df -h` |
| Memory Monitoring | `free -h` |
| Process Monitoring | `ps aux` |
| Docker Monitoring | `docker ps` |
| Kubernetes | `kubectl get pods` |
| Log Analysis | `access.log` |
| CI/CD Pipelines | `build.log` |
| User Management | `/etc/passwd` |
| Service Monitoring | `systemctl` |

---

## AWK vs SED

| Tool | Purpose |
|------|---------|
| `awk` | Extract and process information from text |
| `sed` | Modify and replace text |

> **Remember:** `sed` changes text, while `awk` extracts information from text.

---

## Why DevOps Engineers Love AWK

AWK is heavily used for:

- Parsing Linux command outputs
- Monitoring servers
- Log analysis
- Writing shell scripts
- Generating reports
- Processing Docker outputs
- Parsing Kubernetes resources
- Automating CI/CD tasks
- Troubleshooting production issues

---

## Final Thoughts

AWK is often called the **Swiss Army Knife of Linux** because it allows you to:

- Search text
- Filter data
- Perform calculations
- Generate reports
- Parse logs
- Monitor systems
- Automate repetitive tasks

Mastering AWK will make you significantly more productive as a Linux Administrator, Shell Scripter, and DevOps Engineer.
