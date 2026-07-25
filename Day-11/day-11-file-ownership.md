# Day 11 – File Ownership Challenge

## Objective

Learned how Linux file ownership works using `chown` and `chgrp`.

## Files Created

- devops-file.txt
- team-notes.txt
- project-config.yaml
- app-logs/
- heist-project/
- bank-heist/

## Ownership Changes

- devops-file.txt → ubuntu → tokyo → berlin
- team-notes.txt → ubuntu:ubuntu → ubuntu:heist-team
- project-config.yaml → professor:heist-team
- app-logs → berlin:heist-team
- heist-project → professor:planners
- bank-heist files → different owners and groups

## Commands Used

```bash
ls -l
chown
chgrp
chown -R
groupadd
useradd
mkdir
touch
```

## What I Learned

- File ownership and file permissions are different.
- `chown` changes the file owner.
- `chgrp` changes the file group.
- `chown owner:group` changes both owner and group together.
- `-R` recursively changes ownership of directories and all their contents.

## Real-World DevOps Use

Proper ownership ensures applications, services, containers, and shared directories can securely access the files they need without granting unnecessary privileges.
