GitLab
======

GitLab Testumgebung zum Kurs: [DevOps Engineering Practices & Tools (CDI)](https://github.com/mc-b/cdi).

Git(Lab) Umgebung
-----------------

* http://${git} - GitLab Admin Oberfläche.
* Einloggen mit `root`.
* Für das Password: 
  * Rechte Maustaste auf Multipass Icon in der Taskleiste 
    -> ${git} -> Open Shell -> `sudo cat /etc/gitlab/initial_root_password`.

Development Umgebung
--------------------

* http://${dev}:32400 - Eclipse Theia Entwickungsumgebung
* http://${dev}:32100 - Jeninks (User/PW: admin)
* https://${dev}:8443 - Kubernetes Dashboard (ohne Token, Überspringen drücken)

CI/CD (Runner) Umgebung
-----------------------

* Rechte Maustaste auf Multipass Icon in der Taskleiste -> ${cicd} -> Open Shell
 