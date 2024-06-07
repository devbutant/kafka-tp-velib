## Procédure de lancement du projet

### 1. Clôner ce projet

```bash
git clone https://github.com/devbutime/kafka-tp-velib.git ./my-app
```

### 2. Obtenir une clé d'API

Créer un compte sur https://developer.jcdecaux.com/#/signup.

Une fois que vous aurez créé votre compte, vous disposerez d'une clé d'API affichée dans votre compte utilisateur.

Si votre clé d'API est "XXX", vous pouvez la renseigner dans le fichier `my-app/tp-kafka/resources/velib-get-stations.py`

### 3. Lancer le docker-compose en mode détaché

```bash
cd my-app/tp-kafka/docker-compose/kafka-kafdrop
```

```bash
docker compose build
```

```bash
docker compose up -d
```

### Rendre le container `obsidiandynamics/kafka` interactif

```bash
docker exec -it kafka-kafdrop-kafka-1 /bin/bash
```

### [Conteneur] Installer Python et kafka-python

```bash
apk add --no-cache python3 py3-pip; pip3 install kafka-python
```

### [Conteneur] Lancer les deux script dans deux terminaux différents

Lancer `velib-get-stations.py` dans un terminal

```bash
python3 opt/kafka/bin/resources/velib-get-stations.py
```

L'application est disponible à l'adresse suivante : http://localhost:8501/ avec les données en temps réel
