Continuous Integration mit Jenkins (Blue Ocean) Übersicht
---------------------------------------------------------

Kontinuierliche Integration (auch fortlaufende oder permanente Integration; englisch continuous integration) ist ein Begriff aus der Software-Entwicklung, der den Prozess des fortlaufenden Zusammenfügens von Komponenten zu einer Anwendung beschreibt. 

Jenkins ist ein erweiterbares, webbasiertes Software-System zur kontinuierlichen Integration von Komponenten zu einem Anwendungsprogramm. 

* Jenkins wie unter [DevOps](https://github.com/mc-b/duk/tree/master/devops#jenkins-mit-blueocean) beschrieben installieren
* Neues Repository anlegen mit README.md, Jenkinsfile (leer) und Makefile mit folgendem Inhalt

    target/artefakt.jar:
        mkdir -p target
        touch target/artefakt.jar

Nachfolgende Beispiele durchspielen:
* [Getting started with Pipeline ](https://jenkins.io/doc/book/pipeline/getting-started/)
* [Using a Jenkinsfile](https://jenkins.io/doc/book/pipeline/jenkinsfile/)

Erweitert die Beispiele aus Kapitel [03-Build](../03-Build/maven) um einen `Jenkinsfile`.

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
                }
            }
        }
    }