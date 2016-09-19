#!/usr/bin/env bash

oc logout
oc login $(minishift ip):8443 -u system:admin -p admin -n default
echo "## Delete vertx-demo project"
oc delete project vertx-demo

oc login $(minishift ip):8443 -u vertx-dev -p devel

echo "## Log on with the dev user, create the vertx project"
oc new-project vertx-demo

echo "## Add policies"
oc policy add-role-to-user view vertx-dev -n vertx-demo
oc policy add-role-to-group view system:serviceaccounts -n vertx-demo