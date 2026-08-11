# 🐚 Shell Scripting Revision – Day 28

Shell scripting allows us to automate tasks in Linux using a shell such as **Bash**.

A shell script is a text file containing commands that the shell executes in sequence.

A typical Bash script starts with:

```bash
#!/bin/bash
```

The `#!` line is called the **shebang**. It tells the system which interpreter should execute the script.

---

# 1. Variables, Arguments and User Input

## 📦 Variables

Variables store values that can be used later in a script.

Example:

```bash
#!/bin/bash

name="Balaji"
age=26

echo "Name: $name"
echo "Age: $age"
```

### Important Rule

There should be **no spaces** around `=` when assigning a variable.

Correct:

```bash
name="Balaji"
```

Incorrect:

```bash
name = "Balaji"
```

Read a variable using `$`:

```bash
echo "$name"
```

---

## 🧑‍💻 User Input

The `read` command gets input from the user.

```bash
#!/bin/bash

read -p "Enter your name: " name

echo "Hello $name"
```

Example:

```text
Enter your name: Balaji
Hello Balaji
```

### Useful `read` Options

```bash
read -p "Enter name: " name
```

`-p` displays a prompt.

For sensitive input such as a password:

```bash
read -s -p "Enter password: " password
echo
```

`-s` prevents the typed characters from being displayed.

---

# 🥇 Command-Line Arguments

Arguments are values passed to a script when executing it.

Example script:

```bash
#!/bin/bash

echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "Number of arguments: $#"
echo "All arguments: $@"
```

Run:

```bash
./script.sh Linux DevOps
```

Output:

```text
Script name: ./script.sh
First argument: Linux
Second argument: DevOps
Number of arguments: 2
All arguments: Linux DevOps
```

### Important Special Variables

| Variable | Meaning                         |
| -------- | ------------------------------- |
| `$0`     | Script name                     |
| `$1`     | First argument                  |
| `$2`     | Second argument                 |
| `$#`     | Number of arguments             |
| `$@`     | All arguments                   |
| `$?`     | Exit status of previous command |
| `$$`     | PID of current shell            |

---

## 🔐 Quote Variables

Prefer:

```bash
echo "$name"
```

instead of:

```bash
echo $name
```

Quoting variables helps prevent unwanted word splitting and pathname expansion.

---

# 2. if / elif / else and case Statements

Conditional statements allow a script to make decisions.

---

## 🔀 if Statement

Example:

```bash
#!/bin/bash

age=20

if [ "$age" -ge 18 ]; then
    echo "Adult"
fi
```

The condition is true because `20` is greater than or equal to `18`.

---

## if / else

```bash
#!/bin/bash

age=16

if [ "$age" -ge 18 ]; then
    echo "Adult"
else
    echo "Minor"
fi
```

---

## if / elif / else

```bash
#!/bin/bash

marks=75

if [ "$marks" -ge 90 ]; then
    echo "Grade A+"
elif [ "$marks" -ge 75 ]; then
    echo "Grade A"
elif [ "$marks" -ge 60 ]; then
    echo "Grade B"
else
    echo "Needs improvement"
fi
```

---

## Common Numeric Operators

```text
-eq   → equal
-ne   → not equal
-gt   → greater than
-ge   → greater than or equal
-lt   → less than
-le   → less than or equal
```

Example:

```bash
if [ "$age" -ge 18 ]; then
    echo "Allowed"
fi
```

---

## String Conditions

```bash
name="Balaji"

if [ "$name" = "Balaji" ]; then
    echo "Name matched"
fi
```

Common operators:

```text
=      → equal
!=     → not equal
-z     → string is empty
-n     → string is not empty
```

---

## 📁 File Conditions

Check if a file exists:

```bash
if [ -f "app.log" ]; then
    echo "File exists"
fi
```

Check directory:

```bash
if [ -d "/var/log" ]; then
    echo "Directory exists"
fi
```

Useful tests:

```text
-f → regular file
-d → directory
-e → path exists
-r → readable
-w → writable
-x → executable
```

---

# 🎯 case Statement

`case` is useful when comparing one value against multiple patterns.

Example:

```bash
#!/bin/bash

read -p "Enter environment: " env

case "$env" in
    dev)
        echo "Development environment"
        ;;
    test)
        echo "Testing environment"
        ;;
    prod)
        echo "Production environment"
        ;;
    *)
        echo "Unknown environment"
        ;;
esac
```

The `*` acts as the default case.

### Structure

```bash
case "$variable" in
    pattern1)
        commands
        ;;
    pattern2)
        commands
        ;;
    *)
        default commands
        ;;
esac
```

---

# 3. for, while and until Loops

Loops allow us to execute commands repeatedly.

---

# 🔁 for Loop

A `for` loop is commonly used when iterating over a known list of items.

```bash
#!/bin/bash

for name in Linux Docker AWS Git
do
    echo "Learning $name"
done
```

Output:

```text
Learning Linux
Learning Docker
Learning AWS
Learning Git
```

---

## Loop Through Files

```bash
for file in *.log
do
    echo "Processing: $file"
done
```

---

## C-style for Loop

```bash
for ((i=1; i<=5; i++))
do
    echo "Number: $i"
done
```

Output:

```text
Number: 1
Number: 2
Number: 3
Number: 4
Number: 5
```

---

# 🔄 while Loop

A `while` loop continues while its condition is true.

```bash
#!/bin/bash

count=1

while [ "$count" -le 5 ]
do
    echo "Count: $count"
    ((count++))
done
```

Output:

```text
Count: 1
Count: 2
Count: 3
Count: 4
Count: 5
```

---

# 🔃 until Loop

An `until` loop continues until its condition becomes true.

```bash
#!/bin/bash

count=1

until [ "$count" -gt 5 ]
do
    echo "Count: $count"
    ((count++))
done
```

### Easy Difference

```text
for
→ iterate over a list/range

while
→ run while condition is TRUE

until
→ run until condition becomes TRUE
```

---

# 4. Functions with Arguments and Return Values

Functions allow us to group reusable commands.

---

## 🧩 Define a Function

```bash
hello() {
    echo "Hello from function"
}
```

Call it:

```bash
hello
```

---

## Function with Arguments

```bash
greet() {
    echo "Hello $1"
}

greet "Balaji"
```

Output:

```text
Hello Balaji
```

Inside a function:

```text
$1 → first function argument
$2 → second function argument
```

---

## Multiple Arguments

```bash
add() {
    local a="$1"
    local b="$2"

    echo "$((a + b))"
}

add 10 20
```

Output:

```text
30
```

`local` creates variables scoped to the function.

---

# ↩️ Return Values in Bash

Bash functions normally return an **exit status**, not a normal data value.

Example:

```bash
check_file() {
    if [ -f "$1" ]; then
        return 0
    else
        return 1
    fi
}
```

Use it:

```bash
if check_file "notes.txt"; then
    echo "File exists"
else
    echo "File does not exist"
fi
```

Important:

```text
0   → success
non-zero → failure
```

---

## Capture Function Output

If you want a function to produce a value, command substitution is often used:

```bash
get_name() {
    echo "Balaji"
}

name=$(get_name)

echo "$name"
```

This is different from:

```bash
return 0
```

because `return` is for an exit status.

### Important Difference

```text
return 0
→ return success status

echo "value"
→ produce output

value=$(function)
→ capture function output
```

---

# 5. Text Processing – grep, awk, sed, sort and uniq

Linux provides powerful text-processing tools.

---

# 🔎 grep

`grep` searches text for matching patterns.

Example:

```bash
grep "ERROR" app.log
```

Search case-insensitively:

```bash
grep -i "error" app.log
```

Show line numbers:

```bash
grep -n "ERROR" app.log
```

Count matches:

```bash
grep -c "ERROR" app.log
```

Invert the match:

```bash
grep -v "INFO" app.log
```

### Example

```bash
grep "Failed" /var/log/auth.log
```

This searches for lines containing `Failed`.

---

# 🧮 awk

`awk` is useful for field-based text processing.

Example file:

```text
Balaji DevOps 90
Rahul Linux 85
Aman AWS 95
```

Print the first column:

```bash
awk '{print $1}' students.txt
```

Output:

```text
Balaji
Rahul
Aman
```

Print first and third columns:

```bash
awk '{print $1, $3}' students.txt
```

Output:

```text
Balaji 90
Rahul 85
Aman 95
```

### Useful awk Variables

```text
$1       → first field
$2       → second field
$NF      → last field
NR       → current record/line number
NF       → number of fields
```

Example:

```bash
awk '{print NR, $1}' students.txt
```

---

# ✏️ sed

`sed` is commonly used to search and replace text.

Example:

```bash
sed 's/old/new/' file.txt
```

Replace only the first match on each line.

Replace all matches on each line:

```bash
sed 's/old/new/g' file.txt
```

Delete lines containing a pattern:

```bash
sed '/ERROR/d' app.log
```

Print specific lines:

```bash
sed -n '1,5p' file.txt
```

### Important

By default, `sed` prints the modified result to standard output rather than changing the original file.

To modify the file in place on GNU/Linux:

```bash
sed -i 's/old/new/g' file.txt
```

---

# 🔢 sort

Sorts lines.

```bash
sort names.txt
```

Reverse order:

```bash
sort -r names.txt
```

Numeric sort:

```bash
sort -n numbers.txt
```

---

# 🔁 uniq

`uniq` removes **adjacent duplicate lines**.

Example:

```text
apple
apple
banana
banana
orange
```

Run:

```bash
uniq fruits.txt
```

Output:

```text
apple
banana
orange
```

### Important

`uniq` normally works on adjacent duplicates.

Therefore, to count all duplicates regardless of their original position:

```bash
sort fruits.txt | uniq -c
```

Example output:

```text
2 apple
2 banana
1 orange
```

---

# 🔗 Combining Text Tools

The real power comes from pipelines.

Example:

```bash
grep "ERROR" app.log | awk '{print $5}' | sort | uniq -c
```

Conceptually:

```text
app.log
   ↓
grep
   ↓
ERROR lines
   ↓
awk
   ↓
extract field
   ↓
sort
   ↓
group duplicates
   ↓
uniq -c
   ↓
count occurrences
```

This is extremely useful for log analysis.

---

# 6. Error Handling with set -e, set -u, pipefail and trap

Good shell scripts should handle failures properly.

A common Bash strict-mode setup is:

```bash
set -euo pipefail
```

---

# 🛑 set -e

`set -e` causes the script to exit when a command returns a non-zero status in situations where Bash treats that status as an unhandled failure.

Example:

```bash
#!/bin/bash

set -e

echo "Starting"

false

echo "This will normally not execute"
```

The `false` command returns a non-zero status, so the script exits.

### Easy Meaning

```text
-e
↓
Stop when an unhandled command fails
```

> Bash has specific contexts where `-e` does not cause an immediate exit, so it should not be treated as a simple “exit on every possible error” switch.

---

# 🚫 set -u

`set -u` treats references to unset variables as errors.

Example:

```bash
#!/bin/bash

set -u

echo "$username"
```

If `username` was never defined, Bash reports an error.

Safer example:

```bash
name="${USERNAME:-unknown}"

echo "$name"
```

### Easy Meaning

```text
-u
↓
Catch unset variables
```

---

# 🔗 set -o pipefail

Normally, the exit status of a pipeline is based on the last command.

Example:

```bash
command1 | command2 | command3
```

With:

```bash
set -o pipefail
```

the pipeline can fail if an earlier command fails.

Example:

```bash
set -o pipefail

false | true
```

The pipeline returns a failure status because `false` failed.

### Easy Meaning

```text
pipefail
↓
Don't hide failures inside pipelines
```

---

# 🪤 trap

`trap` allows a script to react to signals or shell events.

Example:

```bash
trap 'echo "Script interrupted"' INT
```

Pressing:

```text
Ctrl + C
```

causes the `INT` trap to run.

---

## Cleanup with trap

A common DevOps use case is cleaning temporary files.

```bash
#!/bin/bash

tmp_file=$(mktemp)

cleanup() {
    rm -f "$tmp_file"
}

trap cleanup EXIT

echo "Working..."
```

When the script exits, the cleanup function runs.

### Useful Signals/Events

```text
INT   → interrupt, commonly Ctrl+C
TERM  → termination request
EXIT  → shell exits
ERR   → a command returns non-zero status in supported contexts
```

---

# 🛡️ Bash Strict Mode

A common starting point for production-style Bash scripts is:

```bash
#!/bin/bash

set -euo pipefail
```

Meaning:

```text
-e
→ stop on unhandled command failure

-u
→ catch unset variables

-o pipefail
→ catch failures inside pipelines
```

And `trap` can be added for cleanup/error reporting:

```bash
trap 'echo "Script failed or exited"' EXIT
```

A more practical cleanup example:

```bash
#!/bin/bash

set -euo pipefail

tmp_dir=$(mktemp -d)

cleanup() {
    rm -rf "$tmp_dir"
}

trap cleanup EXIT

echo "Temporary directory: $tmp_dir"
```

---

# 7. Schedule Scripts with crontab

`cron` is a time-based job scheduler commonly used for recurring tasks.

`crontab` stores scheduled jobs for a user.

---

# ⏰ Open Crontab

```bash
crontab -e
```

View current cron jobs:

```bash
crontab -l
```

---

# 📅 Cron Format

A standard user crontab entry has five time fields:

```text
┌──────── minute (0-59)
│ ┌────── hour (0-23)
│ │ ┌──── day of month (1-31)
│ │ │ ┌── month (1-12)
│ │ │ │ ┌ day of week (0-7)
│ │ │ │ │
* * * * *
```

Then comes the command.

---

# 🌙 Run Script Every Day at 3 AM

```cron
0 3 * * * /home/ubuntu/backup.sh
```

Meaning:

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

---

# ⏱️ Common Cron Examples

Every minute:

```cron
* * * * * /path/to/script.sh
```

Every hour:

```cron
0 * * * * /path/to/script.sh
```

Every day at 3 AM:

```cron
0 3 * * * /path/to/script.sh
```

Every Sunday at 2 AM:

```cron
0 2 * * 0 /path/to/script.sh
```

Every 5 minutes:

```cron
*/5 * * * * /path/to/script.sh
```

Every Monday at 9 AM:

```cron
0 9 * * 1 /path/to/script.sh
```

---

# 📝 Cron Logging

It is often useful to redirect output to a log file.

```cron
0 3 * * * /home/ubuntu/backup.sh >> /home/ubuntu/backup.log 2>&1
```

Meaning:

```text
>> backup.log
→ append standard output

2>&1
→ send standard error to the same destination
```

So both normal output and errors are logged.

---

# 🔐 Make Script Executable

Before scheduling:

```bash
chmod +x /home/ubuntu/backup.sh
```

Test it manually first:

```bash
/home/ubuntu/backup.sh
```

Then add it to cron.

This is important because cron runs with a different environment from your interactive terminal.

Use absolute paths inside cron jobs whenever practical.

---

# 🧠 Shell Scripting Complete Cheat Sheet

## Script

```bash
#!/bin/bash
```

## Variables

```bash
name="Balaji"
echo "$name"
```

## User Input

```bash
read -p "Enter name: " name
```

## Arguments

```bash
$0
$1
$2
$#
$@
$?
```

## Conditions

```bash
if [ "$x" -eq 10 ]; then
    echo "Equal"
elif [ "$x" -gt 10 ]; then
    echo "Greater"
else
    echo "Smaller"
fi
```

## case

```bash
case "$choice" in
    start)
        echo "Starting"
        ;;
    stop)
        echo "Stopping"
        ;;
    *)
        echo "Unknown option"
        ;;
esac
```

## for

```bash
for item in one two three
do
    echo "$item"
done
```

## while

```bash
while [ "$count" -lt 5 ]
do
    echo "$count"
    ((count++))
done
```

## until

```bash
until [ "$count" -ge 5 ]
do
    echo "$count"
    ((count++))
done
```

## Function

```bash
greet() {
    echo "Hello $1"
}

greet "Balaji"
```

## Return Status

```bash
return 0
```

```text
0     → success
non-0 → failure
```

## Text Processing

```bash
grep "ERROR" app.log
awk '{print $1}' file.txt
sed 's/old/new/g' file.txt
sort file.txt
uniq file.txt
```

## Error Handling

```bash
set -e
set -u
set -o pipefail
set -euo pipefail
```

## Trap

```bash
trap 'echo "Interrupted"' INT
```

## Cron

```bash
crontab -e
crontab -l
```

Daily at 3 AM:

```cron
0 3 * * * /path/to/script.sh
```

---

# 🔥 Important Shell Scripting Differences

```text
Variable
────────
name="Balaji"
→ stores data


Argument
────────
./script.sh Linux
→ Linux becomes $1


User Input
──────────
read -p "Name: " name
→ waits for user input


Function
────────
greet() { ... }
→ reusable block of commands


return
──────
return 0
→ returns an exit status


echo
────
echo "Hello"
→ produces output


grep
────
→ searches text


awk
───
→ processes fields/columns


sed
───
→ transforms text


sort
────
→ sorts lines


uniq
────
→ removes/counts adjacent duplicate lines


set -e
──────
→ stop on unhandled command failure


set -u
──────
→ catch unset variables


pipefail
────────
→ catch failures in pipelines


trap
────
→ react to signals/events and perform cleanup


cron
────
→ schedule recurring jobs
```

---

# 🚀 DevOps Shell Scripting Workflow

A practical DevOps script often follows this structure:

```text
             Bash Script
                  │
                  ↓
        ┌───────────────────┐
        │ Variables / Input │
        └─────────┬─────────┘
                  ↓
             Validation
                  ↓
             Conditions
                  ↓
              Functions
                  ↓
             Main Task
                  ↓
        ┌───────────────────┐
        │ Error Handling    │
        │ set -euo pipefail │
        │ trap              │
        └─────────┬─────────┘
                  ↓
              Logging
                  ↓
              Exit Status
                  ↓
              Cron Job
```

---

# 🎯 Final Revision

After completing this Shell Scripting revision, I can:

* Write Bash scripts using variables
* Accept user input using `read`
* Work with command-line arguments
* Use `if`, `elif`, `else`, and `case`
* Write `for`, `while`, and `until` loops
* Create functions and pass arguments
* Understand Bash exit statuses
* Use `grep`, `awk`, `sed`, `sort`, and `uniq`
* Build pipelines for log processing
* Use `set -e`, `set -u`, and `set -o pipefail`
* Use `trap` for signals and cleanup
* Schedule automated tasks with `crontab`
* Write safer automation scripts for DevOps tasks

## 🏆 Key Lesson

Shell scripting is not about memorizing commands. The real goal is to combine Linux commands with **variables, conditions, loops, functions, text processing, error handling, and scheduling** to automate repetitive work.

```text
Linux Commands
      +
Bash Logic
      +
Error Handling
      +
Automation
      ↓
Reliable DevOps Scripts
```

**Shell Scripting Revision – Day 28 ✅**

#90DaysOfDevOps
#DevOpsKaJosh
#TrainWithShubham

