#!/bin/bash
#
#	Installationsscript cdi

# Compiler Umgebungen
docker pull misegr/make
docker pull misegr/mbed-cli
docker pull misegr/maven

# Jupyter Scripte etc. Allgemein verfuegbar machen
cp -rpv [0?]*/* /data/src/