#!/usr/bin/env bash

minishift delete
minishift start --deploy-registry=true --deploy-router=true --memory=4048 --vm-driver="xhyve"