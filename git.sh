#!/bin/bash

#_path=$(dirname "$0")
#
#. ./help/misc.sh
#
#guardExec

function main() {
  case $1 in
  commit)
    echo "git commit" 
    ;;

  push)
    echo "git push" 
    ;;

  status)
    git status
    ;;

  pull)
    echo "git pull" 
    ;;

  *)
    echo ".." 
    ;;
  esac
}

main $@
