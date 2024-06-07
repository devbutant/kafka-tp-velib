## Procédure de lancement du projet

### Lancer le container en mode détaché

```bash
cd docker-compose/kafka-kafdrop
```

```bash
docker compose up -d
```

### Créer un dossier pour notre projet dans `/opt/kafka/bin`

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

### Installer Streamlit

```bash
pip3 install streamlit
```

### Lancer l'app (frontend)

```bash
cd frontend
streamlit run index.py
```

### Si erreur "six unknown"

```bash
pip3 uninstall kafka-python six
```
