# Understanding `sed` in Linux – Search and Replace Like a DevOps Engineer

`sed` (Stream Editor) is one of the most powerful Linux commands used for searching, replacing, and manipulating text in files. It is widely used in DevOps for automating configuration changes across servers and applications.

---

## Basic Syntax

```bash
sed 's/nginx/apache/g' file
```

### Breakdown

| Part     | Meaning                                    |
| -------- | ------------------------------------------ |
| `sed`    | Stream Editor                              |
| `s`      | Substitute (replace)                       |
| `nginx`  | Text to search for                         |
| `apache` | Replacement text                           |
| `g`      | Global (replace all occurrences in a line) |
| `file`   | Target file name                           |

---

## Command Structure

```text
sed     's/nginx/apache/g'    file
 |              |              |
 |              |              └── File name
 |              └──────────────── Search & Replace rule
 └─────────────────────────────── Stream Editor
```

---

## Example 1: Replace Web Server Names

### File: `webserver.txt`

```text
nginx is running
nginx is fast
I like nginx
```

### Command

```bash
sed 's/nginx/apache/g' webserver.txt
```

### Output

```text
apache is running
apache is fast
I like apache
```

> **Note:** This command only displays the modified output in the terminal. It does **not** permanently change the file.

---

## Permanent Changes

To modify a file permanently, use the `-i` option:

```bash
sed -i 's/nginx/apache/g' webserver.txt
```

### Verify the Changes

```bash
cat webserver.txt
```

#### Output

```text
apache is running
apache is fast
I like apache
```

---

## Example 2: Change a Port Number

### File: `config.txt`

```text
server_port=8080
```

### Command

```bash
sed 's/8080/80/g' config.txt
```

### Output

```text
server_port=80
```

---

## Example 3: Replace an IP Address

### File: `app.env`

```text
DB_HOST=10.0.0.1
```

### Command

```bash
sed 's/10.0.0.1/192.168.1.10/g' app.env
```

### Output

```text
DB_HOST=192.168.1.10
```

---

## Understanding the `g` Flag

Consider the following text:

```text
nginx nginx nginx
```

### Without `g`

```bash
sed 's/nginx/apache/' file
```

#### Output

```text
apache nginx nginx
```

Only the first occurrence is replaced.

### With `g`

```bash
sed 's/nginx/apache/g' file
```

#### Output

```text
apache apache apache
```

All occurrences are replaced.

---

## Why Does `sed` Matter in DevOps?

DevOps engineers frequently manage hundreds of servers and configuration files. `sed` makes bulk text replacement quick and efficient.

### 1. Update Configuration Files

```bash
sed -i 's/DEBUG=true/DEBUG=false/g' .env
```

Used to disable debug mode in production environments.

---

### 2. Update Docker Image Versions

```bash
sed -i 's/app:v1/app:v2/g' docker-compose.yml
```

#### Before

```yaml
image: app:v1
```

#### After

```yaml
image: app:v2
```

---

### 3. Change Kubernetes Namespace

```bash
sed -i 's/dev/prod/g' deployment.yaml
```

---

### 4. Update Nginx Configuration

```bash
sed -i 's/8080/80/g' nginx.conf
```

---

### 5. Automate Version Updates in CI/CD Pipelines

```bash
VERSION=2.0

sed -i "s/VERSION=.*/VERSION=$VERSION/" app.env
```

This automatically updates the application version during Jenkins or GitHub Actions pipeline execution.

---

## Real-World Script Example

```bash
#!/bin/bash

ENV=$1

if [ "$ENV" = "prod" ]
then
    sed -i 's/DEBUG=true/DEBUG=false/g' .env
fi
```

### Output

```text
DEBUG=false
```

This script ensures that debug mode is disabled whenever the environment is set to `prod`.

---

## Summary

| Part     | Meaning                     |
| -------- | --------------------------- |
| `sed`    | Stream Editor               |
| `s`      | Substitute                  |
| `nginx`  | Search text                 |
| `apache` | Replacement text            |
| `g`      | Replace all occurrences     |
| `-i`     | Modify the file permanently |

---

## Golden Rule

```bash
sed 's/old/new/g' file
```

**Meaning:**

> Find all occurrences of `old` in the file and replace them with `new`.

---

## Final Thoughts

`sed` is one of the favorite tools of DevOps engineers because text replacement is a daily task. Whether you're working with:

* Configuration files
* YAML manifests
* `.env` files
* Docker Compose files
* Kubernetes deployments
* CI/CD pipelines

`sed` helps automate repetitive tasks efficiently and saves valuable time.

Mastering `sed` will make you more productive as a Linux and DevOps engineer.

