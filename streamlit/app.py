import streamlit as st

st.write("hello world!")

# from socketIO_client_nexus import SocketIO

# st.title("Données en temps réel depuis Node.js")

# # Connexion au serveur Node.js via Socket.IO
# socketIO = SocketIO("localhost", 3000)

# # Fonction pour afficher les données reçues
# def on_station_update(data):
#     st.write(f"Nouvelle mise à jour de station : {data}")

# # Écoute des événements "station_update"
# socketIO.on("station_update", on_station_update)

# st.write("En attente de mises à jour...")
