#!/bin/bash
#
#	Installationsscript cdi

# Compiler Umgebungen
docker pull misegr/make
docker pull misegr/mbed-cli
docker pull misegr/maven
kubectl apply -f hhttps://raw.githubusercontent.com/mc-b/duk/master/registry/nexus3.yaml

# Jupyter Scripte etc. Allgemein verfuegbar machen
cp -rpv [0?]*/* /data/src/

