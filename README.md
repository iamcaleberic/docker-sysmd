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
  * Select `Image` to add timer and service for clearing all images daily
  * Select `Containers` to add timer and service for clearing all containers daily

- Service and Timer files are located in the `lib` folder.

**Note: The commands run by both services are irreversible make sure you are aware of what you are doing**
