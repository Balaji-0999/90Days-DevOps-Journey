Compose Command Cheat Sheet
Command	Logic
docker compose up	Create/start services
docker compose up -d	Start in background
docker compose ps	Show project services
docker compose logs	Show logs
docker compose logs -f	Follow logs
docker compose logs mysql	MySQL logs
docker compose stop	Stop services
docker compose start	Start stopped services
docker compose restart	Restart services
docker compose down	Remove containers + network
docker compose build	Build images
docker compose up --build	Build then start
docker compose config	Validate/render Compose configuratio

What is a Dockerfile?
Why do we need FROM?
What does WORKDIR do?
Difference between COPY and RUN.
Difference between RUN and CMD.
What is a Docker image?
What is an image tag?
What is Docker build context?
Why do we use .dockerignore?
What is Docker layer caching?
Why can Docker images have multiple layers?
How does an image become a running container?
Why is a small production image desirable?
Why should dependencies be copied/installed before frequently changing application code?
