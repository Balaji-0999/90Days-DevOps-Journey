# Day 23 - Git Branches Fundamentals

## Objective

The goal of Day 23 is to understand Git branches, why they are important, and how Git internally manages branches during development.

Time Spent: **15 Minutes**

---

## What is a Branch?

A branch is an independent line of development in Git.

It allows developers to work on new features, bug fixes, or experiments without affecting the existing codebase.

### Example

Suppose your application is running successfully in production:

```text id="5nwjtw"
main
 |
A---B---C
```

You want to add a new login feature.

Instead of making changes directly on `main`, you create a new branch:

```text id="9civvv"
main
 |
A---B---C
         \
          feature-login
```

Now, all your changes happen in `feature-login` while `main` remains safe and stable.

### Why Are Branches Important?

* Isolate changes.
* Prevent breaking production code.
* Enable team collaboration.
* Support parallel development.
* Simplify code reviews and Pull Requests.

### Real-World DevOps Usage

Branches are commonly used for:

* Feature development
* Bug fixes
* Hotfixes
* Release management
* Infrastructure changes (Terraform, Kubernetes, Ansible)

---

## Why Not Work Directly on `main`?

Working directly on `main` is considered a bad practice in most organizations.

### Example

Imagine the following:

```text id="vw78vn"
main
 |
A---B---C
```

You add a change directly to `main`:

```text id="s0n4j5"
main
 |
A---B---C---D
```

If commit `D` contains:

* Bugs
* Security issues
* Configuration mistakes
* Deployment failures

Then the production environment may be affected.

### Better Approach

```text id="ppzdgw"
main
 |
A---B---C
         \
          feature-auth
                 |
                 E---F
```

After testing and code review:

```text id="0lhjmg"
main
 |
A---B---C---G
```

Where `G` is the merge commit.

### Benefits

* Production remains stable.
* Teams can review code before merging.
* Easier rollback if something goes wrong.

### Industry Practice

Most companies protect their `main` branch by:

* Requiring Pull Requests.
* Enforcing code reviews.
* Running CI/CD checks.
* Preventing direct pushes.

---

## What is `HEAD`?

`HEAD` is a special pointer in Git.

It tells Git:

> "This is the branch and commit the developer is currently working on."

### Example

```text id="hl57a5"
main
 |
A---B---C
         ^
        HEAD
```

This means:

* Current branch = `main`
* Current commit = `C`

If you switch branches:

```text id="vafhcf"
main
 |
A---B---C

feature-1
 |
A---B---C---D
             ^
            HEAD
```

Now, Git knows that you are working on `feature-1`.

### Useful Command

```bash id="6j9n3m"
git branch
```

Example Output:

```bash id="i9l33d"
* feature-1
  main
```

The `*` symbol indicates the branch pointed to by `HEAD`.

### Internal Working

Git stores `HEAD` in:

```text id="d6j3ze"
.git/HEAD
```

Example:

```text id="wh22u6"
ref: refs/heads/main
```

This means `HEAD` currently points to the `main` branch.

---

## What Happens When Switching Branches?

Command:

```bash id="95zdsv"
git switch feature-1
```

When Git switches branches, it performs the following actions:

1. Moves the `HEAD` pointer.
2. Updates the working directory.
3. Loads files from the selected branch.
4. Changes the current branch reference.

### Example

Before switching:

```text id="j3d36e"
main
 |
A---B---C
         ^
        HEAD
```

After:

```text id="wh4nn0"
main
 |
A---B---C

feature-1
 |
A---B---C---D
             ^
            HEAD
```

### File Changes

Suppose:

#### `main`

```text id="m9j3be"
app.py
README.md
```

#### `feature-1`

```text id="rv9jqt"
app.py
README.md
Dockerfile
```

After running:

```bash id="x7jv1a"
git switch feature-1
```

Git automatically updates your working directory:

```text id="q18d4k"
app.py
README.md
Dockerfile
```

The `Dockerfile` appears because it exists in the selected branch.

---

## Summary

| Question                              | Answer                                        |
| ------------------------------------- | --------------------------------------------- |
| What is a branch?                     | An independent line of development.           |
| Why not work on `main`?               | To keep production safe from bugs.            |
| What is `HEAD`?                       | A pointer to the current branch and commit.   |
| What happens during branch switching? | Git updates `HEAD` and the working directory. |

---

## Interview Questions

### Q1. What is a branch in Git?

A branch is an independent line of development used to isolate changes from other work.

---

### Q2. Why should developers avoid working directly on `main`?

Because bugs or unstable code can impact production environments.

---

### Q3. What is `HEAD` in Git?

`HEAD` is a pointer that indicates the current branch and commit being used.

---

### Q4. What happens internally when you switch branches?

Git moves the `HEAD` pointer and updates the working directory to match the selected branch.

---

### Q5. How can you identify your current branch?

Use:

```bash id="qv8vse"
git branch
```

The branch marked with `*` is the current branch.

---

## Key Takeaways

* Branches allow safe and parallel development.
* Never make experimental changes directly on `main`.
* `HEAD` tells Git where you are.
* Switching branches changes both `HEAD` and the files in your working directory.
* Branching is a fundamental concept used by every DevOps engineer.

> "Branches make collaboration possible, and HEAD tells Git where your journey currently is."

