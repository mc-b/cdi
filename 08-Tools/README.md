GitLab 
------

Lokale GitLab Installation zu Testzwecken.
* http://${fqdn} - GitLab Admin Oberfläche. Einloggen mit `root`, dass Password steht in der Datei `/etc/gitlab/initial_root_password`.

Runners
-------

Werden für die Pipeline Jobs benötigt. Keine Runners, keine Pipelines in Gitlab!

### Shell

Erlaubt das Ausführen von Shellscripts auf der lokalen VM, wo auch GitLab installiert ist.

Die Installation, wie in `Admin` -> `Runners` beschrieben, erfolgt im Cloud-init Script.

Es muss nur noch der Befehl `Command to register runner` ausgeführt werden.

    sudo gitlab-runner register --url http://gitlab-28-default.mshome.net/ --registration-token ....

Es können die Defaultwerte übernommen werden.   

Zum Testen der Userumgebung

    su --shell /bin/bash --login gitlab-runner
    
Zum Debuggen des Runners

    sudo gitlab-runner stop
    sudo gitlab-runner --debug run

**Wichtig**: `bash_logout` Datei vom User `gitlab-runner` weglöschen oder `clear` Anweisungen entfernen.
    
### Docker

Am einfachsten ist es den `gitlab-runner` als Linux Service, wie in der Standard Anleitung von GitLab beschrieben, zu installieren.

Anschliessend ist der Runner zu Registrieren:

    sudo gitlab-runner register --url http://gitlab-28-default.mshome.net/ --registration-token ....
    
Es können die Defaultwerte übernommen werden, ausser beim `executor`, dort ist `docker` anzugeben.  

Der `gitlab-runner` ruft dann bei jedem Build Job `docker` auf.

Nach der Installation ist die Konfigurationsdatei ggf. `/etc/gitlab-runner/config.toml` zu überprüfen. Diese sollte etwa wie folgt aussehen:
    
    concurrent = 2
    check_interval = 5
    
    [session_server]
      session_timeout = 1800
    
    [[runners]]
      name = "docker"
      url = "http://gitlab-28-default.mshome.net/"
      token = "bpNtz94yh36gVzsdoNjv"
      executor = "docker"
      copy_url = "http://172.17.0.1"
      [runners.custom_build_dir]
      [runners.cache]
        [runners.cache.s3]
        [runners.cache.gcs]
        [runners.cache.azure]
      [runners.docker]
        tls_verify = false
        image = "busybox:latest"
        privileged = false
        disable_entrypoint_overwrite = false
        oom_kill_disable = false
        disable_cache = false
        volumes = ["/cache"]
        shm_size = 0

Die wichtigsten Einträge:
* `concurrent` - wieviele Jobs gleichzeitig ausgeführt werden können
* `check_interval` - in welchem Intervall nach neuen Jobs gesucht werden soll. Wenn `0` wird der Defaultwert von 50 Sekunden verwendet.
* `copy_url` - von welchem Host `git clone` erfolgen soll. Der Wert `172.17.0.1` ist die Docker Host IP.
* `privileged` - wenn `true` kann innerhalb der Jobs `docker` aufgerufen werden, z.B. für `docker build`.

### Kubernetes

Erstellt eine Kubernetes Umgebung, hier basierend auf microk8s. 

Erweitert die ConfigMap vom CoreDNS Service in Kubernetes um den DNS Eintrag (`hosts`) vom Gitlab Server.

Das Ergebnis ist etwa so aus:

    {
        "Corefile": ".:53 {
                errors
                health {
                  lameduck 5s
                }
                hosts {
                  172.31.2.184 gitlab-28-default.mshome.net
                  fallthrough
                }
                ....

Installiert den `gitlab-runner` mittels `helm`.

    sudo microk8s enable helm3
    sudo microk8s helm3 repo add gitlab https://charts.gitlab.io
    kubectl create namespace gitlab
    sudo microk8s helm3 install -n gitlab gitlab-runner gitlab/gitlab-runner

    # laut Ausgabe Verfahren
    sudo microk8s helm3 upgrade -n gitlab gitlab-runner --set gitlabUrl=http://gitlab-28-default.mshome.net/,runnerRegistrationToken=GR1348941Foz7w54CN3PVfLkU4QBB gitlab/gitlab-runner

Aufräumen
    
    sudo microk8s helm3 delete -n gitlab gitlab-runner

### Links

* [Installation](https://about.gitlab.com/install/#ubuntu)
* [Runners](https://docs.gitlab.com/runner/install/)
* [Troubleshoot GitLab Runner](https://docs.gitlab.com/runner/faq/index.html#job-failed-system-failure-preparing-environment)
* [Get started with GitLab CI/CD](https://docs.gitlab.com/ee/ci/quick_start/)
* [Erweiterte Konfiguration](https://docs.gitlab.com/runner/configuration/advanced-configuration.html)
* [Is there a way to add arbitrary records to kube-dns?](https://stackoverflow.com/questions/37166822/is-there-a-way-to-add-arbitrary-records-to-kube-dns)

