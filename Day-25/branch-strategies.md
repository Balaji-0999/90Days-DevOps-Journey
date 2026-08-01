# Git Branching Strategies

Branching strategies define how teams organize branches, manage code changes, and release software.

---

# 1. GitFlow

## How it works

GitFlow uses multiple long-lived branches to manage development and releases.

Main branches:

* `main` → Production-ready code
* `develop` → Integration branch for new features
* `feature/*` → New feature development
* `release/*` → Prepare a release
* `hotfix/*` → Emergency production fixes

---

## Flow Diagram

```text
                 main
                  |
                  |
             release/v1.0
                  |
                  |
develop ----------------
   |
   |
feature/login
feature/payment
feature/profile

                  |
              hotfix/bug-fix
                  |
                main
```

---

## Branch Example

```bash
main

develop

feature/login
feature/payment

release/v1.0

hotfix/security-fix
```

---

## Where It Is Used

Used in:

* Large enterprise applications
* Projects with scheduled releases
* Software products with multiple versions

Examples:

* Banking software
* Enterprise applications
* Products with monthly/quarterly releases

---

## Pros

✅ Clear release process
✅ Good for version management
✅ Easy to maintain multiple releases
✅ Suitable for large teams

---

## Cons

❌ More complex workflow
❌ Many branches to maintain
❌ Slower deployment cycle
❌ Not ideal for continuous delivery

---

# 2. GitHub Flow

## How it works

GitHub Flow is a simple workflow where developers create short-lived feature branches from `main` and merge them back after review.

Branches:

* `main` → Always deployable
* `feature branch` → New changes

---

## Flow Diagram

```text
              main
               |
               |
        feature/login
               |
               |
          Pull Request
               |
               |
              main
               |
               |
           Deploy
```

---

## Branch Example

```bash
main

feature/add-login

feature/update-ui
```

---

## Where It Is Used

Used in:

* Startups
* Web applications
* Continuous deployment projects
* Small and medium teams

---

## Pros

✅ Simple workflow
✅ Fast development
✅ Easy code review using Pull Requests
✅ Perfect for CI/CD

---

## Cons

❌ Difficult to manage multiple versions
❌ Not ideal for scheduled releases
❌ Requires strong testing automation

---

# 3. Trunk-Based Development

## How it works

All developers work on a single main branch (`main`/`trunk`).

Changes are integrated frequently using:

* Small commits
* Short-lived branches
* Feature flags
[O
---

## Flow Diagram

```text
                 main (trunk)
                     |
    --------------------------------
    |              |               |
 Developer A   Developer B    Developer C
    |              |               |
 Small Commit  Small Commit   Small Commit
    |              |               |
    --------------------------------
                     |
                   main
```

---

## Branch Example

```bash
main

short-feature-branch (few hours/days)

main
```

---

## Where It Is Used

Used by:

* High-performing engineering teams
* Companies practicing Continuous Delivery
* Large-scale software organizations

Examples:

* SaaS companies
* Cloud platforms
* Fast-moving products

---

## Pros

✅ Very fast integration
✅ Less merge conflicts
✅ Continuous delivery friendly
✅ Simple branch management

---

## Cons

❌ Requires strong testing
❌ Bad commits can affect everyone
❌ Requires good CI/CD pipeline

---

# GitFlow vs GitHub Flow vs Trunk-Based

| Feature            | GitFlow            | GitHub Flow       | Trunk-Based           |
| ------------------ | ------------------ | ----------------- | --------------------- |
| Complexity         | High               | Medium            | Low                   |
| Main Branch Usage  | Production only    | Always deployable | Daily development     |
| Release Management | Excellent          | Basic             | Depends on automation |
| Best For           | Scheduled releases | Fast shipping     | Continuous delivery   |
| Branch Lifetime    | Long               | Short             | Very short            |
| CI/CD Friendly     | Medium             | High              | Very High             |

---

# Scenario Based Answers

## 1. Which strategy would you use for a startup shipping fast?

### Answer: GitHub Flow

Reason:

* Startups need speed
* Frequent deployments
* Simple workflow
* Easy Pull Request review
* Works well with CI/CD

Flow:

```text
Feature Branch
       |
       |
 Pull Request
       |
       |
     main
       |
       |
   Production
```

---

## 2. Which strategy would you use for a large team with scheduled releases?

### Answer: GitFlow

Reason:

* Multiple teams can work together
* Supports release planning
* Handles production hotfixes
* Good version management

Flow:

```text
feature
   |
develop
   |
release
   |
main
```

---

# 3. Which one does your favorite open-source project use?

Example:

## Kubernetes

Repository:

```text
https://github.com/kubernetes/kubernetes
```

Uses a workflow closer to **GitHub Flow / Trunk-Based Development**.

Why:

* Main branch is continuously developed
* Changes come through Pull Requests
* Automated CI checks validate changes
* Short-lived branches are common

---

# Final Summary

```text
GitFlow
 |
 |-- Best for: Large teams + planned releases
 |
 |-- Branches:
     main
     develop
     feature
     release
     hotfix


GitHub Flow
 |
 |-- Best for: Startups + fast deployment
 |
 |-- Branches:
     main
     feature


Trunk-Based Development
 |
 |-- Best for: High-speed DevOps teams
 |
 |-- Branches:
     main
     short-lived branches
```

**Rule of thumb:**

```text
Scheduled Releases     → GitFlow

Fast Startup Delivery  → GitHub Flow

Continuous Deployment  → Trunk-Based Development
```

