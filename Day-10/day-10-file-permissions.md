# Day 10 – File Permissions & File Operations

## Objective

Learned how to create files, read files, understand Linux permissions, modify permissions, and test access.

## Files Created

- devops.txt
- notes.txt
- script.sh
<<<<<<< HEAD
- project/
=======
>>>>>>> 6a36550 (Day 10: Linux file permissions and file operations)

## Permission Changes

| File | Before | After |
|------|--------|-------|
| script.sh | -rw-r--r-- | -rwxr-xr-x |
| devops.txt | -rw-r--r-- | -r--r--r-- |
| notes.txt | -rw-r--r-- | -rw-r----- |
| project | drwxr-xr-x | drwxr-xr-x |

## Commands Used

```bash
touch
echo
cat
vim
head
tail
chmod
ls -l
mkdir
```

## What I Learned

- Linux permissions determine who can read, write, and execute files.
- The `chmod` command changes file and directory permissions.
- Executable permission is required to run shell scripts.
- Read-only files cannot be modified without write permission.
<<<<<<< HEAD
- File permissions are essential for securing Linux systems..
=======
- File permissions are essential for securing Linux systems.
>>>>>>> 6a36550 (Day 10: Linux file permissions and file operations)
