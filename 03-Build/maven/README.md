Maven
=====

Maven, ein jiddisches Wort bedeutet Speicher des Wissens , begann als ein Versuch , die Build -Prozesse in der Jakarta Turbine Projekt zu vereinfachen.
 
Es gab mehrere Projekte mit jeweils eigenen Build-Dateien, die sich alle geringfügig voneinander unterschieden. Java-Libraries wurden in die Versionsverwaltung eingecheckt!?!

Wir wollten eine Standardmethode zum Erstellen der Projekte, eine klare Definition dessen, woraus das Projekt bestand, eine einfache Methode zum Veröffentlichen von Projektinformationen und eine Methode zum Teilen von Java-Libraries für mehrere Projekte.

Das Ergebnis ist ein Tool, mit dem Sie jetzt jedes Java-basierte Projekt erstellen und verwalten können. 

Eine Maven Umgebung ist in der Eclipse Theia IDE auf [http://localhost:32400](http://localhost:32400) integriert. 

Die `Shell` und `Maven Befehle` sind in einem Terminal Fenster, in der IDE, auszuführen.

    
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

    cd /home/project/src
    mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false
   
Wechsel in erstelltes Verzeichnis, Ausgabe der erstellen Dateien, Builden des Projektes und Aufruf des compilierten Programmes:

    cd my-app
    find .
    mvn package 
    java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App


Web Projekt
-----------
***

> [⇧ **Nach oben**](#beispiele)

Mittels einer Standard Template für ein Web Projekt erstellen wir ein Gerüst:

    cd /home/project/src
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

Das können wir Testen, in einem neuen Terminalfenster mittels:

    curl localhost:8080/myapp/myresource
     
Neu verwenden wir das `exec` Plugin. Um Informationen für dieses anzuzeigen, können wir `mvn help:describe -Dplugin=exec -Dfull` verwenden.

Die Abhängigkeiten können mittels `mvn dependency:tree` angezeigt werden.

Eine noch detailiertere Ausgabe bekommen wir mittels `mvn install -X`.


    
