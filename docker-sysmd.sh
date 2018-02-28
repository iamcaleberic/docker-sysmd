#!/bin/bash

file="/etc/systemd/system/docker-sysmd.service"
file2="/etc/systemd/system/docker-sysmd-containers.service"

function images {
  echo "Images"
  if [[ $? -eq 0  ]]; then
    if [[ -e "$file"  ]]; then
      echo Configuration file exists. You all good.
    else
     echo "Copying and Enabling service ..."
     cp lib/docker-sysmd.timer /etc/systemd/system/docker-sysmd.timer
     cp lib/docker-sysmd.service /etc/systemd/system/docker-sysmd.service
     systemctl enable docker-sysmd.timer && systemctl start docker-sysmd.timer
     echo "Timer Clears out all Images. Runs daily! :)"
    fi
  else
   echo "Service/Timer configuration failed :("
  fi
}

function containers {
  echo "Containers"
 if [[ $? -eq 0 ]]; then
   if [[ -e "$file2" ]]; then
     echo Configuration file exists. You all good.
   else
     echo "Copying and Enabling service ..."
     cp lib/docker-sysmd-containers.timer /etc/systemd/system/docker-sysmd-containers.timer
     cp lib/docker-sysmd-containers.service /etc/systemd/system/docker-sysmd-containers.service
     systemctl enable docker-sysmd-containers.timer && systemctl start docker-sysmd-containers.timer
     echo "Timer Clears out all Containers. Runs daily! :)"
   fi
 else
   echo "Service/Timer configuration failed :("
 fi
}


OPTIONS="Images Containers Quit"
select opt in $OPTIONS; do
  if [ "$opt" = "Images" ]; then
    images
    echo Docker Images Timer/Service configuration complete.
    exit
  elif [ "$opt" = "Containers" ]; then
    containers
    echo Docker Containers Timer/Service configuration complete.
    exit
  elif [ "$opt" = "Quit" ]; then
    echo Goodbye.
    exit
  else
    clear
    echo Bad option
  fi
done
