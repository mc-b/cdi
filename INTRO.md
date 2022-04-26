Kubernetes
==========

Umgebung zum Kurs: [DevOps Engineering Practices & Tools (CDI)](https://github.com/mc-b/cdi).

Services
--------

* https://${fqdn}:8443 - Kubernetes Dashboard (kein Token notwendig, Überspringen drücken)
* http://${fqdn}:32400 - Entwicklungsumgebung Eclipse Theia
* http://${fqdn}:32100 - CI/CD Jenkins (User/PW: admin)

Patches
-------

Bevor die erste Pipeline gestartet werden kann ist der Jenkins-URL anzupassen.

-> Jenkins Verwalten -> Knoten Verwalten (rechts) -> Configure Clouds (links) -> Kubernetes Cloud Details

URL von `http://jenkins.jenkins.svc.microk8s-cluster:8080` auf `http://jenkins:8080` ändern.

