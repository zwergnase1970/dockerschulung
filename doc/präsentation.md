---
marp: true
theme: default
backgroundColor: #fff
size: 16:9
paginate: true
---

![bg blur:4px opacity](ship.jpg)

# Anwendungsvirtualisierung mit Docker

... von und mit Dr. Jörg Tuttas

---

<!--
header :  "Anwendungsvirtualisierung mit Docker"
 -->

![bg left:25% 80%](docker.png)

# Kurzvorstellung (wer / woher)

- Was ist meine Motivation an der Veranstaltung teilzunehmen?
- Dieses wird eine gute Veranstaltung wenn ....

---

![bg left:25% 80%](docker.png)

## Einführung in Docker (Tag 1)

- Unterschiede zwischen virtuellen Maschinen und Containern
- Installation von Docker
- Image vs. Container
- Grundlegende Befehle
- Erstellen eines eigenen Images

---


![bg right:25% 80%](docker.png)

## Einführung in Docker (Tag 2)

- Host mit dem Container verbinden
- Exponieren von Ports und Verbinden von Containern
- Umgebungsvariablen
- Volumes
- Docker und Netzwerke
- Die Container Registry
- Orchestrierung von Docker Containern

---

![bg left:25% 80%](docker.png)

## Einführung in Docker (Tag 3)

- Docker im Kontext von CI/CD
- Entwicklung und Präsentation einer eigenen Lernsituation
- Reflexion

---

![bg right:25% 80%](docker.png)

## Was ist Containervirtualisierung?

Wir schreiben das Jahr 2012, Sie arbeiten in einem Systemhaus und erhalten folgenden Auftrag!

> "Wir sind ein kleines mittelständiges Unternehmen im Bereich der Automobilzulieferung und wollen unseren Webauftritt mittels **Wordpress** realisieren. Ferner wollen wir unseren Kunden bzw. auch unseren Mitarbeitern Dateien über eine Cloudlösung zur Verfügung stellen. Wir haben uns hier für die Anwendung **Owncloud** entschieden. Wir beauftragen Sie damit uns dieses Anwendungen zur Verfügung zu stellen."

---

![bg left:25% 80%](docker.png)

## Installation von Docker

- Aktiviren Sie WSL2 auf ihrem Rechner. Dieses geschieht über die Kommandozeile (als Administrator) über:

```cmd
wsl --install
```

- Gehen Sie auf [https://docs.docker.com/desktop/install/windows-install/](https://docs.docker.com/desktop/install/windows-install/) und installieren Sie Docker auf ihren Rechner.

- (*) Erstellen Sie einen Account für sich auf dem Docker Hub ([https://hub.docker.com/](https://hub.docker.com/)) 

---

![bg right:25% 80%](docker.png)

## Images und Container

Docker ist ein Kommandozeilenanwendung (siehe Docker Cheat Sheet). Im weiteren Verlauf werden wir die wichtigsten Befehle kennen lernen.

### Laden des ersten Images und starten des ersten Containers

```docker
docker run hello-world
```

---

![bg right:25% 80%](docker.png)

## Images auflisten

Auflisten der aktuell vorhandenen Images.

```docker
docker images
```

---

![bg left:25% 80%](docker.png)

## Wordpress

In ähnlicher Weise kann nun *Wordpress* gestartet werden, der Parameter **-p 88:80** sorgt dafür, dass der Port 80 auf den Port 88 des Hosts umgeleitet wird.

```docker
docker run -p 88:80 wordpress
```

---

![bg right:25% 80%](docker.png)

## Wordpress als Deamon

Um nun Wordpress als Deamon (Hintergrundprozess) zu starten dient die **-d** Option.

```docker
docker run -d -p 88:80 wordpress
```

Über .....

```docker
docker ps
```

erhält man Auskunft über die laufenden Container.

---

![bg left:25% 80%](docker.png)

## Container starten, stoppen und löschen

Stoppen:

```docker
docker stop {id}
```

Starten:

```docker
docker start {id}
```

Löschen:

```docker
docker rm {id}
```

---

![bg right:25% 80%](docker.png)

## Container benennen

Mittels der Option **--name** können die Container benannt werden. Dann kann der Docker Container über Angabe des Namens, statt der ID gestartet, gestoppt und gelöscht werden.


```docker
docker run -p 88:80 -d --name wp wordpress
```

---

![bg left:25% 80%](docker.png)

## Ein eigenes Image bauen (1)

Im folgenden soll eine Webseite (im Verzeichnis **html**) durch einen eigenen Docker Container ausgeliefert werden.

```html

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Hello World</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>    
</head>
<body>
    <h1>Hallo Welt</h1>
</body>
</html>

```

---

![bg left:25% 80%](docker.png)

## Ein eigenes Image bauen (2)

Erzeugen Sie im Verzeichnis **html** eine Datei **Dockerfile** mit folgendem Inhalt.

```dockerfile

FROM nginx:latest
COPY index.html /usr/share/nginx/html/index.html

```

Und bauen Sie das Image via des Befehls:

```docker

docker build -t meinimage.

```

---

![bg left:25% 80%](docker.png)

## Ein eigenes Image bauen (3)

Anschließend kann aus dem Image ein Container erzeugt werden.

```docker

docker run -p 88:80 -d meinimage

```

Durch den Aufruf von *http://localhost:88* sollte der Webserver erreichbar sein.

---

![bg right:25% 80%](docker.png)

## Ein Image speichern / veröffentlichen (1)

Auf dem Docker Hub können eigene Images gespeichert / veröffentlicht werden. Dazu muss man sich zunächst auf dem Docker Hub anmelden:

```docker

docker login -u {Benutzername}

```

---

![bg right:25% 80%](docker.png)

## Ein Image speichern / veröffentlichen (2)

Das Image muss für den Docker Hub besonders benannt werden und zwar {Benutzername}/{Imagename}[:tag], wobei der "tag" optional ist. Anschließend kann das Image veröffentlicht werden:

```docker

docker push {Benutzername}/{Imagename}[:tag]

```

---

![bg left:25% 80%](docker.png)

## **Aufgabe:** </br> Ein php Image erstellen und veröffentlichen

Im Verzeichnis **src** befindet sich u.a. die untere Datei **index.php** erstellen Sie ein Docker Image und veröffentlichen Sie dieses auf dem Docker Hub.

```php

<?php
echo "Hallo Welt";
?>

```

