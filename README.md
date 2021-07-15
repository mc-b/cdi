# Beispiele zum Kurs: [DevOps Engineering Practices & Tools (CDI)](https://www.digicomp.ch/weiterbildung/development-trainings/software-engineering-trainings/software-engineering-basics/devops-in-der-software-entwicklung/kurs-devops-engineering-practices-tools)

Inhalt und Beispiele
--------------------

* [Einführung in DevOps](https://publications.opengroup.org/w162)
    * Begriffsklärung 
    * Auswirkungen auf die Organisation 
    * Neue Arbeitsweisen 
* [Infrastruktur](02-Infrastruktur/) 
    * Virtualisierung
    * Containerisierung
    * Orchestrierung
* [Build Systeme](03-Build/)
    * Einführung in Build Systeme am Beispiel von Maven
    * [Installation und Setup](https://books.sonatype.com/mvnex-book/reference/installation.html)
    * Praktische Beispiele für den Einsatz von Maven 
* [Source Code Management](04-SCM/) 
    * [Git](https://git-scm.com/book/de/v2) und [Github](https://guides.github.com/), das populärste Source Code Management Tool im agilen Umfeld
* [Continuous Integration mit Jenkins (Blue Ocean) Übersicht](05-CI/)
    * Konfiguration von Build Jobs 
* [Automatisierte Tests und Qualitätsüberprüfungen](06-Test/)
    * Unit und Integrations Tests
    * Prüfen der Testabdeckung
    * Prüfen der Codequalität
* [Continuous Delivery Pipeline mit Docker und Kubernetes](07-CD/)
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
    vagrant up
    
Nach der erfolgreichen Installation werden Informationen zum Installierten Kubernetes Cluster angezeigt.

    ====================================================================
    VM: master-01, Cluster-IP: 192.168.137.100
    dashboard - Aufruf Dashboard, Login mit
    token:      .....
    ====================================================================

Nach Eingabe von `source kubeenv` sind alle benötigten Umgebungsvariablen gesetzt und es kann, mittels den angezeigten Befehlen, auf den Kubernetes Cluster zugegriffen werden. 
