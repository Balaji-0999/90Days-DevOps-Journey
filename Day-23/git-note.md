# Git Commands Cheat Sheet for DevOps Engineers

Git is a distributed version control system used to track changes in source code. Every DevOps engineer uses Git daily for collaboration, CI/CD pipelines, deployments, and infrastructure management.

This README explains the most important Git commands, why we use them, and where they are used in real-world DevOps environments.

---

## 1. `git branch`

### Why do we use it?

To list all branches in the current repository.

### Command

```bash
git branch
```

### Example Output

```bash
* main
  feature-1
  dev
```

* `*` indicates the current branch.
* Helps developers know which branches exist.

### DevOps Usage

* Checking available branches before deployment.
* Identifying release and development branches.

---

## 2. `git branch feature-1`

### Why do we use it?

To create a new branch named `feature-1`.

### Command

```bash
git branch feature-1
```

### Internal Working

Git creates a new pointer to the current commit.

```text
A---B---C (main)
         \
          (feature-1)
```

### DevOps Usage

* Creating feature branches.
* Isolating new changes from production code.

---

## 3. `git switch feature-1`

### Why do we use it?

To switch from the current branch to another branch.

### Command

```bash
git switch feature-1
```

### Example

```bash
Switched to branch 'feature-1'
```

### DevOps Usage

* Moving between development, testing, and release branches.

---

## 4. `git switch -c feature-2`

### Why do we use it?

To create and switch to a new branch in one command.

### Command

```bash
git switch -c feature-2
```

### Equivalent To

```bash
git branch feature-2
git switch feature-2
```

### DevOps Usage

* Quickly starting work on a new feature.

---

## 5. `git checkout -b feature-2`

### Why do we use it?

Older Git command to create and switch branches.

### Command

```bash
git checkout -b feature-2
```

### Equivalent To

```bash
git switch -c feature-2
```

### Note

* `git checkout` is older.
* `git switch` is newer and more readable.

---

## 6. `git branch -d feature-2`

### Why do we use it?

To delete a branch after it has been merged.

### Command

```bash
git branch -d feature-2
```

### Example

```bash
Deleted branch feature-2
```

### DevOps Usage

* Cleaning up merged branches.
* Keeping repositories organized.

---

## 7. `git remote -v`

### Why do we use it?

To view configured remote repositories.

### Command

```bash
git remote -v
```

### Example Output

```bash
origin  https://github.com/user/project.git (fetch)
origin  https://github.com/user/project.git (push)
```

### DevOps Usage

* Verifying GitHub/GitLab connections.
* Troubleshooting push and pull issues.

---

## 8. `git remote add origin <URL>`

### Why do we use it?

To connect a local repository to a remote repository.

### Command

```bash
git remote add origin https://github.com/user/project.git
```

### Example

```text
Local Repository -----> GitHub Repository
        origin
```

### DevOps Usage

* Connecting repositories to GitHub.
* Preparing repositories for CI/CD pipelines.

---

## 9. `git push -u origin master`

### Why do we use it?

To push the `master` branch to GitHub and set upstream tracking.

### Command

```bash
git push -u origin master
```

### Meaning

* `push` → Upload code.
* `-u` → Set upstream.
* `origin` → Remote name.
* `master` → Branch name.

### DevOps Usage

* First-time repository setup.
* Uploading code to remote repositories.

---

## 10. `git push -u origin feature-1`

### Why do we use it?

To push a feature branch to GitHub.

### Command

```bash
git push -u origin feature-1
```

### DevOps Usage

* Creating Pull Requests.
* Team collaboration.
* Feature development workflows.

---

## 11. `git pull`

### Why do we use it?

To download and merge the latest changes from the remote repository.

### Command

```bash
git pull
```

### Internal Working

```bash
git fetch
git merge
```

### DevOps Usage

* Getting the latest code before deployment.
* Synchronizing local repositories.

---

## 12. `git fetch`

### Why do we use it?

To download changes without merging them.

### Command

```bash
git fetch
```

### Example

```text
Local main      : A---B
origin/main     : A---B---C
```

### Benefits

* Safe.
* Allows reviewing changes before merging.

### DevOps Usage

* Inspecting production changes.
* Reviewing updates before merging.

---

## 13. `git clone`

### Why do we use it?

To download an entire repository from a remote source.

### Command

```bash
git clone https://github.com/user/project.git
```

### What Happens?

Git automatically:

1. Downloads all files.
2. Creates a `.git` directory.
3. Configures `origin`.
4. Checks out the default branch.

### Example

```text
GitHub Repository
        |
        v
git clone
        |
        v
Local Repository
```

### DevOps Usage

* Cloning company repositories.
* Setting up development environments.
* Downloading Infrastructure-as-Code repositories.

---

## Common Git Workflow

```bash
git clone <URL>
git branch feature-1
git switch feature-1
git add .
git commit -m "Added new feature"
git push -u origin feature-1
git pull
```

---

## Summary Table

| Command                        | Purpose                        |
| ------------------------------ | ------------------------------ |
| `git branch`                   | List branches                  |
| `git branch feature-1`         | Create a branch                |
| `git switch feature-1`         | Switch branch                  |
| `git switch -c feature-2`      | Create and switch branch       |
| `git checkout -b feature-2`    | Create and switch (old method) |
| `git branch -d feature-2`      | Delete branch                  |
| `git remote -v`                | Show remotes                   |
| `git remote add origin`        | Add remote repository          |
| `git push -u origin master`    | Push master branch             |
| `git push -u origin feature-1` | Push feature branch            |
| `git pull`                     | Download and merge changes     |
| `git fetch`                    | Download changes only          |
| `git clone`                    | Download a repository          |

---

## Final Note

Every DevOps engineer should be comfortable with these commands because they are used in:

* GitHub
* GitLab
* Jenkins
* GitHub Actions
* CI/CD Pipelines
* Kubernetes Deployments
* Infrastructure as Code (Terraform)
* Team Collaboration

Mastering these commands will make working with source code and automation pipelines significantly easier.

