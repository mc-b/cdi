Kubernetes Testumgebung 
=======================

    +---------------------------------------------------------------+
    ! Orchestrierierung: Kubernetes                                 !   
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

Minimale Kubernetes Umgebung mit 4 Instanzen des Apache Web Servers.

Es muss einmalig die VM mit Kubernetes erstellt und in die VM gewechselt werden:

    vagrant up
    vagrant ssh    
    
In der VM kann dann mit `kubectl` weitere Container gestartet werden.