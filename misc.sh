#!/bin/bash

. ./help/log.sh

function guardExec() {
  _parentProcess=$(ps -o comm= $PPID)

  echo $_parentProcess

  if [ "$_parentProcess" != "make" ]; then
  	log "ERROR" "Please run this script using make"
    exit 1
  fi
	  log "INFO" "Executabled by make"
}

#guardExec
#ls
