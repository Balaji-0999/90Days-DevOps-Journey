# Git Commands Handbook

A practical Git command reference covering daily Git workflow, branching, remote operations, merging, rebasing, stash, cherry-pick, reset, and revert.

---

# 1. Setup & Configuration

## git config

Configure Git user information.

### Set username

```bash
git config --global user.name "Your Name"
```

### Set email

```bash
git config --global user.email "your@email.com"
```

### Check Git configuration

```bash
git config --list
```

---

## git init

Initialize a new Git repository.

```bash
git init
```

Creates a `.git` directory.

---

## git clone

Copy an existing remote repository.

```bash
git clone <repository-url>
```

Example:

```bash
git clone https://github.com/user/project.git
```

---

# 2. Basic Git Workflow

## git status

Check current repository status.

```bash
git status
```

Shows:

* Modified files
* Staged files
* Untracked files
* Current branch

---

## git add

Add files to staging area.

Add single file:

```bash
[Ogit add file.txt
```

Add all files:

```bash
git add .
```

---

## git commit

Save staged changes permanently.

```bash
git commit -m "commit message"
```

Example:

```bash
git commit -m "Add login feature"
```

---

## git log

View commit history.

```bash
git log
```

Short format:

```bash
git log --oneline
```

Shows:

* Commit ID
* Author
* Commit message

---

## git diff

Show changes between working directory and last commit.

```bash
git diff
```

Compare staged changes:

```bash
git diff --staged
```

---

# 3. Branching Commands

## git branch

List branches.

```bash
git branch
```

Create a new branch:

```bash
git branch feature-login
```

---

## git checkout

Switch branch.

```bash
git checkout branch_name
```

Example:

```bash
git checkout dev
```

Create and switch branch:

```bash
git checkout -b dev
```

---

## git switch

Modern command for changing branches.

Switch branch:

```bash
git switch dev
```

Create new branch:

```bash
git switch -c feature-login
```

---

## Delete Branch

Delete local branch:

```bash
git branch -d branch_name
```

Force delete:

```bash
git branch -D branch_name
```

---

# 4. Remote Repository Commands

## git remote

Manage remote repositories.

Check remote:

```bash
git remote -v
```

Add remote:

```bash
git remote add origin <url>
```

---

## git push

Upload local commits to remote repository.

```bash
git push
```

Push specific branch:

```bash
git push origin main
```

First push:

```bash
git push -u origin main
```

---

## git pull

Download and merge remote changes.

```bash
git pull
```

Equivalent:

```text
git fetch + git merge
```

---

## git fetch

Download remote updates without changing local files.

```bash
git fetch
```

Meaning:

"Get latest information from remote, but don't modify my working files."

---

## git clone

Download complete repository.

```bash
git clone <repository-url>
```

---

## Fork

Fork is a GitHub feature.

Purpose:

* Create your own copy of someone else's repository
* Make changes independently
* Submit Pull Request

Flow:

```text
Original Repository
        |
        |
       Fork
        |
        |
Your Repository
        |
        |
 Pull Request
```

---

# 5. Merging & Rebasing

## git merge

Combine changes from one branch into another.

Example:

```bash
git checkout main
git merge dev
```

Flow:

```text
main
 |
 A---B

dev
 |
 A---B---C

After merge:

A---B---C
        \
         Merge Commit
```

---

## git merge --squash

Combine multiple commits into one commit.

```bash
git merge --squash dev
```

---

## git rebase

Move commits to another base.

```bash
git rebase main
```

Example:

```bash
git checkout feature
git rebase main
```

Used for:

* Clean history
* Linear commit history

---

## git rebase origin/main

Update branch with latest remote main.

```bash
git rebase origin/main
```

---

# 6. Stash Commands

## git stash

Temporarily save unfinished changes.

```bash
git stash
```

Example:

```text
Working changes
       |
       |
    git stash
       |
       |
Clean working directory
```

---

## git stash list

Show saved stashes.

```bash
git stash list
```

---

## git stash pop

Restore latest stash and remove it.

```bash
git stash pop
```

---

## git stash apply

Restore stash but keep it in stash list.

```bash
git stash apply
```

---

# 7. Cherry Pick

## git cherry-pick

Copy a specific commit from another branch.

Syntax:

```bash
git cherry-pick <commit-id>
```

Example:

```bash
git cherry-pick abc1234
```

Use case:

* Bring one bug fix
* Copy selected changes

---

Flow:

```text
main

A---B---C

feature

A---B---D


Cherry-pick D


main

A---B---C---D
```

---

# 8. Reset Commands

## git reset --soft

Move HEAD but keep changes staged.

```bash
git reset --soft <commit-id>
```

Use:

* Undo commit
* Keep changes ready for recommit

---

## git reset --mixed

Move HEAD and unstage changes.

```bash
git reset --mixed <commit-id>
```

Default reset mode.

---

## git reset --hard

Delete commit and changes.

```bash
git reset --hard <commit-id>
```

⚠️ Data can be lost.

---

# 9. Revert Commands

## git revert

Undo a commit by creating a new commit.

```bash
git revert <commit-id>
```

Example:

```bash
git revert abc1234
```

Safe for:

* Shared branches
* Production branches

---

# Reset vs Revert

| Feature                | git reset        | git revert       |
| ---------------------- | ---------------- | ---------------- |
| History                | Rewrites history | Keeps history    |
| Creates new commit     | No               | Yes              |
| Safe for shared branch | No               | Yes              |
| Common use             | Local changes    | Production fixes |

---

# 10. Recovery Commands

## git reflog

Find lost commits and branch movements.

```bash
git reflog
```

Useful after:

* Wrong reset
* Deleted branch
* Lost commits

---

# Git Daily Workflow

```text
Create Repository
        |
    git init
        |
    git add .
        |
    git commit
        |
    git branch
        |
    git push
        |
    Pull Request
        |
    Merge/Rebase
```

---

# Quick Command List

| Command         | Purpose                |
| --------------- | ---------------------- |
| git init        | Create repository      |
| git config      | Configure Git          |
| git status      | Check changes          |
| git add         | Stage files            |
| git commit      | Save changes           |
| git log         | View history           |
| git diff        | Show changes           |
| git branch      | Manage branches        |
| git checkout    | Switch branch          |
| git switch      | Modern branch switch   |
| git push        | Upload changes         |
| git pull        | Download + merge       |
| git fetch       | Download updates       |
| git clone       | Copy repository        |
| git merge       | Combine branches       |
| git rebase      | Rewrite history        |
| git stash       | Save temporary changes |
| git cherry-pick | Copy commit            |
| git reset       | Remove commits         |
| git revert      | Undo commit safely     |
| git reflog      | Recover history        |

```
```

