# docker-sysmd
Systemd Timer and Service for clearing up all images and/or containers daily

### Installation

**Run with elevated priviledges where necessary**

- Make sure `docker-sysmd.sh` is executable on your system
- Run

  `./docker-sysmd.sh`

  or

  `bash docker-sysmd.sh`

- Follow the prompts
  * Select `Images` to add timer and service for clearing all images daily
  * Select `Containers` to add timer and service for clearing all containers daily
  * Select `Prune` to add timer and service to remove dangling images, stopped containers, unused networks and build cache daily. 

- Service and Timer files are located in the `lib` folder.

- The script will copy a `.service` file and a correspoding `.timer` file to systemd path (where all your unit files are located). [Check the Arch Wiki on systemd](https://wiki.archlinux.org/index.php/Systemd)

- Confirm your timer has been set by running
	```
		sudo systemctl list-timers
	```

- Should give someting of the sort
```
NEXT                         LEFT          LAST                         PASSED       UNIT                         ACTIVATES
Tue 2018-02-20 01:00:00 UTC  31min left    Tue 2018-02-20 00:00:05 UTC  28min ago    docker-sysmd.timer           docker-sysmd.service
```

**Note: The commands run by both services are irreversible make sure you are aware of what you are doing**
