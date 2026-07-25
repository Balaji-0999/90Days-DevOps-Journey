# Day 06 – Linux Fundamentals: Read and Write Text Files

## Objective

The goal of today's practice was to understand how to create, write, append, and read text files using basic Linux commands.

---

# Commands Practiced

## 1. Create a Markdown file

```bash
touch file-io-practice.md
```

**Purpose:**
Creates an empty Markdown file for documenting today's practice.

---

## 2. Create a text file and write the first line

```bash
echo "Linux is the foundation of DevOps." > notes.txt
```

**Purpose:**
Creates `notes.txt` (if it doesn't exist) and writes the first line.
The `>` operator overwrites any existing content.

---

## 3. Append a second line

```bash
echo "Git helps track code changes." >> notes.txt
```

**Purpose:**
Appends a new line to the file without deleting existing content.

---

## 4. Append using tee

```bash
echo "Docker packages applications into containers." | tee -a notes.txt
```

**Purpose:**
Displays the text on the terminal and appends it to the file simultaneously.

---

## 5. Read the complete file

```bash
cat notes.txt
```

**Purpose:**
Displays the entire contents of the file.

---

## 6. Read the first two lines

```bash
head -n 2 notes.txt
```

**Purpose:**
Displays the first two lines of the file.

---

## 7. Read the last two lines

```bash
tail -n 2 notes.txt
```

**Purpose:**
Displays the last two lines of the file.

----

# Output

```text
Linux is the foundation of DevOps.
Git helps track code changes.
Docker packages applications into containers.
```

---

# Key Learnings

- Learned how to create a text file.
- Understood the difference between `>` and `>>`.
- Learned how `tee` writes to a file while displaying output.
- Practiced reading a complete file using `cat`.
- Learned how to view only the beginning or end of a file using `head` and `tail`.
- Understood that text files are commonly used for logs, configuration files, scripts, and documentation in DevOps.

---

# Conclusion

Today's practice strengthened my understanding of Linux file input/output operations. These commands are essential for managing configuration files, log files, and automation scripts in real-world DevOps environments.

---

**Day 06 Completed ✅**
