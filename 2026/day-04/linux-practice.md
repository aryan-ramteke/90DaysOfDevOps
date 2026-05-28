processes commands - 
1. ps 
![alt text](image.png)
![alt text](image-1.png)

2. top
![alt text](image-2.png)

3. htop
![alt text](image-3.png)

4. pstree
![alt text](image-4.png)

services commands -
1. systemctl list-units
![alt text](image-5.png)

2. sudo systemctl status  nginx
![alt text](image-6.png)

3. sudo systemctl stop nginx 
![alt text](image-7.png)

logs command -
1. journalctl -u nginx
![alt text](image-8.png)

2. journalcctl -xe -> very recent system errors
![alt text](image-9.png)

Inspecting a service -
* SSH

1. systemctl status ssh
![alt text](image-10.png)

2. systemctl is-enabled nginx
![alt text](image-11.png)

3. journalctl -u ssh -n 20 -> last 20 logs 
![alt text](image-12.png)

4. live logs while debugging
journalctl -u ssh -f

5. systemctl cat ssh -> shows file loc, start command and dependencies
![alt text](image-13.png)