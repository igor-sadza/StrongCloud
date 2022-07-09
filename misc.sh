#!/bin/bash

function guardExec() {
  _parentProcess=$(ps -o comm= $PPID)

  echo $_parentProcess

  if [ "$_parentProcess" != "make" ]; then
    # LOG -> 
    echo "Please run this script using make"
    exit 1
  fi
  echo "Executalbe my make"
}

#guardExec
#ls
