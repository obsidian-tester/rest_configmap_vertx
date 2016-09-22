#!/bin/bash

echo "## Start minishift if not yet done"
./bin/start_minishift.sh

echo "## Start minishift if not yet done"
./bin/clean-project.sh

echo "## Create the configMap"
oc create configmap app-config --from-file=src/main/resources/app.json

echo "## Remove old docker image"
docker rmi -f vertx-demo/simple-config-map:1.0.0-SNAPSHOT

echo "## Create the docker image, kubernetes/openshift config file and deploy the pod"
mvn clean fabric8:run -Dfabric8.mode=openshift

sleep 5s

echo "## Call REST endpoint"
export service=$(minishift service simple-vertx-configmap -n vertx-demo --url=true)
http $service/products