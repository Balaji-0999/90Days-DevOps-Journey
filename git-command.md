# Git Fundamentals for DevOps Engineers

Git is a distributed version control system used to track changes in source code and collaborate with teams. Every DevOps Engineer should be comfortable with Git because it is the foundation of CI/CD pipelines, automation, and infrastructure management.

---

## Git Configuration Commands

| Command                                                   | Purpose                                               |
| --------------------------------------------------------- | ----------------------------------------------------- |
| `git config --global user.name`                           | Check the globally configured Git username.           |
| `git config --global user.email`                          | Check the globally configured Git email address.      |
| `git config --global user.name "Your Name"`               | Set the Git username globally for all repositories.   |
| `git config --global user.email "your-email@example.com"` | Set the Git email globally for all repositories.      |
| `git config --list`                                       | Display all active Git configurations.                |
| `git config --get user.name`                              | Display the configured username.                      |
| `git config --get user.email`                             | Display the configured email address.                 |
| `git config user.name "Your Name"`                        | Set the Git username only for the current repository. |
| `git config user.email "your-email@example.com"`          | Set the Git email only for the current repository.    |
| `git config --list                                        | Display all active Git configurations.                |
                                                            
----

## Repository Management Commands

| Command                      | Purpose                                                    |
| ---------------------------- | ---------------------------------------------------------- |
| `git init`                   | Initialize a new Git repository in the current directory.  |
| `git init --bare`            | Create a bare repository used as a centralized Git server. |
| `git clone <repository-url>` | Download an existing repository from a remote server.      |
| `git status`                 | Show the current state of the repository.                  |
| `git branch`                 | List all local branches.                                   |
| `git branch -a`              | List all local and remote branches.                        |

---

## Working with Files

| Command                   | Purpose                              :wq
|
| ------------------------- | ------------------------------------ |
| `git add .`               | Add all changes to the staging area. |
| `git commit -m "message"` | Create a new commit with a message.  |

### Git Workflow

```text
Working Directory
        ↓
git add .
        ↓
Staging Area
        ↓
git commit -m
        ↓
Git Repository
```

---

## Viewing History

| Command               | Purpose                                              |
| --------------------- | ---------------------------------------------------- |
| `git log`             | Display detailed commit history.                     |
| `git log --oneline`   | Display commit history in a compact format.          |
| `git reflog`          | View the history of HEAD and branch updates.         |
| `git log origin/main` | View the commit history of the remote `main` branch. |

### Why `git reflog` is Important

`git reflog` is one of the most useful recovery commands in Git. It helps recover:

* Deleted commits
* Lost branches
* Accidental resets
* Mistaken checkouts

---

## Remote Repository Commands

| Command                                  | Purpose                                                           |
| ---------------------------------------- | ----------------------------------------------------------------- |
| `git remote -v`                          | Display all configured remote repositories and their URLs.        |
| `git remote add origin <repository-url>` | Add a remote repository named `origin`.                           |
| `git fetch`                              | Download remote changes without modifying local files.            |
| `git fetch origin`                       | Fetch updates from a specific remote named `origin`.              |
| `git pull`                               | Fetch and merge changes from the remote repository.               |
| `git pull origin main`                   | Pull changes from the `main` branch of the remote repository.     |
| `git push origin main`                   | Push local commits to the `main` branch of the remote repository. |

### Fetch vs Pull

| Command     | Action                        |
| ----------- | ----------------------------- |
| `git fetch` | Downloads updates only.       |
| `git pull`  | Downloads and merges updates. |

---

## Branch Management

| Command                      | Purpose                                       |
| ---------------------------- | --------------------------------------------- |
| `git checkout <branch-name>` | Switch to another branch.                     |
| `git switch <branch-name>`   | Modern command to switch branches.            |
| `git merge <branch-name>`    | Merge another branch into the current branch. |

### Branch Workflow

```text
main
  │
  ├── dev
  │
  ├── feature-login
  │
  └── feature-payment
```

Branches allow multiple developers to work independently without affecting the main codebase.

---

## Comparing Changes

| Command                     | Purpose                                                               |
| --------------------------- | --------------------------------------------------------------------- |
| `git diff main origin/main` | Compare the local `main` branch with the remote `origin/main` branch. |

### Use Case

```bash
git fetch
git diff main origin/main
```

This helps identify differences between your local code and the latest code available on GitHub.

---

## Useful Linux Command

| Command  | Purpose                                                    |
| -------- | ---------------------------------------------------------- |
| `ls -la` | Display all files and directories, including hidden files. |

Useful for viewing:

* `.git`
* `.gitignore`
* Hidden configuration files
* File permissions

---

## Why Git is Important for DevOps

Git plays a critical role in modern DevOps workflows:

```text
Developer
    ↓
GitHub
    ↓
Jenkins
    ↓
Docker
    ↓
Kubernetes
    ↓
Production
```

Almost every DevOps tool integrates with Git, including:

* Jenkins
* GitHub Actions
* GitLab CI/CD
* ArgoCD
* Terraform
* Ansible
* Docker
* Kubernetes

---

## Summary

These commands cover the core Git concepts every DevOps Engineer should know:

1. Git Configuration
2. Repository Initialization
3. Tracking Changes
4. Commit Management
5. Remote Repository Operations
6. Branch Management
7. History & Recovery
8. Comparing Changes
9. Collaboration
10. CI/CD Integration

Mastering these Git commands will make it easier to work with source code, collaborate with teams, and build reliable DevOps pipelines.

