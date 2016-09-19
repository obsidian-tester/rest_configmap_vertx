#!/usr/bin/env bash

oc login $(minishift ip):8443 -u admin -p admin
oc delete project vertx-demo

echo "## Delete vertx-demo project & create a new"
oc login $(minishift ip):8443 -u vertx-dev -p devel

echo "## Log on with the dev user, create the vertx project"
oc new-project vertx-demo

echo "## Add policies"
oc policy add-role-to-user view vertx-dev -n vertx-demo
oc policy add-role-to-group view system:serviceaccounts -n vertx-demo