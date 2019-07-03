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

* siehe auch YouTube: [Recording Test Results and Archiving Artifacts](https://www.youtube.com/watch?v=c9E8kGuAwLU)

### Integrationtest

Der Begriff Integrationstest bezeichnet in der Softwareentwicklung eine aufeinander abgestimmte Reihe von Einzeltests, die dazu dienen, verschiedene voneinander abhängige Komponenten eines komplexen Systems im Zusammenspiel miteinander zu testen. Die erstmals im gemeinsamen Kontext zu testenden Komponenten haben im Idealfall jeweilige Modultests (Unittests) erfolgreich bestanden und sind für sich isoliert fehlerfrei funktionsfähig.

### Prüfung der Testabdeckung

[Cobertura](https://cobertura.github.io/cobertura/) ist ein Tool zum Prüfen der Testabdeckung.

Für die Integration muss zuerst das `pom.xml` in der `build` Sektion erweitert werden:

    <plugin>
        <groupId>org.codehaus.mojo</groupId>
        <artifactId>cobertura-maven-plugin</artifactId>
        <version>2.5.1</version>
        <configuration>
            <formats>
                <format>xml</format>
            </formats>
        </configuration>
        <executions>
            <execution>
                <phase>package</phase>
                <goals>
                    <goal>cobertura</goal>
                </goals>
            </execution>
        </executions>
    </plugin>
    
Dann den `Jenkinsfile` erweitern

        stage('Test Analysis') {
            steps {
                sh 'mvn cobertura:cobertura'
            }
            post {
                always {
                  cobertura coberturaReportFile: 'target/site/cobertura/coverage.xml'
                }
            }
        }

Das Plug-in [Cobertura](https://wiki.jenkins.io/display/JENKINS/Cobertura+Plugin) `Jenkins verwalten` -> `Plugin verwalten` -> `verfügbar` in Jenkins hinzufügen.

Den Job neu bauen.

### Prüfung der Codequalität

[Checkstyle](https://wiki.jenkins.io/display/JENKINS/Checkstyle+Plugin) ist ein Tool zum Prüfen der Codequalität.

Für die Integration muss zuerst das `pom.xml` in der `build` Sektion erweitert werden:

        <plugin>
          <groupId>org.apache.maven.plugins</groupId>
          <artifactId>maven-checkstyle-plugin</artifactId>
          <version>3.1.0</version>
        </plugin>
    
Dann den `Jenkinsfile` erweitern

        stage('Code Analyse') {
            steps {
                sh 'mvn checkstyle:checkstyle'
            }
            post {
                always {
                  checkstyle pattern: 'target/checkstyle-result.xml'
                }
            }
        }

Das Plug-in [Checkstyle](https://wiki.jenkins.io/display/JENKINS/Checkstyle+Plugin) `Jenkins verwalten` -> `Plugin verwalten` -> `verfügbar` in Jenkins hinzufügen.

Den Job neu bauen.


    