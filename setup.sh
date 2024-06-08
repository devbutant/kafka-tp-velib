#!/bin/bash

# Variables
DOCKER_COMPOSE_DIR="tp-kafka/docker-compose/kafka-kafdrop"
API_KEY=""
# Pas de clé api ? Utilisez celle ci pour effectuer un test : 276cc6afca8905b9ad02fc3fd2a0d824667d4e04
PYTHON_SCRIPT="tp-kafka/resources/velib-get-stations.py"

# Étape 2: Ajouter la clé d'API dans le script Python
echo "Ajout de la clé d'API dans le script Python..."

echo "$PYTHON_SCRIPT"
sed -i.bak "s#API_KEY = \"XXX\"#API_KEY = \"$API_KEY\"#" "tp-kafka/resources/velib-get-stations.py"

# Étape 3: Lancer docker-compose en mode détaché
echo "Lancement de docker-compose en mode détaché..."
cd $DOCKER_COMPOSE_DIR
docker compose build
docker compose up -d

# Étape 4: Rendre le conteneur interactif et installer Python et kafka-python
echo "Installation de Python et kafka-python dans le conteneur..."
CONTAINER_ID=$(docker ps -qf "name=kafka-kafdrop-kafka-1")
docker exec -it $CONTAINER_ID apk add --no-cache python3 py3-pip
docker exec -it $CONTAINER_ID pip3 install kafka-python

# Étape 5: Lancer les scripts Python dans des terminaux différents
echo "Attente de 5 secondes avant la récupération des données en temps réel..."
sleep 5
echo "Lancement des scripts Python..."
docker exec -it $CONTAINER_ID /bin/bash -c "cd /opt/kafka/bin/resources && python3 ./velib-get-stations.py"

echo "Installation et lancement terminés. L'application est disponible à l'adresse http://localhost:8501/"