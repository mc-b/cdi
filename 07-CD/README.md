Continuous Delivery Pipeline mit Docker und Kubernetes
------------------------------------------------------

### Dockerfile

Der effizienteste Weg, um einen bestimmten vordefinierten, funktional validierten und vor allem jederzeit reproduzierbaren (Base-)Image-Stand zu erschaffen, läuft über ein Buildfile, das sogenannte Dockerfile.

Erweitert die Beispiele aus Kapitel [03-Build](../03-Build/maven) um einen `Dockerfile`, z.B. für die `my-app`:

    FROM openjdk:8-jre
    COPY target/my-app-1.0-SNAPSHOT.jar /opt
    CMD [ "java", "-cp", "/opt/my-app-1.0-SNAPSHOT.jar", "com.mycompany.app.App" ]

### Image bauen

Baut das Container Images mittels `docker build` und startet des mittels `docker run`, z.B. für `my-app`:

    docker build -t my-app  .
    docker run my-app
    
### Container Registry

Um die Container Images vom Build- auf ein Produktivsystem zu bekommen, eignet sich am besten eine Container Registry.

Es stehen u.a. folgende zwei zur Verfügung:
* [Docker Registry](https://github.com/mc-b/duk/tree/master/registry#docker-registry)
* [Nexus3 Docker Registry](https://github.com/mc-b/duk/tree/master/registry#nexus3-docker-registry)

Für unsere Beispiele verwenden wird die [Nexus3 Docker Registry](https://github.com/mc-b/duk/tree/master/registry#nexus3-docker-registry).

Nachdem die [Nexus3 Docker Registry](https://github.com/mc-b/duk/tree/master/registry#nexus3-docker-registry), wie beschrieben, eingerichtet ist können wir unsere Container Images dort ablegen.

Die Reihenfolge ist dabei wie folgt: Einlogggen (einmalig), Container Image taggen (oder builden), Container Image pushen

    docker login -u admin -p admin123 localhost:32513
    docker tag my-app localhost:32513/my-app
    docker push localhost:32513/my-app
    
Zum Testen können wir alle lokalen Container Images weglöschen und das Image direkt von der Nexus Registry starten:

    docker rmi -f my-app
    docker rmi -f localhost:32513/my-app
    
    docker run localhost:32513/my-app   

### Jenkinsfile

Um die Container Images zu builden ist das `Jenkinsfile` zu erweitern:

    pipeline {
        agent {
            docker {
                image 'maven:3-alpine'
                args '-v /root/.m2:/root/.m2'
            }
        }
        stages {
            stage('Build') {
                steps {
                    sh 'mvn -B -DskipTests clean package'
                    archiveArtifacts 'target/*.jar'
                    stash includes: 'target/*.jar', name: 'jar'
                }
            ...
            stage('Build Images') {
                agent none
                steps {
                    unstash 'jar'
                    sh 'docker build -t my-app .'
                }
            }
        }
    }
        
Weitere Beispiele in den Projekten 
* [bpmn-tutorial](https://github.com/mc-b/bpmn-tutorial/blob/master/Jenkinsfile)
* [A.L.A. (Automated Linguistic Analysis) application](https://github.com/ideas-into-software/automated-linguistic-analysis), [der Blog dazu](https://jaxenter.com/osgi-applications-on-kubernetes-159310.html)

### Kubernetes

Um den Container in Kubernetes laufen zu lassen, benötigen wir noch die Definition im `YAML`-Format.

Die erhalten wir am einfachsten mittels `kubectl run`.

    kubectl run my-app --image=localhost:32513/my-app
    kubectl get deployment/my-app -o yaml

Falls eine Service Definition benötigt wird verwenden wir `kubectl expose`.

    kubectl expose deployment/my-app --type="LoadBalancer" --port 8080
    kubectl get service my-app -o yaml  
        