# Git Reset vs Git Revert — Comparison

| Point                                | git reset                                                                                       | git revert                                                                |
| ------------------------------------ | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| **What it does?**                    | Moves the branch pointer (HEAD) to an older commit and can remove commits from current history. | Creates a new commit that reverses the changes made by a previous commit. |
| **Removes commit from history?**     | Yes, it can remove commits from the branch history.                                             | No, it keeps the old commit history and adds a new revert commit.         |
| **Safe for shared/pushed branches?** | No, generally unsafe for shared branches because it rewrites history.                           | Yes, safe for shared branches because it does not rewrite history.        |
| **When to use?**                     | Use when working on local branches and you want to undo commits or clean up history.            | Use when a commit is already pushed and you need to safely undo changes.  |

---

# Examples

## git reset

Move branch back to previous commit:

```bash
git reset --hard <commit_id>
```

Example:

Before:

```text
A --- B --- C --- D (main)
```

Run:

```bash
git reset --hard B
```

After:

```text
A --- B (main)
```

Commits `C` and `D` are removed from the branch history.

---

## git revert

Create a new commit that reverses changes:

```bash
git revert <commit_id>
```

Example:

Before:

```text
A --- B --- C --- D (main)
```

Run:

```bash
git revert C
```

After:

```text
A --- B --- C --- D --- R (main)
```

`R` is a new commit that undoes the changes of commit `C`.

---

# Simple Difference

## git reset

```
Remove or move history backward
(Local work)
```

## git revert

```
Create a new commit to undo changes
(Shared work)
```

---

# DevOps Real-World Usage

| Situation                          | Command                    |
| ---------------------------------- | -------------------------- |
| Mistake in local commit            | git reset                  |
| Remove last local commit           | git reset --soft / --mixed |
| Delete everything from last commit | git reset --hard           |
| Undo pushed production change      | git revert                 |
| Team/shared branch correction      | git revert                 |

---

# Rule to Remember

```
Not pushed yet  →  git reset

Already pushed  →  git revert
```

