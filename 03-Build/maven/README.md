Maven
=====

Maven, ein jiddisches Wort bedeutet Speicher des Wissens , begann als ein Versuch , die Build -Prozesse in der Jakarta Turbine Projekt zu vereinfachen.
 
Es gab mehrere Projekte mit jeweils eigenen Build-Dateien, die sich alle geringfügig voneinander unterschieden. Java-Libraries wurden in die Versionsverwaltung eingecheckt!?!

Wir wollten eine Standardmethode zum Erstellen der Projekte, eine klare Definition dessen, woraus das Projekt bestand, eine einfache Methode zum Veröffentlichen von Projektinformationen und eine Methode zum Teilen von Java-Libraries für mehrere Projekte.

Das Ergebnis ist ein Tool, mit dem Sie jetzt jedes Java-basierte Projekt erstellen und verwalten können. 

Eine Maven Umgebung steht als Container Image (misegr/maven) zu Verfügung.

**Aufruf**:

    kubectl apply -f duk/compiler/maven.yaml
    runbash maven
    cd /src
    
### Beispiele

* [Maven in 5 Minutes](#maven-in-5-minutes)
* [Simple Weather-Projekt](#simple-weather-projekt)
* [Web Projekt](#web-projekt)   
* [Weitere Beispiele](https://books.sonatype.com/mvnex-book/reference/index.html)
    
Maven in 5 Minutes
------------------
***

> [⇧ **Nach oben**](#beispiele)

Die nachfolgenden Beispiele basieren auf dem Tutorial [Maven in 5 Minutes](https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html) und sind auf die wichtigsten Befehle beschränkt.

Erstellen des Projektes `my-app` in diesem Verzeichnis:

    cd /src/03-Build/maven
    mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false
   
Wechsel in erstelltes Verzeichnis, Ausgabe der erstellen Dateien, Builden des Projektes und Aufruf des compilierten Programmes:

    cd my-app
    find .
    mvn package 
    java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App


Simple Weather-Projekt
----------------------
***

> [⇧ **Nach oben**](#beispiele)

Das Simple Weather-Projekt ist ein ausgedachtes Beispiel, das erstellt wurde, um einige der Funktionen von Maven zu demonstrieren. Es basiert auf dem [Simple Weather-Projekt](https://books.sonatype.com/mvnex-book/reference/customizing-sect-simple-weather.html) aus dem Buch "Maven Examples".

Es ist eine Anwendung, die repräsentativ für die Art ist, die Sie möglicherweise erstellen müssen. 

Die Simple Weather-Anwendung ist eine befehlszeilengesteuerte Anwendung, die eine Postleitzahl verwendet und einige Daten aus dem RSS-Feed von Yahoo Weather abruft. Anschließend wird das Ergebnis analysiert und an die Standardausgabe ausgegeben.

Erstellen des Projektes:

    cd /src/03-Build/maven
    mvn archetype:generate -DgroupId=org.sonatype.mavenbook.custom \
          -DartifactId=simple-weather \
          -Dversion=1.0 -DinteractiveMode=false
  
Wechsel in erstelltes Verzeichnis

    cd simple-weather/
    
Editieren der `pom.xml` und folgende neue Abhängigkeiten, vor `junit`, einfügen:

        <dependency>
            <groupId>log4j</groupId>
            <artifactId>log4j</artifactId>
            <version>1.2.14</version>
        </dependency>
        <dependency>
            <groupId>dom4j</groupId>
            <artifactId>dom4j</artifactId>
            <version>1.6.1</version>
        </dependency>
        <dependency>
            <groupId>jaxen</groupId>
            <artifactId>jaxen</artifactId>
            <version>1.1.1</version>
        </dependency>
        <dependency>
            <groupId>velocity</groupId>
            <artifactId>velocity</artifactId>
            <version>1.5</version>
        </dependency>
        
Erstellen des Projektes und Ausführen mit den Koordinaten von Zürich:

    mvn install
    mvn exec:java -Dexec.mainClass=org.sonatype.mavenbook.weather.Main -Dexec.args="784794"
    
Neu verwenden wir das `exec` Plugin. Um Informationen für dieses anzuzeigen, können wir `mvn help:describe -Dplugin=exec -Dfull` verwenden.

Die Abhängigkeiten können mittels `mvn dependency:tree` angezeigt werden.

Eine noch detailiertere Ausgabe bekommen wir mittels `mvn install -X`.

Web Projekt
-----------
***

> [⇧ **Nach oben**](#beispiele)

Mittels einer Standard Template für ein Web Projekt erstellen wir ein Gerüst:

    cd /src/03-Build/maven
    mvn archetype:generate -DarchetypeArtifactId=jersey-quickstart-grizzly2 \
        -DarchetypeGroupId=org.glassfish.jersey.archetypes -DinteractiveMode=false \
        -DgroupId=ch.cdi -DartifactId=web-app -Dpackage=ch.cdi.webapp \
        -DarchetypeVersion=2.17
    cd web-app
    
Damit der Service erreichbar ist, müssen wir in der Datei `src/main/java/ch/cdi/webapp/Main.java` den Eintrag `localhost` auf `0.0.0.0` ändern.

    // Base URI the Grizzly HTTP server will listen on
    public static final String BASE_URI = "http://0.0.0.0:8080/myapp/";

Anschliessend können wir das Projekt compilieren und starten:    
    
    mvn compile
    mvn exec:java
  
Ausserhalb, d.h. im Browser sollte der Service nun mittels `http://<ip Cluster>:<Port Maven>/myapp/myresource` erreichbar sein.
 
Die IP das Kubernetes Cluster und der Maven Port können wie folgt abgefragt werden:

    kubectl cluster-info
    kubectl get services

    
