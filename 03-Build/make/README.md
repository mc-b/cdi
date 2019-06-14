Make
====

**make** (englisch für machen, erstellen) ist ein Build-Management-Tool, das Kommandos in Abhängigkeit von Bedingungen ausführt. 

Das Erstellen einer Datei wird im Makefile als ein Ziel (Target) bezeichnet. Die Randbedingungen dazu werden in einem Eintrag beschrieben

     A: B C
       cmd_A

**Beispiel**:

    Test.txt:
            touch Test.txt
            
**Aufruf**:

Zum Testen steht einen `make` Container Image (misegr/make) zur Verfügung.

Dieser kann wie folgt gestartet werden:

    kubectl duk/compiler/make.yaml
    runbash make
    
Die Beispiele stehen im Verzeichnis `/src/03-Build` zur Verfügung.
    
    cd /src/03-Build/make
    make

                
