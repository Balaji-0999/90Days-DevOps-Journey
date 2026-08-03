# Day 26 – GitHub CLI (gh) Practice

## 📖 Overview

Today I learned how to use **GitHub CLI (`gh`)** to manage GitHub directly from the terminal without opening the GitHub website.

GitHub CLI helps developers and DevOps engineers automate repository management, issues, pull requests, workflows, and many GitHub operations.

---

# 1. Authentication

## Command

```bash
gh auth login
```

### What it does

Logs in to your GitHub account using GitHub CLI.

### Why we use it

* Connects GitHub CLI with your GitHub account.
* Allows CLI commands to access your repositories.
* Required before using most `gh` commands.

---

## Verify Logged-in User

### Command

```bash
gh auth status
```

### What it does

Shows the currently authenticated GitHub account.

### Why we use it

* Verify login.
* Check authentication status.
* Troubleshoot login problems.

---

# 2. Repository Management

## Create Repository

### Command

```bash
gh repo create
```

### What it does

Creates a new GitHub repository from the terminal.

### Why we use it

* Quickly create repositories.
* Useful in automation scripts.
* No need to open GitHub website.

---

## Clone Repository

### Command

```bash
gh repo clone OWNER/REPO
```

### What it does

Downloads a GitHub repository to your local machine.

### Why we use it

* Start working on existing projects.
* Clone repositories faster from terminal.

---

## View Repository

### Command

```bash
gh repo view
```

### What it does

Displays repository information.

### Why we use it

* View repository details.
* Check visibility.
* Verify repository information.

---

## List Repositories

### Command

```bash
gh repo list
```

### What it does

Lists repositories owned by the authenticated user.

### Why we use it

* View all repositories.
* Quickly find projects.
* Useful when managing multiple repositories.

---

## Open Repository in Browser

### Command

```bash
gh repo view --web
```

### What it does

Opens the current repository in the default web browser.

### Why we use it

* Quickly access GitHub webpage.
* Useful for reviewing repository online.

---

# 3. Issues

## Create Issue

### Command

```bash
gh issue create
```

### What it does

Creates a new GitHub Issue.

### Why we use it

* Report bugs.
* Track tasks.
* Request new features.

---

## List Issues

### Command

```bash
gh issue list
```

### What it does

Shows all open issues.

### Why we use it

* Track pending work.
* Monitor project progress.

---

## View Issue

### Command

```bash
gh issue view
```

### What it does

Displays detailed information about a specific issue.

### Why we use it

* Read issue description.
* View comments.
* Check issue status.

---

## Close Issue

### Command

```bash
gh issue close
```

### What it does

Closes an existing issue.

### Why we use it

* Mark completed tasks.
* Close resolved bugs.

---

## Production Use

GitHub CLI can automatically create, assign, list, and close issues from scripts or CI/CD pipelines.

---

# 4. Pull Requests

## Create Pull Request

### Command

```bash
gh pr create --fill
```

### What it does

Creates a Pull Request and automatically fills the title and description from recent commits.

### Why we use it

* Faster PR creation.
* No manual typing.
* Common in DevOps workflows.

---

## List Pull Requests

### Command

```bash
gh pr list
```

### What it does

Lists all open Pull Requests.

### Why we use it

* Track pending code reviews.
* Monitor team contributions.

---

## View Pull Request

### Command

```bash
gh pr view
```

### What it does

Displays detailed information about a Pull Request.

### Why we use it

* Review PR details.
* Read comments.
* Check merge status.

---

## Pull Request Status

### Command

```bash
gh pr status
```

### What it does

Shows Pull Requests related to your current branch and account.

### Why we use it

* Monitor your active PRs.
* Check review requests.
* Track merge progress.

---

## Merge Pull Request

### Command

```bash
gh pr merge
```

### What it does

Merges a Pull Request into the target branch.

### Why we use it

* Complete feature development.
* Integrate code into the main branch.

---

## Production Use

DevOps teams use GitHub CLI to automatically create, review, merge, and monitor Pull Requests inside CI/CD pipelines.

---

# 5. GitHub Actions

## List Workflow Runs

### Command

```bash
gh run list
```

### What it does

Shows recent GitHub Actions workflow runs.

### Why we use it

* Monitor CI/CD pipelines.
* Check build status.
* View workflow history.

---

## View Workflow Run

### Command

```bash
gh run view RUN_ID
```

### What it does

Displays detailed information about a workflow run.

### Why we use it

* Debug failed pipelines.
* View logs.
* Identify build errors.

---

## List Workflows

### Command

```bash
gh workflow list
```

### What it does

Lists all GitHub Actions workflows available in a repository.

### Why we use it

* Check available CI/CD workflows.
* Verify workflow configuration.

---

# 6. Useful Commands

## User Information

### Command

```bash
gh api user
```

### What it does

Retrieves information about the authenticated GitHub user using the GitHub REST API.

### Why we use it

* Verify authenticated account.
* Retrieve user profile information.
* Test GitHub API access.

---

## List Gists

### Command

```bash
gh gist list
```

### What it does

Lists all GitHub Gists belonging to the authenticated user.

### Why we use it

* Manage code snippets.
* Share small scripts.
* Store reusable examples.

---

## List Releases

### Command

```bash
gh release list
```

### What it does

Lists all releases in the current repository.

### Why we use it

* Track software versions.
* Download released builds.
* Manage production releases.

---

## List Aliases

### Command

```bash
gh alias list
```

### What it does

Displays all custom GitHub CLI aliases.

### Why we use it

* View command shortcuts.
* Improve productivity.
* Reduce repetitive typing.

---

## Search Repositories

### Command

```bash
gh search repos "devops"
```

### What it does

Searches GitHub for public repositories matching the keyword "devops".

### Why we use it

* Discover open-source projects.
* Find learning resources.
* Explore DevOps repositories.

---

# Interview Questions

### Q1. What is GitHub CLI?

**Answer:**

GitHub CLI (`gh`) is an official command-line tool that allows users to manage GitHub repositories, issues, pull requests, workflows, and other GitHub features directly from the terminal.

---

### Q2. Why do DevOps engineers use GitHub CLI?

**Answer:**

Because it automates GitHub operations, integrates with CI/CD pipelines, reduces manual work, and enables repository management directly from scripts and the terminal.

---

### Q3. What is the purpose of `gh pr create --fill`?

**Answer:**

It creates a Pull Request and automatically fills the title and description using the latest commit information.

---

### Q4. What does `gh run list` do?

**Answer:**

It lists recent GitHub Actions workflow runs for a repository.

---

### Q5. What does `gh api user` return?

**Answer:**

It returns information about the currently authenticated GitHub user in JSON format using the GitHub REST API.

---

# Key Takeaways

* Authenticate GitHub CLI securely.
* Manage repositories without opening GitHub.
* Create and manage Issues.
* Create, review, and merge Pull Requests.
* Monitor GitHub Actions workflows.
* Use GitHub API from the terminal.
* Manage releases, gists, and aliases.
* Search GitHub repositories efficiently.
* GitHub CLI is widely used in DevOps automation and CI/CD pipelines.

