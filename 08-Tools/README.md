GitLab 
------

Lokale GitLab Installation zu Testzwecken.
* http://${fqdn} - GitLab Admin Oberfläche. Einloggen mit `root`, dass Password steht in der Datei `/etc/gitlab/initial_root_password`.

Runners
-------

Werden für die Pipeline Jobs benötigt. Keine Runners, keine Pipelines in Gitlab!

### Shell

Erlaubt das Ausführen von Shellscripts auf der lokalen VM, wo auch GitLab installiert ist.

Wie in `Admin` -> `Runners` beschrieben installieren.

Dann Runner anwählen und `Run untagged jobs` aktivieren und evtl. Tags entfernen.

### Kubernetes

Auf einer mit microk8s Installieren Umgebung:

    sudo microk8s enable helm3
    sudo microk8s helm3 repo add gitlab https://charts.gitlab.io
    kubectl create namespace gitlab
    sudo microk8s helm3 install --namespace gitlab gitlab-runner gitlab/gitlab-runner

    # laut Ausgabe Verfahren
    sudo microk8s helm3 upgrade gitlab-runner --set gitlabUrl=http://gitlab-28-default,runnerRegistrationToken=gyhyqKcr67SYp6ywR7q3 gitlab/gitlab-runner -n gitlab
    
    sudo microk8s helm3 delete -n gitlab gitlab-runner
    
Funktioniert nur, wenn die GitLab Instance via DNS gefunden werden kann.    
    
### Docker

    sudo apt-get update
    sudo apt-get install docker.io
 
    sudo -i
    docker run -d --name gitlab-runner --restart always -v /etc/gitlab-runner:/etc/gitlab-runner -v /var/run/docker.sock:/var/run/docker.sock gitlab/gitlab-runner:latest
    
    # Registrieren
    docker run --rm -it -v /srv/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner register
    
    cat <<%EOF% >/etc/gitlab-runner/config.toml
    concurrent = 1
    check_interval = 0
    
    [session_server]
      session_timeout = 1800
    
    [[runners]]
      name = "docker"
      url = "http://gitlab-28-default.maas/"
      token = "gyhyqKcr67SYp6ywR7q3"
      executor = "docker"
      clone_url = "http://10.0.46.148"
      [runners.docker]
        tls_verify = false
        image = ""
        privileged = false
        disable_entrypoint_overwrite = false
        oom_kill_disable = false
        disable_cache = false
        shm_size = 0
    
    [[runners]]
      name = "shell"
      url = "http://gitlab-28-default.maas/"
      token = "gyhyqKcr67SYp6ywR7q3"
      executor = "shell"
      clone_url = "http://10.0.46.148"
      [runners.custom_build_dir]
      [runners.cache]
        [runners.cache.s3]
        [runners.cache.gcs]
        [runners.cache.azure]
    %EOF%
    
    docker restart gitlab-runner    
         
Funktioniert nur, wenn die GitLab Instance via HTTPS abgesichert ist.

### Links

* [Installation](https://docs.gitlab.com/runner/install/)
* [Konfiguration](https://docs.gitlab.com/runner/configuration/advanced-configuration.html)

### Links

* [Installation](https://about.gitlab.com/install/#ubuntu)