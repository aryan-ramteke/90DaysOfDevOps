## Quick-Fire Questions
Answer from memory, then verify:
1. What is the difference between an image and a container?
2. What happens to data inside a container when you remove it?
-> data inside container is ephemeral, it gets deleted whenever we remove the container.

3. How do two containers on the same custom network communicate?
-> Containers on the same custom Docker network communicate through Docker’s internal virtual network. Docker automatically provides DNS-based service discovery, so containers can reach each other using container names instead of IP addresses. Communication happens privately inside the network without needing exposed ports.

A custom bridge network provides:

isolated virtual network
internal DNS server
automatic service discovery

When a container joins the network:

Docker adds it to the network namespace
assigns an IP
registers container name in DNS

4. What does `docker compose down -v` do differently from `docker compose down`?
-> -v removes the docker volume created for the persistent data. whereas down just stops and remove containers along with the default resources it creates.

5. Why are multi-stage builds useful?
-> Multi-stage builds are useful because they help create smaller, cleaner, and more secure Docker images.
They allow you to:

use one stage for building the application
use another stage for running only the final output

This removes unnecessary files like:

source code
build tools
dependencies used only during compilation

6. What is the difference between `COPY` and `ADD`?
-> COPY:

Simply copies files/folders from host to container.
Preferred for most use cases.

ADD:

Can do everything COPY does
Plus extra features:
automatically extracts local .tar files
supports downloading files from URLs

7. What does `-p 8080:80` mean?
-> it publish/exposes service running inside container with port 80 to the host port 8080. It basically maps host port to the container port, which means anyone coming to the host ip with port 8080 will be redirected the container with port 80.

8. How do you check how much disk space Docker is using?
-> docker system df


------------------------------------------------------------------------------------------------------
# Docker Quick Reference

## Container Commands

* `docker run` — Create and start a new container
* `docker ps` — List running containers
* `docker stop <container>` — Stop a running container
* `docker rm <container>` — Remove a container
* `docker exec -it <container> sh` — Run commands inside a container
* `docker logs <container>` — View container logs

## Image Commands

* `docker build -t app .` — Build image from Dockerfile
* `docker pull <image>` — Download image from registry
* `docker push <image>` — Push image to registry
* `docker tag <image> repo/image:tag` — Add tag to image
* `docker images` — List local images
* `docker rmi <image>` — Remove image

## Volume Commands

* `docker volume create <name>` — Create a volume
* `docker volume ls` — List volumes
* `docker volume inspect <name>` — Show volume details
* `docker volume rm <name>` — Remove volume

## Network Commands

* `docker network create <name>` — Create network
* `docker network ls` — List networks
* `docker network inspect <name>` — Show network details
* `docker network connect <network> <container>` — Connect container to network

## Compose Commands

* `docker compose up` — Start services
* `docker compose down` — Stop and remove services
* `docker compose ps` — List compose containers
* `docker compose logs` — View compose logs
* `docker compose build` — Build compose services/ Only builds/rebuilds images from the Dockerfile.

## Cleanup Commands

* `docker system prune` — Remove unused Docker resources
* `docker system df` — Show Docker disk usage

## Dockerfile Instructions

* `FROM` — Base image for build
* `RUN` — Execute command during build
* `COPY` — Copy files into image
* `WORKDIR` — Set working directory
* `EXPOSE` — Document container port
* `CMD` — Default command at container start
* `ENTRYPOINT` — Fixed executable for container
