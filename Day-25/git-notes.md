# Git Reset Notes

## 1. What is the difference between `--soft`, `--mixed`, and `--hard`?

`git reset` moves the `HEAD` pointer to another commit. The difference is what happens to the **staging area** and **working directory**.

| Reset Mode          | Commit History      | Staging Area                | Working Directory |
| ------------------- | ------------------- | --------------------------- | ----------------- |
| `--soft`            | Last commit removed | Changes remain **staged**   | Changes remain    |
| `--mixed` (default) | Last commit removed | Changes become **unstaged** | Changes remain    |
| `--hard`            | Last commit removed | Changes removed             | Changes removed   |

### Example

Suppose the commit history is:

```text
A
│
B
│
C ← HEAD
```

### `git reset --soft HEAD~1`

After reset:

```text
A
│
B ← HEAD
```

* Commit **C** is removed.
* Changes from **C** stay in the **staging area**.
* You can commit them again immediately.

---

### `git reset --mixed HEAD~1`

After reset:

```text
A
│
B ← HEAD
```

* Commit **C** is removed.
* Changes remain in the **working directory**.
* They are **not staged**.
* You must run `git add` before committing again.

---

### `git reset --hard HEAD~1`

After reset:

```text
A
│
B ← HEAD
```

* Commit **C** is removed.
* Staging area is cleared.
* Working directory changes are deleted.
* Uncommitted changes are lost.

---

# 2. Which one is destructive and why?

**`git reset --hard`** is destructive.

**Why?**

It permanently removes:

* The last commit.
* All staged changes.
* All working directory changes.

If those changes are not available in another commit or backup, they cannot be recovered easily.

---

# 3. When would you use each one?

### `git reset --soft`

Use when:

* You want to change the last commit message.
* You want to combine multiple commits into one.
* You want to keep everything staged.

Example:

```bash
git reset --soft HEAD~1
```

---

### `git reset --mixed`

Use when:

* You want to undo the last commit.
* You want to edit files before committing again.
* You want to unstage files.

Example:

```bash
git reset --mixed HEAD~1
```

---

### `git reset --hard`

Use when:

* You want to completely discard unwanted local changes.
* You want your repository to exactly match a previous commit.

Example:

```bash
git reset --hard HEAD~1
```

Use this command very carefully.

---

# 4. Should you ever use `git reset` on commits that are already pushed?

Generally, **No**.

**Reason:**

If a commit has already been pushed to a shared remote repository, using `git reset` changes commit history. Other people who have already pulled those commits may face merge conflicts or history mismatches.

For shared branches (like `main` or `master`), prefer **`git revert`** because it creates a new commit that safely undoes the changes without rewriting history.

You may use `git reset` on pushed commits only if:

* It is your own branch.
* No one else is using it.
* You understand the consequences and, if needed, will force-push (`git push --force`) carefully.

---

## Quick Summary

| Command             | Commit      | Staging Area          | Working Directory | Safe?       |
| ------------------- | ----------- | --------------------- | ----------------- | ----------- |
| `git reset --soft`  | Undo commit | Keep staged           | Keep changes      | ✅ Yes       |
| `git reset --mixed` | Undo commit | Unstage changes       | Keep changes      | ✅ Yes       |
| `git reset --hard`  | Undo commit | Remove staged changes | Delete changes    | ❌ Dangerous |

