#!/bin/bash
#
#	Installationsscript cdi

# DevOps Umgebungen

kubectl apply -f https://raw.githubusercontent.com/mc-b/duk/master/devops/eclipse-theia.yaml

microk8s helm3 repo add jenkins https://charts.jenkins.io
microk8s helm3 repo update
microk8s helm3 upgrade --install jenkins --namespace jenkins -f scripts/values.yaml jenkins/jenkins

# Jupyter Scripte etc. Allgemein in Eclipse Theia verfuegbar machen
mkdir -p /data/project/src
mkdir -p /data/project/cdi
cp -rpv [0?]* /data/project/cdi/

