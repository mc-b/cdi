#!/bin/bash
#
#	Installationsscript cdi

#Jenkins
microk8s helm3 repo add jenkins https://charts.jenkins.io
microk8s helm3 repo update
microk8s kubectl create namespace jenkins
microk8s helm3 upgrade --install jenkins --namespace jenkins -f scripts/values.yaml jenkins/jenkins

# gitlab-runner
sudo microk8s helm3 repo add gitlab https://charts.gitlab.io
sudo microk8s kubectl create namespace gitlab
sudo microk8s helm3 install -n gitlab gitlab-runner gitlab/gitlab-runner  

# Eclipse Theia
kubectl apply -f https://raw.githubusercontent.com/mc-b/duk/master/devops/eclipse-theia.yaml

mkdir -p /data/project/src
mkdir -p /data/project/cdi
cp -rpv [0?]* /data/project/cdi/

mkdir -p /data/project/cdi-gitops
mkdir -p /data/project/cdi-gitops/infra
mkdir -p /data/project/cdi-gitops/apps

for infra in 02-SCM 03-cloud-init 03-terraform
do
    cd /data/project/cdi-gitops/infra && git clone https://gitlab.com/cdi-gitops/infra/${infra}
done  

for apps in 04-simple-java-app 05-make 05-maven 05-web-app 06-web-app 07-web-app 08-web-app
do
    cd /data/project/cdi-gitops/apps && git clone https://gitlab.com/cdi-gitops/apps/${apps}
done
