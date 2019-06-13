Docker Testumgebung 
===================

    +---------------------------------------------------------------+
    ! Container-Engine: Docker                                      !	
    +---------------------------------------------------------------+
    ! Gast OS: Ubuntu 16.04                                         !	
    +---------------------------------------------------------------+
    ! Hypervisor: VirtualBox                                        !	
    +---------------------------------------------------------------+
    ! Host-OS: Windows, MacOS, Linux                                !	
    +---------------------------------------------------------------+
    ! Notebook - Schulnetz 10.x.x.x                                 !                 
    +---------------------------------------------------------------+

### Beschreibung
***

Einfache VM mit Docker installiert.

In der VM können folgende Beispiele ausprobiert werden:

* [apache - Apache Web Server](apache/)
* [apache4X - Scriptscript welches 4 Web Server Container erstellt](apache4X/)
* [dotnet - .NET Entwicklungsumgebung](dotnet/)
* [microservice - Micro Service mit Node.js](microservice/)

Es muss einmalig die VM mit Docker erstellt und in die VM gewechselt werden:

	vagrant up
	vagrant ssh

Die Beispiele befinden sich, in der VM, im Verzeichnis `/vagrant`. Die Anwahl ist wie folgt:

	cd /vagrant/<Beispiel>
	
Die VM kann wie folgt verlassen heruntergefahren und gelöscht werden:

	exit
	vagrant halt
	vagrant destroy -f
	
