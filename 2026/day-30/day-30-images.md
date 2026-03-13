### Task 1: Docker Images
1. Pull the `nginx`, `ubuntu`, and `alpine` images from Docker Hub
2. 2. List all images on your machine — note the sizes
->
![alt text](image.png)


3. Compare `ubuntu` vs `alpine` — why is one much smaller?
-> alpine is smaller

4. Inspect an image — what information can you see?
->
It shows images id, tags, exposed ports, env variables, entrypoint and cmd entry, OS info.

5. Remove an image you no longer need.
-> docker rmi img_id/image_name
![alt text](image-1.png)

### Task 2: Image Layers
1. Run `docker image history nginx` — what do you see?
-> I can see image ids with their respective commands.

2. Each line is a **layer**. Note how some layers show sizes and some show 0B

3. Write in your notes: What are layers and why does Docker use them?
->
done.

### Task 3: Container Lifecycle
Practice the full lifecycle on one container:
1. **Create** a container (without starting it)
2. **Start** the container
3. **Pause** it and check status
4. **Unpause** it
5. **Stop** it
6. **Restart** it
7. **Kill** it
8. **Remove** it
![alt text](image-2.png)
![alt text](image-3.png)

Check `docker ps -a` after each step — observe the state changes.

### Task 4: Working with Running Containers
1. Run an Nginx container in detached mode
2. View its **logs**
3. View **real-time logs** (follow mode)
![alt text](image-4.png)

4. **Exec** into the container and look around the filesystem
![alt text](image-5.png)
5. Run a single command inside the container without entering it
![alt text](image-6.png)

6. **Inspect** the container — find its IP address, port mappings, and mounts
![alt text](image-7.png)
![alt text](image-8.png)
![alt text](image-9.png)
---

### Task 5: Cleanup
1. Stop all running containers in one command
![alt text](image-12.png)

2. Remove all stopped containers in one command
![alt text](image-11.png)

3. Remove unused images
![alt text](image-13.png)

4. Check how much disk space Docker is using
![alt text](image-14.png)