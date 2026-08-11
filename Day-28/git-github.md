# 🔥 Git & GitHub Revision – Day 28

Git is a **distributed version control system** used to track changes in source code.

GitHub is a **cloud platform** where Git repositories can be hosted, shared, reviewed, and collaborated on.

---

# 1. Initialize a Repo, Stage, Commit and View History

## 📦 Initialize a Repository

Move into your project:

```bash
cd my-project
```

Initialize Git:

```bash
git init
```

This creates a hidden `.git` directory.

The `.git` directory stores the repository's Git metadata and history.

Check the repository:

```bash
git status
```

---

## ➕ Stage Changes

Create a file:

```bash
touch README.md
```

Check:

```bash
git status
```

Stage one file:

```bash
git add README.md
```

Stage everything:

```bash
git add .
```

---

## 💾 Commit Changes

Create a commit:

```bash
git commit -m "Add README"
```

A commit is a snapshot of staged changes.

Good commit messages should clearly describe what changed.

Example:

```bash
git commit -m "Add Linux notes"
```

---

## 📜 View History

Show detailed history:

```bash
git log
```

Compact history:

```bash
git log --oneline
```

Graph view:

```bash
git log --oneline --graph --all
```

---

## 🔄 Basic Git Workflow

```text
Working Directory
       ↓
    git add
       ↓
Staging Area
       ↓
  git commit
       ↓
Local Repository
       ↓
   git push
       ↓
GitHub Remote
```

### Quick Commands

```text
git init       → initialize repository
git status     → check changes
git add        → stage changes
git commit     → save snapshot
git log        → view history
```

---

# 2. Create and Switch Branches

A **branch** is an independent line of development.

Branches allow developers to work on features without directly changing `main`.

## 🌿 View Branches

```bash
git branch
```

## Create a Branch

```bash
git branch feature-login
```

## Switch Branch

```bash
git switch feature-login
```

## Create and Switch in One Command

```bash
git switch -c feature-login
```

Older syntax:

```bash
git checkout -b feature-login
```

## Switch Back to Main

```bash
git switch main
```

## Delete a Branch

```bash
git branch -d feature-login
```

If the branch has not been merged and you intentionally want to delete it:

```bash
git branch -D feature-login
```

> `-D` can delete the branch even when Git warns that it has unmerged commits, so use it carefully.

---

# 3. Push to and Pull from GitHub

GitHub acts as a remote repository.

## 🔗 Add a Remote

```bash
git remote add origin https://github.com/USERNAME/REPOSITORY.git
```

Check:

```bash
git remote -v
```

---

## ⬆️ Push to GitHub

Push the current branch:

```bash
git push
```

First push for a new branch:

```bash
git push -u origin feature-login
```

The `-u` sets the upstream branch so future pushes can usually use:

```bash
git push
```

---

## ⬇️ Pull from GitHub

```bash
git pull
```

`git pull` normally fetches remote changes and then integrates them into the current branch.

You can also specify:

```bash
git pull origin main
```

---

## 🔍 Fetch vs Pull

```text
git fetch
    ↓
Downloads remote information
    ↓
Does NOT automatically integrate it

git pull
    ↓
Fetch
    +
Integrate changes
```

---

# 4. Clone vs Fork

These are related but different concepts.

## 📥 Clone

`git clone` copies a remote repository to your local computer.

Example:

```bash
git clone https://github.com/user/project.git
```

After cloning:

```text
GitHub Repository
       ↓
   git clone
       ↓
Your Computer
```

You normally clone when you want to work with a repository locally.

---

## 🍴 Fork

A **fork** creates your own GitHub-hosted copy of another user's repository under your GitHub account.

Example:

```text
Original Repository
        ↓
       Fork
        ↓
Your GitHub Account
```

You can then clone your fork:

```bash
git clone https://github.com/YOUR-USERNAME/project.git
```

### Easy Difference

```text
Clone → copy repository to your computer

Fork  → copy repository to your GitHub account
```

---

# 5. Merge Branches

Merging combines changes from one branch into another.

Example:

```text
main
 │
 A
 │
 B
 │
 └── feature
       │
       C
       │
       D
```

Switch to `main`:

```bash
git switch main
```

Merge:

```bash
git merge feature
```

There are two important merge situations.

---

## ⚡ Fast-Forward Merge

A fast-forward merge happens when the target branch has not moved forward since the feature branch was created.

Example:

```text
Before:

A---B---C
        ↑
      feature

main → B
```

After merging:

```text
A---B---C
        ↑
   main + feature
```

Git simply moves the `main` pointer forward.

No separate merge commit is required.

---

## 🔀 Merge Commit

A merge commit can happen when both branches have developed independently.

Example:

```text
       C---D feature
      /
A---B
      \
       E---F main
```

After merging:

```text
       C---D
      /     \
A---B       M
      \     /
       E---F
```

`M` is the merge commit.

### Quick Difference

```text
Fast-forward
→ branch pointer moves forward
→ no merge commit

Merge commit
→ branches have diverged
→ Git creates a merge commit
```

---

# 6. Rebase – What and When to Use It

Rebase moves/replays your commits onto a new base commit.

Example:

```text
Before:

A---B---C main
     \
      D---E feature
```

Run:

```bash
git switch feature
git rebase main
```

Git replays the feature commits on top of the latest `main`:

```text
A---B---C---D'---E'
             feature
```

The commits may receive new IDs because rebase rewrites commit history.

---

## 🔀 Rebase vs Merge

### Merge

```bash
git merge main
```

Preserves the existing branch structure and does not rewrite existing commits.

### Rebase

```bash
git rebase main
```

Creates a more linear history by replaying commits on a new base.

### When to Use Merge

Use merge when:

* You want to preserve the true branch history.
* You are working on shared history.
* You want to avoid rewriting commits that others may already have.

### When to Use Rebase

Use rebase when:

* You want a clean, linear history.
* You are updating your own feature branch before opening/merging a PR.
* The commits being rewritten are not already being relied on by other developers.

> ⚠️ Avoid rebasing shared/public history unless your team explicitly agrees to it.

---

# 7. Git Stash and Git Stash Pop

`git stash` temporarily saves uncommitted changes so you can work on something else.

Imagine:

```text
feature-login
    ↓
Unfinished changes
```

You suddenly need to switch branches.

Instead of making an unfinished commit:

```bash
git stash
```

Now your working directory is clean.

Switch branches:

```bash
git switch main
```

After finishing your urgent work:

```bash
git switch feature-login
```

Restore the changes:

```bash
git stash pop
```

---

## Useful Stash Commands

List stashes:

```bash
git stash list
```

Apply the latest stash without removing it:

```bash
git stash apply
```

Apply and remove the latest stash:

```bash
git stash pop
```

Delete a stash:

```bash
git stash drop
```

### Easy Meaning

```text
git stash
    ↓
Temporarily save unfinished changes

git stash pop
    ↓
Restore the saved changes
```

---

# 8. Cherry-Pick a Commit

`git cherry-pick` copies the changes introduced by a specific commit and applies them as a new commit on your current branch.

Suppose:

```text
main:
A---B

feature:
A---B---C---D
```

You only need commit `C` on `main`.

Switch to main:

```bash
git switch main
```

Cherry-pick:

```bash
git cherry-pick C
```

Now:

```text
main:
A---B---C'
```

`C'` is a new commit containing the changes from `C`.

Find commit IDs:

```bash
git log --oneline
```

Then:

```bash
git cherry-pick <commit-id>
```

### When to Use

Cherry-pick is useful when:

* You need one specific fix from another branch.
* You don't want to merge the entire branch.
* You need to backport a particular change.

> Be careful when cherry-picking commits that depend on other commits.

---

# 9. Squash Merge vs Regular Merge

## 🔀 Regular Merge

A regular merge preserves the individual commits.

Example:

```text
feature:
A---B---C---D

main:
A---B
```

After merge:

```text
A---B---C---D
```

If the branches diverged, Git may create a merge commit.

The individual commits remain visible.

---

## 🧹 Squash Merge

A squash merge combines multiple feature-branch commits into one commit when integrating them.

Example:

```text
feature:
C---D---E
```

After squash merge:

```text
main:
A---B---S
```

Where:

```text
S = combined changes from C + D + E
```

The original feature-branch commits are not added individually to the target branch as separate commits.

### Difference

```text
Regular merge
→ preserves individual commits

Squash merge
→ combines feature changes into one commit
```

### Example

Feature branch:

```text
Add login UI
Fix login button
Fix typo
Update login validation
```

Regular merge keeps these commits.

Squash merge can turn them into:

```text
Add login feature
```

This can make the main branch history cleaner.

---

# 10. git reset – Soft, Mixed and Hard

`git reset` moves the current branch pointer to another commit.

There are three commonly discussed modes.

---

## 🟢 Soft Reset

```bash
git reset --soft HEAD~1
```

Moves `HEAD` backward but keeps changes staged.

```text
Commit removed from history
        ↓
Changes remain staged
```

Useful when you want to redo a commit.

---

## 🟡 Mixed Reset

```bash
git reset HEAD~1
```

This is the default reset mode.

It:

* Moves `HEAD`
* Removes changes from staging
* Keeps the changes in the working directory

```text
Commit removed
     ↓
Changes remain as unstaged files
```

---

## 🔴 Hard Reset

```bash
git reset --hard HEAD~1
```

Moves `HEAD` backward and resets the staging area and working tree to match that commit.

```text
Commit removed
     ↓
Staged changes removed
     ↓
Working-tree changes removed
```

> ⚠️ `git reset --hard` can permanently discard uncommitted work. Use it carefully.

---

# 11. git revert

`git revert` safely creates a new commit that reverses the changes from an earlier commit.

Example:

```text
A---B---C
```

Run:

```bash
git revert C
```

Result:

```text
A---B---C---C'
```

`C'` reverses the changes introduced by `C`.

---

## Reset vs Revert

```text
git reset
    ↓
Moves branch history backward

git revert
    ↓
Creates a new commit that undoes old changes
```

### For Shared Branches

For a shared branch such as `main`, `git revert` is often safer because it does not rewrite existing shared history.

---

# 12. GitFlow, GitHub Flow and Trunk-Based Development

Different teams use different branching strategies.

---

## 🌊 GitFlow

GitFlow uses multiple long-lived branches.

Typical structure:

```text
main
  │
develop
  │
  ├── feature/login
  ├── feature/payment
  │
release
  │
hotfix
```

Common branches:

```text
main       → production
develop    → integration
feature/*  → new features
release/*  → release preparation
hotfix/*   → urgent production fixes
```

### Advantages

* Clear separation of development and releases
* Useful for scheduled/release-based workflows

### Disadvantages

* More complex
* More branches to manage
* Can be slower for continuous delivery

---

# 🚀 GitHub Flow

GitHub Flow is simpler.

Typical workflow:

```text
main
 │
 ├── feature/login
 │
 └── feature/payment
```

Workflow:

```text
Create branch
     ↓
Make changes
     ↓
Push branch
     ↓
Create Pull Request
     ↓
Code Review
     ↓
Tests
     ↓
Merge into main
     ↓
Deploy
```

### Good For

* Small teams
* Frequent releases
* Continuous delivery
* Web applications

---

# 🚂 Trunk-Based Development

In Trunk-Based Development, developers work around one main branch called the **trunk**.

Usually:

```text
             ┌── small change
             │
main/trunk ──┼── small change
             │
             └── small change
```

Developers integrate changes frequently instead of keeping long-lived feature branches.

Feature flags can be used to keep incomplete functionality disabled.

### Advantages

* Very frequent integration
* Small changes
* Less merge complexity
* Works well with strong CI/CD

### Challenges

* Requires good automated testing
* Requires disciplined development
* Teams need reliable CI

---

# 📊 Branching Strategy Comparison

| Strategy    | Complexity | Main Idea                     | Good For                |
| ----------- | ---------- | ----------------------------- | ----------------------- |
| GitFlow     | High       | Multiple long-lived branches  | Release-based projects  |
| GitHub Flow | Low        | Feature branch + PR + main    | Small/medium teams      |
| Trunk-Based | Low/Medium | Frequent integration to trunk | CI/CD and fast delivery |

### Simple Rule

```text
GitFlow
→ structured release process

GitHub Flow
→ simple PR-based development

Trunk-Based
→ frequent small integrations
```

---

# 13. GitHub CLI

GitHub CLI allows you to work with GitHub from the terminal.

The command is:

```bash
gh
```

Check installation:

```bash
gh --version
```

Login:

```bash
gh auth login
```

Check authentication:

```bash
gh auth status
```

---

## 📦 Create a Repository

Create a repository:

```bash
gh repo create my-project
```

Create and make it public:

```bash
gh repo create my-project --public
```

Create and make it private:

```bash
gh repo create my-project --private
```

Create from the current local repository and push it:

```bash
gh repo create my-project --public --source=. --remote=origin --push
```

---

# 🔀 Create a Pull Request

After pushing your branch:

```bash
git push -u origin feature-login
```

Create a PR:

```bash
gh pr create
```

You can provide the title and body:

```bash
gh pr create --title "Add login feature" --body "Implemented the login functionality."
```

View PRs:

```bash
gh pr list
```

View a specific PR:

```bash
gh pr view 1
```

---

# 🐛 Create and Manage Issues

Create an issue:

```bash
gh issue create
```

Create with title and body:

```bash
gh issue create --title "Fix login bug" --body "Login fails when the password contains special characters."
```

List issues:

```bash
gh issue list
```

View an issue:

```bash
gh issue view 1
```

---

# 🛠️ Useful GitHub CLI Commands

```bash
gh repo list
```

List repositories.

```bash
gh repo view
```

View repository information.

```bash
gh repo clone USERNAME/REPOSITORY
```

Clone a repository using GitHub CLI.

```bash
gh pr list
```

List Pull Requests.

```bash
gh pr view 1
```

View a Pull Request.

```bash
gh pr checkout 1
```

Checkout a Pull Request locally.

```bash
gh issue list
```

List issues.

```bash
gh issue view 1
```

View an issue.

```bash
gh auth status
```

Check GitHub CLI authentication.

---

# 🧠 Complete Git & GitHub Workflow

A common feature-development workflow looks like this:

```text
                GitHub
                   │
                   │ clone
                   ↓
             Local Repository
                   │
                   ↓
              git switch -c
                   │
                   ↓
             Feature Branch
                   │
             Make Changes
                   │
                   ↓
                git add
                   │
                   ↓
              git commit
                   │
                   ↓
                git push
                   │
                   ↓
              GitHub Branch
                   │
                   ↓
             Pull Request
                   │
                   ↓
             Code Review
                   │
                   ↓
                 Tests
                   │
                   ↓
               Merge
                   │
                   ↓
                 main
```

---

# 📚 Git & GitHub Quick Reference

## Repository

```bash
git init
git clone <url>
git status
git remote -v
```

## Changes

```bash
git add .
git commit -m "message"
git diff
git diff --staged
```

## History

```bash
git log
git log --oneline
git log --oneline --graph --all
```

## Branches

```bash
git branch
git switch -c feature
git switch main
git branch -d feature
```

## Remote

```bash
git fetch
git pull
git push
```

## Merge & Rebase

```bash
git merge feature
git rebase main
```

## Temporary Work

```bash
git stash
git stash list
git stash pop
git stash apply
```

## Commit Operations

```bash
git cherry-pick <commit-id>
git reset --soft HEAD~1
git reset HEAD~1
git reset --hard HEAD~1
git revert <commit-id>
```

## GitHub CLI

```bash
gh auth login
gh auth status

gh repo create
gh repo list
gh repo view

gh pr create
gh pr list
gh pr view

gh issue create
gh issue list
gh issue view
```

---

# 🎯 Most Important Differences

```text
Clone vs Fork
─────────────
Clone → repository → your computer
Fork  → repository → your GitHub account


Fetch vs Pull
─────────────
Fetch → download remote information
Pull  → fetch + integrate


Merge vs Rebase
───────────────
Merge  → preserves branch structure
Rebase → creates a more linear history by replaying commits


Reset vs Revert
───────────────
Reset  → moves branch history
Revert → creates a new undo commit


Stash vs Commit
───────────────
Stash  → temporarily save unfinished work
Commit → permanently record a snapshot in Git history


Regular Merge vs Squash Merge
──────────────────────────────
Regular merge → keeps individual commits
Squash merge  → combines feature changes into one commit


Cherry-pick
───────────
Copies the changes from one specific commit
and applies them as a new commit on another branch.
```

---

# 🏆 Final Git & GitHub Revision

After completing this revision, I can:

* Initialize and manage Git repositories
* Stage and commit changes
* Read Git history
* Create and manage branches
* Push and pull changes with GitHub
* Explain clone vs fork
* Merge branches
* Understand fast-forward and merge commits
* Rebase feature branches
* Use `git stash`
* Cherry-pick specific commits
* Understand squash merges
* Use `git reset` safely
* Use `git revert` for shared history
* Explain GitFlow
* Explain GitHub Flow
* Explain Trunk-Based Development
* Use GitHub CLI for repositories, Pull Requests and issues

## 🚀 Key Lesson

Git is not just a collection of commands.

The important part is understanding **how changes move through the workflow**:

```text
Working Directory
       ↓
    Staging
       ↓
     Commit
       ↓
     Branch
       ↓
     Push
       ↓
    GitHub
       ↓
 Pull Request
       ↓
   Review
       ↓
    Merge
       ↓
     main
```

**Git & GitHub Revision – Day 28 ✅**

#90DaysOfDevOps
#DevOpsKaJosh
#TrainWithShubham

