#!/bin/bash

status=$(minishift status)

if [ $status = "Running" ]; then
   echo "## Minishift is already running. We will log on to openshift"
else
  echo "## Start Minishift and log on to OpenShift"
  minishift start
fi

eval $(minishift docker-env)