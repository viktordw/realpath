#!/bin/bash

export SCRIPT=`realpath $0`
export SCRIPTPATH=`dirname $SCRIPT`

function divider () {
  printf '=%.0s' {1..50} && printf '\n'
}
source "${SCRIPTPATH}/includes/hello.sh"

divider
printf "Trenutna putanja je:\n  ${PWD}\n"
printf "Putanja do glavnog fajla je:\n  ${SCRIPT}\n"
hello
divider
