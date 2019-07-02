Automatisierte Tests und Qualitätsüberprüfungen
-----------------------------------------------

### JUnit

JUnit ist ein Framework zum Testen von Java-Programmen, das besonders für automatisierte Unit-Tests einzelner Units (Klassen oder Methoden) geeignet ist. Anfänglich wurde JUnit von Erich Gamma und Kent Beck entwickelt. Es basiert auf Konzepten, die ursprünglich unter dem Namen SUnit für Smalltalk entwickelt wurden.

* [Maven und JUnit](https://www.mkyong.com/maven/how-to-run-unit-test-with-maven/)
* [Jenkins JUnit Plug-in](https://wiki.jenkins.io/display/JENKINS/JUnit+Plugin)

Erweiterung des `Jenkinsfile` um Aufbereitung der Testergebnisse:

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
            stage('Test') {
                steps {
                    sh 'mvn test'
                }
                post {
                    always {
                      junit 'target/surefire-reports/*.xml'
                    }
                }
            }
        }
    }

### Integrationtest

Der Begriff Integrationstest bezeichnet in der Softwareentwicklung eine aufeinander abgestimmte Reihe von Einzeltests, die dazu dienen, verschiedene voneinander abhängige Komponenten eines komplexen Systems im Zusammenspiel miteinander zu testen. Die erstmals im gemeinsamen Kontext zu testenden Komponenten haben im Idealfall jeweilige Modultests (Unittests) erfolgreich bestanden und sind für sich isoliert fehlerfrei funktionsfähig.
