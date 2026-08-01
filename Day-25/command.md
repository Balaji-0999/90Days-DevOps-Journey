# Git & GitHub Commands Cheat Sheet

A practical Git command reference for daily development and DevOps work.

---

# 1. Git Repository Setup

## git init

Initialize a new Git repository.

```bash
git init
```

Creates a hidden `.git` directory that stores Git history and configuration.

---

# 2. Remove Files from Staging Area

## git rm --cached

Remove file/folder from Git tracking but keep it in your local system.

```bash
git rm --cached file_name
```

Example:

```bash
git rm --cached folder_name
```

Used after:

```bash
git add .
```

---

# 3. Restore Changes

## git restore

Discard changes from a file.

```bash
git restore file_name
```

Example:

```bash
git restore index.html
```

---

# 4. Git Internal Directory

Go inside Git metadata folder:

```bash
cd .git/
```

List Git internal files:

```bash
ls
```

---

# 5. Check Commit History

## git log

Shows commit history.

```bash
git log
```

Displays:

* Commit ID
* Author
* Date
* Commit message

---

# 6. Configure Git User

## Set username

```bash
git config --global user.name "your_username"
```

---

## Set email

```bash
git config --global user.email "your_email"
```

---

# 7. Clone Repository

## git clone

Copy a remote repository to local machine.

```bash
git clone <repository_URL>
```

Example:

```bash
git clone https://github.com/user/project.git
```

---

# 8. Branch Management

## Create New Branch

```bash
git checkout -b dev
```

Meaning:

* `checkout` → switch branch
* `-b` → create new branch

Creates a new branch called `dev`.

---

## Switch Branch

Using checkout:

```bash
git checkout master
```

```bash
git checkout dev
```

Using switch:

```bash
git switch dev
```

```bash
[Ogit switch master
```

---

## Check Current Branch

```bash
git branch
```

Shows all local branches.

Example:

```
* main
  dev
```

`*` shows current branch.

---

# 9. Fetch Remote Changes

## git fetch

Download latest information from remote repository without changing local files.

```bash
git fetch
```

Meaning:

> "Bring the latest remote information, but do not modify my working files."

---

# 10. Recover Lost Work

## git reflog

Shows all previous HEAD movements.

```bash
git reflog
```

Used to recover:

* Deleted branches
* Lost commits
* Reset mistakes

Example:

```bash
git checkout <commit_id>
```

---

# 11. Delete Branch

## Delete local branch forcefully

```bash
git branch -D dev
```

Deletes branch `dev`.

---

# 12. Link Local Branch With Remote Branch

## git push -u

Connect local branch with remote branch permanently.

```bash
git push -u origin master
```

Meaning:

> "Track this local branch with this remote branch."

After this you can simply use:

```bash
git push
```

instead of:

```bash
git push origin master
```

---

# 13. Nested Git Repository Problem

Example structure:

```
90Days-DevOps-Journey/

├── Day-22/
│   └── devops-git-practice/
│       └── .git
│
└── .git
```

Problem:

A Git repository inside another Git repository.

---

## Remove Folder From Parent Repository

```bash
git rm --cached Day-22/devops-git-practice
```

Git will stop tracking this folder.

Meaning:

> "Do not consider this folder as part of my repository."

---

## Remove Inner Git Repository

If you want to keep the folder but remove its Git history:

```bash
rm -rf Day-22/devops-git-practice/.git
```

Before:

```
devops-git-practice/

├── .git
├── README.md
└── files
```

After:

```
devops-git-practice/

├── README.md
└── files
```

---

# 14. Git Stash

Temporarily save unfinished changes.

## git stash

```bash
git stash
```

---

## Restore Stashed Changes

```bash
git stash pop
```

---

## Apply Stash Without Removing

```bash
git apply
```

---

# 15. Squash Merge

## git merge --squash

Combine multiple commits into one commit.

```bash
git merge --squash dev
```

---

# 16. Git Reset

## Soft Reset

```bash
git reset --soft <commit_id>
```
[I
Moves HEAD back but keeps:

* Files
* Changes
* Staging area

---

## Mixed Reset

```bash
git reset --mixed <commit_id>
```

Default reset.

Removes commit but keeps file changes unstaged.

---

## Hard Reset

```bash
git reset --hard <commit_id>
```

Deletes:

* Commit history
* File changes
* Staging changes

⚠️ Use carefully.

---

# 17. Check Remote Repository

## git remote -v

Shows remote repository connection.

```bash
git remote -v
```

Example output:

```
origin  https://github.com/user/repo.git
```

---

# 18. HTTPS vs SSH (GitHub)

## HTTPS

Example:

```
https://github.com/user/repo.git
```

* Uses username/token authentication
* Easy setup

---

## SSH

Example:

```
git@github.com:user/repo.git
```

* Uses SSH keys
* No repeated login
* Recommended for developers

---

[O# 19. Git Rebase

## git rebase

Move commits to another base and create a cleaner history.

```bash
git rebase main
```

Example:

```bash
git rebase origin/main
```

Purpose:

* Keep linear history
* Avoid unnecessary merge commits

---

# 20. View Commit History

```bash
git log
```

Shows commit details and history.

---

# Git Command Summary

| Command            | Purpose                 |
| ------------------ | ----------------------- |
| git init           | Create repository       |
| git clone          | Copy remote repository  |
| git add            | Add files to staging    |
| git rm --cached    | Remove tracking         |
| git restore        | Undo file changes       |
| git log            | View commits            |
| git config         | Configure user          |
| git checkout -b    | Create branch           |
| git switch         | Change branch           |
| git branch         | List branches           |
| git fetch          | Download remote updates |
| git reflog         | Recover lost commits    |
| git branch -D      | Delete branch           |
| git push -u        | Connect remote branch   |
| git stash          | Save temporary changes  |
| git stash pop      | Restore changes         |
| git merge --squash | Combine commits         |
| git reset          | Undo commits            |
| git remote -v      | Check remote            |
| git rebase         | Rewrite history         |

---

