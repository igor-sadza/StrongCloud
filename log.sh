#!/bin/bash

_PARENT=$(ps -o comm= $PPID)

declare -A _COLORS
_COLORS=(
  ["RED"]="0;31m"
  ["LRED"]="1;31m"
  ["GREEN"]="0;32m"
  ["LGREEN"]="1;32m"
  ["BROWN"]="0;33m"
  ["LBROWN"]="1;33m"
  ["BLUE"]="0;34m"
  ["LBLUE"]="1;34m")

function colorprint() { 
	echo -en "\033[${_COLORS["BROWN"]}[$_PARENT] \033[0m"
	echo -en "\033[${_COLORS["LBROWN"]}[$2] \033[0m"

  if [[ "$1" == ${_COLORS["RED"]} ]]; then
	  echo -en "\033[$1[$3 \033[0m"
  	echo -en "\033[${_COLORS["LRED"]}Terminated!\033[0m"
	  echo -e "\033[$1]\033[0m"
  elif [[ "$1" == ${_COLORS["GREEN"]} ]]; then
	  echo -en "\033[$1[$3 \033[0m"
  	echo -en "\033[${_COLORS["LGREEN"]}Procced!\033[0m"
	  echo -e "\033[$1]\033[0m"
  fi
}
  
function log() {
  function logline() {
    colorprint "$1" "$2" "$3";
  }
	
	_child=$(echo $0 | sed -e 's/.*\///g')

  case $1 in
    ERROR)
      logline ${_COLORS["RED"]} "$_child" "$2" >&2 
      ;;
    INFO)
      logline ${_COLORS["GREEN"]} "$_child" "$2" 
      ;;
    *)
      log "ERROR" "unknow log level"
      return 1
      ;;
  esac
}
