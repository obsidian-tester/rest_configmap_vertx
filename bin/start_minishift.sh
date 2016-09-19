#!/bin/bash

status=$(minishift status)

if [ $status = "Running" ]; then
   echo "## Minishift is already running."
else
  echo "## Start Minishift"
  minishift start
fi

eval $(minishift docker-env)