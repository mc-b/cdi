# Beispiele zum Kurs: [DevOps Engineering Practices &amp; Tools (CDI)](https://www.digicomp.ch/weiterbildung/development-trainings/software-engineering-trainings/software-engineering-basics/devops-in-der-software-entwicklung/kurs-devops-engineering-practices-tools)

Inhalt
------

* [Einführung in DevOps](https://publications.opengroup.org/w162)
    * Begriffsklärung 
    * Auswirkungen auf die Organisation 
    * Neue Arbeitsweisen 
* [Infrastruktur](02-Infrastruktur) 
    * Virtualisierung
    * Containerisierung
    * Orchestrierung
* Build Systeme
    * [Einführung in Build Systeme am Beispiel von Maven](https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html)
    * [Installation und Setup](https://books.sonatype.com/mvnex-book/reference/installation.html)
    * [Praktische Beispiele für den Einsatz von Maven](03-Build/maven/) 
* Source Code Management 
    * Git und Github, das populärste Source Code Management Tool im agilen Umfeld
* Continuous Integration mit Jenkins (Blue Ocean) Übersicht
    * Konfiguration von Build Jobs 
* Automatisierte Tests und Qualitätsüberprüfungen
    * Unit und Integrations Tests
    * Prüfen der Testabdeckung
    * Prüfen der Codequalität
* Continuous Delivery Pipeline mit Docker und Kubernetes
    * Deployment der Artefakte aus der Pipeline als Container
  
Lernziele
---------
    
* Verstehen der Grundlagen von DevOps in einem praktischen Umfeld
* Verstehen der Anforderungen und Auswirkungen einer Arbeit im DevOps Umfeld
* Bedienen, Konfigurieren der einzelnen Komponenten einer CI/CD Pipeline und Verstehen der jeweiligen Einsatzgebiete  

### Quick Start

Installiert [Git/Bash](https://git-scm.com/downloads), [Vagrant](https://www.vagrantup.com/) und [VirtualBox](https://www.virtualbox.org/).

Projekt [lernkube](https://github.com/mc-b/lernkube), auf der Git/Bash Kommandozeile (CLI), klonen, Konfigurationsdatei (.yaml) kopieren und Installation starten. 

    git clone https://github.com/mc-b/lernkube
    cd lernkube
    cp templates/CDI.yaml config.yaml
    vagrant plugin install vagrant-disksize
    vagrant up

Öffnet die Interaktive Lernumgebung mittels [http://localhost:32188](http://localhost:32188), wechselt in das Verzeichnis `work` und wählt ein Notebook (ipynp Dateien) an. 

**Weitere Installationsmöglichkeiten und Details** zur Installation siehe Projekt [lernkube](https://github.com/mc-b/lernkube).