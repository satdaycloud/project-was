#!/bin/bash

SERVICE=$1
MODE=$2
PROJECT_HOME="/home/osboxes/project"

if [ $# -ne 2 ]
then
  echo "usage: $0 [petclinic|service2] [startup|shutdown]"
  exit 1
fi


case $SERVICE in
  petclinic)
    if [ $MODE = "startup" ]; then
      ${PROJECT_HOME}/comp/petclinic/bin/startup.sh 10
    else # shutdown
      ${PROJECT_HOME}/comp/petclinic/bin/shutdown.sh
    fi
    ;;
  service2)
    echo ""  
    ;;
  *)
    echo "invaild service"
    ;;
esac

