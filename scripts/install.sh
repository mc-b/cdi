#!/bin/bash
#
#	Installationsscript cdi

#Jenkins
#microk8s helm3 repo add jenkins https://charts.jenkins.io
#microk8s helm3 repo update
#microk8s kubectl create namespace jenkins
#microk8s helm3 upgrade --install jenkins --namespace jenkins -f scripts/values.yaml jenkins/jenkins

# gitlab-runner
sudo microk8s helm3 repo add gitlab https://charts.gitlab.io
sudo microk8s kubectl create namespace gitlab
sudo microk8s helm3 install -n gitlab gitlab-runner gitlab/gitlab-runner  

# Eclipse Theia
kubectl apply -f https://raw.githubusercontent.com/mc-b/duk/master/devops/eclipse-theia.yaml

mkdir -p /data/project/src
mkdir -p /data/project/cdi-jenkins
cp -rpv [0?]* /data/project/cdi-jenkins/

mkdir -p /data/project/cdi
mkdir -p /data/project/cdi/infra
mkdir -p /data/project/cdi/apps

for infra in 02-cloud-init 02-terraform 03-SCM aws azure maas template
do
    cd /data/project/cdi/infra && git clone https://gitlab.com/ch-mc-b/cdi/infra/${infra}.git
done  

for apps in 04-make 04-maven 05-web-app 06-web-app 07-web-app 08-web-app py-my-web-app web-app web-app-full
do
    cd /data/project/cdi/apps && git clone https://gitlab.com/ch-mc-b/cdi/apps/${apps}.git
done
