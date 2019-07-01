#!/usr/bin/env bash

function fn() {
  echo $LOCAL_VAR
}

# Iterate while there are arguments
while [ $# -gt 0 ]; do
  # If the argument begins with --, strip the -- to create the variable name
  # and then set it to the next argument
  if [[ $1 == *"--"* ]]; then
    v="${1/--/}"
    export $v="$2"
  fi

  # Remove the current argument
  shift
done

fn
./downstream.sh
