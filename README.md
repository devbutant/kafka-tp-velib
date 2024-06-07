## I. Setup

### Lancer le container en mode détaché

```bash
docker compose up -d
```

```bash
cd docker-compose/kafka-kafdrop
```

### Créer un dossier pour notre projet

```bash
cd /opt/kafka/bin
mkdir projet-velib
```

### Installer la commande linux `nano` pour éditer nos fichiers

```bash
apk add nano
```

### Créer le script `velib-get-stations.py` dans notre dossier `projet-velib`

```bash
cd projet-velib
touch velib-get-stations.py
nano velib-get-stations.py
```

Y insérer le contenu présent dans le fichier `resources/velib-get-stations.py`

### Créer le script `velib-monitor-stations.py` dans notre dossier `projet-velib`

```bash
cd projet-velib
touch velib-monitor-stations.py
nano velib-monitor-stations.py
```

Y insérer le contenu présent dans le fichier `resources/velib-get-stations.py`

### Installer Python

```bash
apk add --no-cache python3 py3-pip
```

### Lancer les deux script dans un terminal différent

Lancer `velib-get-stations.py` dans un terminal

```bash
python3 ./velib-get-stations.py
```

Lancer `velib-monitor-stations.py` dans un autre terminal

```bash
python3 ./velib-monitor-stations.py
```

//
Daans le docker

pip3 install streamlit

créer un dossier frontend
fichier index.py
