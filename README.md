# Run Jenkins as a Non-Root user with Docker Compose

# Usage
SSH to your Host Machine and find out at which Group ID your docker socker is running under like so:
$ stat /var/run/docker.sock

# Output:
```bash:~$ stat /var/run/docker.sock
  File: /var/run/docker.sock
Size: 0    Blocks: 0    IO Block: 4096   socket
Device: 17h/23d Inode: 1044186     Links: 1
Access: (0660/srw-rw----)  Uid: (    0/    root)   Gid: ( 1001/  docker)
Access: 2021-02-04 03:45:46.400000000 +0200
Modify: 2021-02-04 03:45:46.400000000 +0200
Change: 2021-02-04 03:45:46.400000000 +0200
 Birth: -
 ```
 
 Naturally, the unix docker socket is running under user root.
 What we care about though is the actual group id (Gid), which is this case is 1001. Plug this value to the docker.env file, and you are good to go.

# Execute
```docker exec -it jenkins docker ps```
and you will get the running containers on your host.
You now can use root-less Jenkins to build docker images.
