# Git Master Commands Handbook

A complete Git command reference for beginners, DevOps engineers, and interview preparation.

This handbook contains the Git commands that are commonly used in real-world development, troubleshooting, recovery, collaboration, and production environments.

---

# Repository Commands

## Initialize a Repository

```bash
git init
```

**Why we use it**

Creates a new Git repository in the current directory.

---

## Clone a Repository

```bash
git clone <repository-url>
```

**Why we use it**

Downloads an existing remote repository to your local machine.

---

## Check Repository Status

```bash
git status
```

**Why we use it**

Displays the current state of the repository, including staged, modified, and untracked files.

---

## Stage All Changes

```bash
git add .
```

**Why we use it**

Stages all new and modified files for the next commit.

---

## Stage a Specific File

```bash
git add <file>
```

**Why we use it**

Stages only the specified file.

---

## Create a Commit

```bash
git commit -m "Commit message"
```

**Why we use it**

Creates a new commit containing the staged changes.

---

## Modify the Last Commit

```bash
git commit --amend
```

**Why we use it**

Updates the most recent commit message or adds newly staged changes to it.

---

## View Commit History

```bash
git log
```

**Why we use it**

Displays the complete commit history.

---

## View Short Commit History

```bash
git log --oneline
```

**Why we use it**

Displays one commit per line.

---

## View Commit Graph

```bash
git log --graph --oneline --all
```

**Why we use it**

Displays the branch history as a graph.

---

## Show Commit Details

```bash
git show
```

**Why we use it**

Shows information about the latest commit.

---

## Compare Unstaged Changes

```bash
git diff
```

**Why we use it**

Displays changes that are not yet staged.

---

## Compare Staged Changes

```bash
git diff --cached
```

**Why we use it**

Displays staged changes that will be included in the next commit.

---

## Compare with HEAD

```bash
git diff HEAD
```

**Why we use it**

Compares the working directory with the latest commit.

---

# Branch Commands

## List Local Branches

```bash
git branch
```

**Why we use it**

Displays all local branches.

---

## List All Branches

```bash
git branch -a
```

**Why we use it**

Displays both local and remote branches.

---

## Show Tracking Information

```bash
git branch -vv
```

**Why we use it**

Shows which remote branch each local branch tracks.

---

## Delete a Branch

```bash
git branch -d <branch>
```

**Why we use it**

Deletes a merged branch.

---

## Force Delete a Branch

```bash
git branch -D <branch>
```

**Why we use it**

Deletes an unmerged branch.

---

## Switch Branch (Legacy)

```bash
git checkout <branch>
```

**Why we use it**

Switches to another branch.

---

## Create and Switch Branch

```bash
git checkout -b <branch>
```

**Why we use it**

Creates and immediately switches to a new branch.

---

## Switch Branch (Modern)

```bash
git switch <branch>
```

**Why we use it**

Switches branches using the newer Git command.

---

## Create and Switch (Modern)

```bash
git switch -c <branch>
```

**Why we use it**

Creates and switches to a new branch.

---

# Remote Commands

## View Remote Repository

```bash
git remote -v
```

**Why we use it**

Shows configured remote repositories.

---

## Add Remote

```bash
git remote add origin <url>
```

**Why we use it**

Connects a local repository to a remote repository.

---

## Remove Remote

```bash
git remote remove origin
```

**Why we use it**

Removes the configured remote.

---

## Change Remote URL

```bash
git remote set-url origin <url>
```

**Why we use it**

Updates the remote repository URL.

---

## Fetch Changes

```bash
git fetch
```

**Why we use it**

Downloads changes without merging them.

---

## Pull Changes

```bash
git pull
```

**Why we use it**

Downloads and merges remote changes.

---

## Pull with Rebase

```bash
git pull --rebase
```

**Why we use it**

[ODownloads changes and reapplies local commits on top of the latest remote commits.

---

## Push Changes

```bash
git push
```

**Why we use it**

Uploads local commits to the remote repository.

---

## Push and Set Upstream

```bash
git push -u origin main
```

**Why we use it**

Pushes the branch and sets the upstream tracking branch.

---

## Force Push

```bash
git push --force
```

**Why we use it**

Forces the remote branch to match local history.

⚠️ Use with caution.

---

## Safer Force Push

```bash
git push --force-with-lease
```

**Why we use it**

Force pushes only if the remote branch has not changed unexpectedly.

---

# Merge Commands

```bash
git merge <branch>
```

**Why we use it**

Merges another branch into the current branch.

---

```bash
git merge --abort
```

**Why we use it**

Cancels an ongoing merge.

---

```bash
git merge --continue
```

**Why we use it**

Continues a merge after resolving conflicts.

---

# Rebase Commands

```bash
git rebase main
```

**Why we use it**

Moves current branch commits onto another branch.

---

```bash
git rebase -i HEAD~3
```

**Why we use it**

Interactively edit, squash, reorder, or remove commits.

---

```bash
git rebase --continue
```

Continues a paused rebase.

---

```bash
git rebase --skip
```

Skips the conflicting commit.

---

```bash
git rebase --abort
```

Cancels the rebase.

---

# Cherry-Pick Commands

```bash
git cherry-pick <commit-hash>
```

Copies a specific commit to the current branch.

---

```bash
git cherry-pick --continue
```

Continues after conflict resolution.

---

```bash
git cherry-pick --skip
```

Skips the current commit.

---

```bash
git cherry-pick --abort
```

Cancels the cherry-pick operation.

---

# Stash Commands

```bash
git stash
git stash list
git stash apply
git stash pop
git stash drop
git stash clear
```

**Why we use them**

Temporarily save, restore, or remove uncommitted work.

---

# Reset Commands

```bash
git reset --soft HEAD~1
git reset --mixed HEAD~1
git reset --hard HEAD~1
git reset --hard <commit-hash>
git reset HEAD <file>
```

**Why we use them**

Undo commits, unstage files, or completely reset the repository depending on the reset mode.

---

# Restore Commands

```bash
git restore <file>
git restore .
git restore --staged <file>
```

**Why we use them**

Restore file contents or remove files from the staging area.

---

# Revert Commands

```bash
git revert <commit-hash>
git revert --continue
git revert --abort
git revert --skip
```

**Why we use them**

Safely undo a commit by creating a new commit while preserving history.

---

# Recovery Commands

```bash
git reflog
git reset --hard HEAD@{1}
git reset --hard <commit-hash>
```

**Why we use them**

Recover lost commits after reset, rebase, or accidental branch changes.

---

# Cleanup Commands

```bash
git rm <file>
git rm -r <directory>
git rm --cached <file>
git clean -n
git clean -fd
git clean -fdx
```

**Why we use them**

Remove tracked, untracked, or ignored files from the repository.

---

# Debugging Commands

```bash
git ls-files
git ls-files -u
git ls-files -s
git show HEAD
git show <commit-hash>
git blame <file>
git shortlog
git describe
git grep "keyword"
git log --grep="bug"
git log --author="Author Name"
git log --since="1 week ago"
git log --stat
```

**Why we use them**

Inspect repository history, debug issues, search commits, and analyze file ownership.

---

# Git Object Commands

```bash
git ls-tree HEAD
git cat-file -p HEAD
git rev-parse HEAD
git rev-parse --abbrev-ref HEAD
git rev-list --all
```

**Why we use them**

Inspect Git objects, trees, commit hashes, and branch information.

---

# Repository Maintenance

```bash
git fsck
git gc
git prune
```

**Why we use them**

Check repository integrity, optimize storage, and remove unreachable objects.

---

# Submodule Commands

```bash
git submodule add
git submodule init
git submodule update
git submodule sync
```

**Why we use them**

Manage repositories embedded inside another repository.

---

# Tag Commands

```bash
git tag
git tag -a
git tag -d
git push origin --tags
```

**Why we use them**

Create, delete, and share version tags.

---

# SSH Commands

```bash
ssh-keygen
ssh -T git@github.com
ssh-add
```

**Why we use them**

Generate, test, and load SSH keys for Git authentication.

# 🐧 Linux Basic Commands Cheat Sheet

## 1. pwd

Print current working directory.

```bash
pwd
```

---

## 2. ls

List files and directories.

```bash
ls
```

---

## 3. ls -la

List all files including hidden files with details.

```bash
ls -la
```

---

## 4. cd

Change directory.

```bash
cd directory_name
```

Examples:

```bash
cd /var/log
cd ..
cd ~
```

---

## 5. mkdir

Create a new directory.

```bash
mkdir directory_name
```

Example:

```bash
mkdir devops
```

---

## 6. rm

Remove file.

```bash
rm file_name
```

Example:

```bash
rm test.txt
```

---

## 7. rm -rf

Remove directory forcefully.

```bash
rm -rf directory_name
```

Example:

```bash
rm -rf old_folder
```

---

## 8. cp

Copy files or directories.

```bash
cp source destination
```

Examples:

```bash
cp file.txt backup.txt
```

```bash
cp -r folder1 folder2
```

---

## 9. mv

Move or rename files.

Rename:

```bash
mv old.txt new.txt
```

Move:

```bash
mv file.txt /tmp/
```

---

## 10. cat

Display file content.

```bash
cat file.txt
```

Create file:

```bash
cat > file.txt
```

---

## 11. nano

Edit file using nano editor.

```bash
nano file.txt
```

---

## 12. vim

Edit file using vim editor.

```bash
vim file.txt
```

---

## 13. chmod

Change file permissions.

```bash
chmod permission file
```

Examples:

```bash
chmod 755 script.sh
```

```bash
chmod +x script.sh
```

---

## 14. chown

Change file ownership.

```bash
chown user:group file
```

Example:

```bash
chown ubuntu:ubuntu file.txt
```

---

## 15. sudo

Run command with administrator privileges.

```bash
sudo command
```

Examples:

```bash
sudo apt update
```

```bash
sudo systemctl restart nginx
```

---

## 16. find

Search files and directories.

```bash
find location condition
```

Examples:

Find file:

```bash
find /home -name file.txt
```

Find log files:

```bash
find /var/log -name "*.log"
```

Find old files:

```bash
find /var/log -mtime +30
```

---

# Command List

| Command | Usage                          |
| ------- | ------------------------------ |
| pwd     | Show current directory         |
| ls      | List files                     |
| ls -la  | List hidden files with details |
| cd      | Change directory               |
| mkdir   | Create directory               |
| rm      | Remove file                    |
| rm -rf  | Force remove directory         |
| cp      | Copy files                     |
| mv      | Move/Rename files              |
| cat     | View file content              |
| nano    | Edit files                     |
| vim     | Advanced editor                |
| chmod   | Change permissions             |
| chown   | Change ownership               |
| sudo    | Execute as root                |
| find    | Search files                   |

