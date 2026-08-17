# Day 31 – Dockerfile: Build Your Own Images

## 1. What is a Dockerfile?

A **Dockerfile** is a text file containing instructions used to build a Docker image.

Example:

```dockerfile
FROM ubuntu
RUN apt-get update && apt-get install -y curl
CMD ["echo", "Hello from Docker!"]
```

Docker reads these instructions and creates an image.

---

## 2. What is `FROM`?

`FROM` specifies the **base image** for the Docker image.

Example:

```dockerfile
FROM ubuntu
```

This means the new image starts with the Ubuntu image.

`FROM` is usually the first instruction in a Dockerfile.

---

## 3. What is `RUN`?

`RUN` executes a command **during the Docker image build process**.

Example:

```dockerfile
RUN apt-get update && apt-get install -y curl
```

The command runs while `docker build` is executing, and its result becomes part of the image.

---

## 4. What is `COPY`?

`COPY` copies files or directories from the **build context on the host machine** into the Docker image.

Example:

```dockerfile
COPY index.html /usr/share/nginx/html/
```

This copies `index.html` into the Nginx web directory inside the image.

---

## 5. What is `WORKDIR`?

`WORKDIR` sets the **working directory** inside the container for subsequent Dockerfile instructions and the container's default working directory.

Example:

```dockerfile
WORKDIR /app
```

After this, commands such as `COPY` and `CMD` can work relative to `/app`.

---

## 6. What is `EXPOSE`?

`EXPOSE` documents the port that the application inside the container is expected to use.

Example:

```dockerfile
EXPOSE 8080
```

Important: `EXPOSE` **does not publish the port to the host**.

To publish a port, use:

```bash
docker run -p 8080:8080 image-name
```

---

## 7. What is `CMD`?

`CMD` specifies the **default command** that runs when a container starts.

Example:

```dockerfile
CMD ["echo", "Hello from my custom image!"]
```

The `CMD` can be overridden when running the container.

Example:

```bash
docker run image-name echo "Hello Docker"
```

---

## 8. What is `ENTRYPOINT`?

`ENTRYPOINT` defines the **main executable** that the container is intended to run.

Example:

```dockerfile
ENTRYPOINT ["echo"]
```

Then:

```bash
docker run image-name "Hello Docker"
```

effectively runs:

```text
echo "Hello Docker"
```

Arguments provided to `docker run` are normally passed to the entrypoint.

---

## 9. CMD vs ENTRYPOINT

| CMD                           | ENTRYPOINT                                 |
| ----------------------------- | ------------------------------------------ |
| Provides a default command    | Defines the main executable                |
| Can easily be overridden      | Usually remains fixed                      |
| Good for default behavior     | Good for defining the container's purpose  |
| Runtime arguments replace CMD | Runtime arguments are passed to ENTRYPOINT |

### Simple example

```dockerfile
ENTRYPOINT ["python"]
CMD ["app.py"]
```

Running:

```bash
docker run my-app
```

[<0;25;27Mruns approximately:

```text
python app.py
```

While:

```bash
[<0;25;27mdocker run my-app script.py
```

runs approximately:

```text
python script.py
```

---

## 10. What is `.dockerignore`?

`.dockerignore` specifies files and directories that Docker should **exclude from the build context**.

Example:

```text
node_modules
.git
*.md
.env
```

It helps:

* Reduce build context size
* Speed up builds
* Avoid sending unnecessary files
* Prevent files such as `.env` from being included in the build context

---

## 11. What is Docker build context?

The **build context** is the set of files and directories available to Docker during `docker build`.

For example:

```bash
docker build -t my-image:v1 .
```

The `.` means:

> Use the current directory as the build context.

Therefore, Docker can access files in that context when using instructions such as:

```dockerfile
COPY
```

Files excluded by `.dockerignore` are not included in the build context sent to the builder.

---

## 12. What is Docker layer caching?

Docker builds images in **layers**. Docker can reuse previously built layers when their inputs have not changed.

For example:

```dockerfile
FROM ubuntu
RUN apt-get update
COPY app.py /app/
CMD ["python3", "/app/app.py"]
```

If only `app.py` changes, Docker may reuse the earlier cached layers and rebuild from the affected layer onward.

This makes subsequent builds much faster.

---

## 13. Why does Dockerfile instruction order matter?

Dockerfile instruction order matters because Docker uses **layer caching**.

For example:

```dockerfile
COPY package.json .
RUN npm install
COPY . .
```

This can be more cache-friendly than:

```dockerfile
COPY . .
RUN npm install
```

If application source files change frequently, placing dependency-related instructions earlier allows Docker to reuse the dependency layer instead of reinstalling everything.

### Key idea:

> Put rarely changing instructions earlier and frequently changing instructions later.

---

[<0;36;28M## 14. Difference between Image and Container

| Image                                 | Container                            |
| ------------------------------------- | ------------------------------------ |
| Read-only template                    | Running/created instance of an image |
| Used to create containers             | Created from an image                |
| Contains application and dependencies | Runs the application                 |
| Immutable by design                   | Has a writable container layer       |
| Example: `nginx:alpine`               | Example: `my-nginx-container`        |

[<0;36;28mSimple relationship:

```text
[<0;36;28MDockerfile
    ↓
docker build
    ↓
Docker Image
    ↓
docker run
    ↓
[<0;36;28mContainer
```

[<0;36;28MOne image can be used to create multiple containers.

---

# 15. Commands Used During Today's Hands-on

### Create directories
[<0;36;28m
```bash
mkdir my-first-image
mkdir dockerfile-instructions
mkdir cmd-entrypoint
mkdir my-website
mkdir build-cache
```

### Create files

```bash
nano Dockerfile
nano index.html
nano message.txt
nano .dockerignore
```

### Build an image

```bash
docker build -t my-ubuntu:v1 .
```

### Build using a different Dockerfile

```bash
docker build -f Dockerfile.cmd -t cmd-demo:v1 .
```

