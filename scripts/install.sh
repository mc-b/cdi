#!/bin/bash
#
#	Installationsscript cdi

# Compiler und DevOps Umgebungen
kubectl apply -f https://raw.githubusercontent.com/mc-b/duk/master/compiler/make.yaml
kubectl apply -f https://raw.githubusercontent.com/mc-b/duk/master/compiler/maven.yaml
kubectl apply -f https://raw.githubusercontent.com/mc-b/duk/master/registry/nexus3.yaml
kubectl apply -f https://raw.githubusercontent.com/mc-b/duk/master/devops/gogs.yaml
kubectl apply -f https://raw.githubusercontent.com/mc-b/duk/master/devops/jenkins.yaml


# Jupyter Scripte etc. Allgemein verfuegbar machen
cp -rpv [0?]*/* /data/src/

