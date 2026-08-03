# Day-26: GitHub CLI (gh) Master Handbook

## 📌 Overview

Today I learned how to use the **GitHub CLI (`gh`)** to manage GitHub directly from the terminal without opening the GitHub website.

The GitHub CLI allows developers and DevOps engineers to:

* Authenticate with GitHub
* Create and manage repositories
* Create and manage Issues
* Create and review Pull Requests
* View GitHub Actions workflows
* Access GitHub API
* Search repositories
* Manage Releases
* Manage Gists
* Create command aliases

---

# Why GitHub CLI?

Instead of opening GitHub in a browser every time, we can perform most GitHub tasks directly from the terminal.

Benefits:

* Faster workflow
* Automation friendly
* Better for DevOps
* Easy scripting
* CI/CD integration
* Works on remote Linux servers

---

# Installation

Ubuntu

```bash
sudo apt update
sudo apt install gh
```

Verify installation

```bash
gh --version
```

Example Output

```text
gh version 2.xx.x
https://github.com/cli/cli/releases
```

---

# Authentication Commands

## Login

```bash
gh auth login
```

### Meaning

* `gh` → GitHub CLI
* `auth` → Authentication commands
* `login` → Sign in to GitHub

### Why use it?

Connect your local machine to your GitHub account.

### Production Use

Required before using most GitHub CLI commands.

---

## Check Login Status

```bash
gh auth status
```

### Purpose

Shows:

* Logged-in user
* Authentication method
* Git protocol
* Token status

Example

```text
Logged in to github.com as username
```

---

## Logout

```bash
gh auth logout
```

### Purpose

Removes GitHub authentication from the current machine.

---

# Repository Commands

## Create Repository

```bash
gh repo create
```

Creates a new GitHub repository.

---

## Clone Repository

```bash
gh repo clone owner/repository
```

Downloads a repository from GitHub.

---

## View Repository

```bash
gh repo view
```

Displays repository information.

---

## Open Repository in Browser

```bash
gh repo view --web
```

Opens the current repository in the default browser.

---

## List Your Repositories

```bash
gh repo list
```

Shows repositories owned by your account.

---

## Delete Repository

```bash
gh repo delete repository-name
```

Deletes the specified GitHub repository.

⚠️ Use carefully because this action is permanent.

---

# Issue Commands

## Create Issue

```bash
gh issue create
```

Creates a new GitHub Issue.

Example

```bash
gh issue create \
--title "Bug in README" \
--body "README has a typo" \
--label bug
```

---

## List Issues

```bash
gh issue list
```

Shows open issues.

---

## View Issue

```bash
gh issue view 2
```

Displays Issue number 2.

---

## Close Issue

```bash
gh issue close 2
```

Closes Issue #2.

---

# Pull Request Commands

## Create Pull Request

```bash
gh pr create --fill
```

Automatically creates a PR using commit title and description.

---

## List Pull Requests

```bash
gh pr list
```

Shows open pull requests.

---

## List All Pull Requests

```bash
gh pr list --state all
```

Shows:

* Open
* Closed
* Merged

Pull Requests.

---

## View Pull Request

```bash
gh pr view
```

Displays PR details.

---

## PR Status

```bash
gh pr status
```

Shows:

* Your PRs
* Assigned PRs
* Review requests

---

## View PR Difference

```bash
gh pr diff
```

Shows code changes between branches.

---

## Merge Pull Request

```bash
gh pr merge
```

Merges the selected PR.

---

# GitHub Actions Commands

## List Workflows

```bash
gh workflow list
```

Displays all workflows in the repository.

---

## List Workflow Runs

```bash
gh run list
```

Shows recent GitHub Actions runs.

---

## View Workflow Run

```bash
gh run view
```

Displays details of a workflow run.

---

# GitHub API

## Current User Information

```bash
gh api user
```

Returns your GitHub account details in JSON format.

Useful for automation and scripting.

---

# Search Commands

## Search Repositories

```bash
gh search repos "devops"
```

Searches public repositories related to "devops".

---

# Release Commands

## List Releases

```bash
gh release list
```

Shows all releases of the current repository.

---

# Gist Commands

## List Gists

```bash
gh gist list
```

Displays all your GitHub Gists.

---

# Alias Commands

## Create Alias

```bash
gh alias set prs 'pr list'
```

Now instead of typing:

```bash
gh pr list
```

you can simply type:

```bash
gh prs
```

---

## View Aliases

```bash
gh alias list
```

Lists all custom aliases.

---

# Git Commands Practiced

## Create Branch

```bash
git checkout -b day-26-cli
```

Creates and switches to a new branch.

---

## Alternative Branch Creation

```bash
git switch -c day-26-cli
```

Modern alternative to `git checkout -b`.

---

## Stage Files

```bash
git add .
```

Adds all modified files to the staging area.

---

## Commit Changes

```bash
git commit -m "Added GitHub CLI practice"
```

Creates a commit with a message.

---

## Push Branch

```bash
git push -u origin day-26-cli
```

Uploads the branch to GitHub and sets the upstream.

---

## Show Branches

```bash
git branch
```

Displays local branches.

---

## Repository Status

```bash
git status
```

Shows:

* Modified files
* Staged files
* Untracked files
* Current branch

---

# Extra Practice

Create a file

```bash
echo "# GitHub CLI Practice" > day26.txt
```

Meaning:

* `echo` → Prints text
* `>` → Redirects output to a file
* `day26.txt` → File name

---

# Real DevOps Workflow

```text
Developer
    │
    ▼
Create Branch
    │
    ▼
Write Code
    │
    ▼
git add
    │
    ▼
git commit
    │
    ▼
git push
    │
    ▼
gh pr create --fill
    │
    ▼
Code Review
    │
    ▼
gh pr merge
    │
    ▼
GitHub Actions
    │
    ▼
Deployment
```

---

# Common Errors

## Not Logged In

Error

```text
authentication required
```

Solution

```bash
gh auth login
```

---

## Repository Not Found

Error

```text
repository not found
```

Possible Causes

* Wrong repository name
* No access permission
* Typo in repository name

---

## No Git Repository

Error

```text
fatal: not a git repository
```

Solution

```bash
git init
```

or move into the correct repository.

---

## No Pull Request Found

Error

```text
no pull requests found
```

Solution

Create one first.

```bash
gh pr create --fill
```

---

# Best Practices

* Authenticate using GitHub CLI before working.
* Keep repository names meaningful.
* Create feature branches for new work.
* Write clear commit messages.
* Review Pull Requests before merging.
* Monitor GitHub Actions after every push.
* Use aliases for frequently used commands.
* Avoid deleting repositories unless necessary.
* Keep Issues updated with accurate information.
* Use GitHub CLI in automation scripts wherever possible.

---

# Interview Questions

## What is GitHub CLI?

GitHub CLI is a command-line tool that lets users interact with GitHub directly from the terminal.

---

## Why use GitHub CLI?

Because it improves productivity, supports automation, works well with CI/CD pipelines, and reduces the need to switch between the terminal and the browser.

---

## Difference between Git and GitHub CLI?

| Git                         | GitHub CLI                                       |
| --------------------------- | ------------------------------------------------ |
| Version control system      | Tool to interact with GitHub                     |
| Local repository management | GitHub repository management                     |
| Tracks file changes         | Manages Issues, PRs, Releases, Actions, and more |

---

## What is `gh api` used for?

It allows direct access to GitHub's REST API from the terminal, making automation and scripting easier.

---

## What is the purpose of `gh pr create --fill`?

It creates a Pull Request automatically using the latest commit message and description.

---

# Key Takeaways

* Learned GitHub CLI fundamentals.
* Practiced authentication commands.
* Managed repositories from the terminal.
* Created and viewed Issues.
* Worked with Pull Requests.
* Explored GitHub Actions.
* Used GitHub API.
* Managed Releases and Gists.
* Created command aliases.
* Integrated Git and GitHub CLI into a real DevOps workflow.

---

# Conclusion

GitHub CLI is an essential tool for modern DevOps engineers. It streamlines GitHub operations, enables automation, integrates seamlessly with CI/CD pipelines, and significantly speeds up daily development tasks by allowing repository management directly from the terminal.

