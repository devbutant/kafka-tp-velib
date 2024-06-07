## Procédure de lancement du projet

### Clôner ce projet

```bash
git clone https://github.com/devbutime/kafka-tp-velib.git ./chemin-dossier-hote
```

### Lancer le docker-compose en mode détaché

```bash
cd docker-compose/kafka-kafdrop
```

```bash
docker compose up -d
```

### Rendre le container `obsidiandynamics/kafka` interactif

Lister les container en cours d'éxécution

```bash
docker ps
```

Exemple de la liste de container que vous pourriez avoir :

```bash
824359ab74f5   obsidiandynamics/kafdrop   "/kafdrop.sh"            2 days ago   Up 5 seconds   0.0.0.0:9000->9000/tcp                           kafka-kafdrop-kafdrop-1

3f4df5dc83cf   obsidiandynamics/kafka     "/bin/sh -c /opt/kaf…"   2 days ago   Up 5 seconds   0.0.0.0:2181->2181/tcp, 0.0.0.0:9092->9092/tcp   kafka-kafdrop-kafka-1
```

Utiliser l'id correspondant au container (listé précédemment)

```bash
docker exec -it 3f4df5dc83cf /bin/bash
```

Un terminal est maintenant disponible, similaire à ceci :

```bash
bash-4.4#
```

### [Conteneur] Créer un dossier pour notre projet dans `/opt/kafka/bin`

```bash
cd /opt/kafka/bin
mkdir projet-velib
```

### [Conteneur] Installer la commande linux `nano` pour éditer nos fichiers

```bash
apk add nano
```

### Obtenir une clé d'API

Créer un compte sur https://developer.jcdecaux.com/#/signup.

Une fois que vous aurez créé votre compte, vous disposerez d'une clé d'API affichée dans votre compte utilisateur.

Si votre clé d'API est "XXX", vous pouvez la renseigner dans les fichier `velib-get-stations.py`

### [Conteneur] Créer le script `velib-get-stations.py` dans notre dossier `projet-velib`

```bash
cd projet-velib
touch velib-get-stations.py
nano velib-get-stations.py
```

Y insérer le contenu présent dans le fichier `resources/velib-get-stations.py` sans oublier de renseigner votre clé api

### [Conteneur] Créer le script `velib-monitor-stations.py` dans notre dossier `projet-velib`

```bash
cd projet-velib
touch velib-monitor-stations.py
nano velib-monitor-stations.py
```

Y insérer le contenu présent dans le fichier `resources/velib-get-stations.py`

### [Conteneur] Installer Python

```bash
apk add --no-cache python3 py3-pip
```

### [Conteneur] Lancer les deux script dans deux terminaux différents

Lancer `velib-get-stations.py` dans un terminal

```bash
python3 ./velib-get-stations.py
```

Lancer `velib-monitor-stations.py` dans un autre terminal

```bash
python3 ./velib-monitor-stations.py
```

### [Conteneur] Installer Streamlit

```bash
pip3 install streamlit
```

### Lancer l'app (frontend)

```bash
cd frontend
streamlit run index.py
```

### Si erreur `ModuleNotFoundError: No module named 'kafka.vendor.six.moves'`

Désinstaller et réinstaller `six` peut parfois résourdre la problématique

```bash
pip3 uninstall kafka-python six
pip3 install kafka-python six
```

L'application est disponible à l'adresse suivante : `http://localhost:8501/`
