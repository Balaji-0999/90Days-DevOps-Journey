# Git Basics – Interview Questions and Answers

This document covers some fundamental Git concepts that every beginner and DevOps engineer should understand. These questions are commonly asked during interviews and are essential for working with Git in real-world projects.

---

## Q1. What is the difference between `git add` and `git commit`?

### Answer

* `git add` moves changes from the Working Directory to the Staging Area.
* `git commit` permanently saves the staged changes in the Git repository along with a commit message.

### Example

```bash
git add .
git commit -m "Add README file"
```

### Workflow

```text
Working Directory --> Staging Area --> Repository
       git add            git commit
```

---

## Q2. What is the Staging Area?

### Answer

The Staging Area is a temporary place where developers choose which changes will be included in the next commit. It allows changes to be reviewed, organized, and prepared before they are permanently saved.

### Why is it Important?

* Helps organize commits.
* Allows selective commits.
* Provides an opportunity to review changes before saving them.

---

## Q3. What does `git log` show?

### Answer

The `git log` command displays the commit history of a repository.

It includes:

* Commit ID (SHA hash)
* Author name
* Date and time
* Commit message

### Example

```bash
git log
```

### Sample Output

```text
commit a1b2c3d4...
Author: Raj Kumar
Date: Tue Jul 28 2026

    Initial Commit
```

---

## Q4. What is the `.git` folder?

### Answer

The `.git` folder is Git's internal database. It contains all the information required to manage a repository, including:

* Commits
* Branches
* Tags
* Configuration files
* References
* Hooks
* Complete project history

> **Important:** If the `.git` folder is deleted, the project files remain on disk, but all Git history and repository information are lost.

### Common Contents of the `.git` Folder

```text
.git/
├── HEAD
├── config
├── hooks/
├── objects/
└── refs/
```

| Component | Purpose                                     |
| --------- | ------------------------------------------- |
| HEAD      | Points to the currently checked-out branch. |
| config    | Stores repository settings.                 |
| hooks     | Contains automation scripts.                |
| objects   | Stores commits, files, and Git objects.     |
| refs      | Stores references to branches and tags.     |

---

## Q5. What is the difference between the Working Directory, Staging Area, and Repository?

| Area                  | Meaning                                                    |
| --------------------- | ---------------------------------------------------------- |
| **Working Directory** | Where files are created and edited.                        |
| **Staging Area**      | Where selected changes are prepared for the next commit.   |
| **Repository**        | The permanent history of committed changes managed by Git. |

### Visual Representation

```text
+-------------------+
| Working Directory |
+-------------------+
          |
          | git add
          v
+-------------------+
|   Staging Area    |
+-------------------+
          |
          | git commit
          v
+-------------------+
|    Repository     |
+-------------------+
```

----

## Key Takeaways

* `git add` stages changes for the next commit.
* `git commit` saves changes permanently in Git history.
* The Staging Area acts as a preparation zone for commits.
* `git log` helps inspect commit history.
* The `.git` folder contains Git's internal data and metadata.
* Understanding the Working Directory, Staging Area, and Repository is essential for mastering Git.

---

### Useful Commands

```bash
git init
git status
git add .
git commit -m "message"
git log
git branch
git show HEAD
git show-ref
```

Happy Learning and Keep Building! 🚀

