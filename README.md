# Procédure de lancement du projet

### 1. Clôner ce projet

```bash
git clone https://github.com/devbutime/kafka-tp-velib.git ./my-app
```

### 2. Obtenir une clé d'API

Créer un compte sur https://developer.jcdecaux.com/#/signup.

Une fois que vous aurez créé votre compte, vous disposerez d'une clé d'API affichée dans votre compte utilisateur.
Pas de clé ? Utilisez celle-ci pour tester l'app : `276cc6afca8905b9ad02fc3fd2a0d824667d4e04`
Renseigner la clé dans le fichier `setup.sh`

```bash
API_KEY = "XXX" # Pas de clé api ? Utilisez celle ci pour un test : 276cc6afca8905b9ad02fc3fd2a0d824667d4e04

```

## [Linux] Lancer l'application depuis un script bash

```bash
cd ./my-app
chmod +x setup.sh
./setup.sh
```

L'application est disponible à l'adresse suivante : `http://localhost:8501/`

## Setup manuel

### 1. Clôner ce projet

```bash
git clone https://github.com/devbutime/kafka-tp-velib.git ./my-app
```

### 2. Lancer le docker-compose en mode détaché

```bash
cd my-app/tp-kafka/docker-compose/kafka-kafdrop
```

```bash
docker compose build
```

```bash
docker compose up -d
```

### 3. Rendre le container `kafka-kafdrop-kafka-1` interactif

```bash
docker exec -it kafka-kafdrop-kafka-1 /bin/bash
```

### 4. [Conteneur] Installer Python et kafka-python

```bash
apk add --no-cache python3 py3-pip; pip3 install kafka-python
```

### 5. [Conteneur] Lancer les deux script dans deux terminaux différents

Lancer `velib-get-stations.py` dans un terminal

```bash
python3 opt/kafka/bin/resources/velib-get-stations.py
```

L'application est disponible à l'adresse suivante : http://localhost:8501/ avec les données en temps réel
