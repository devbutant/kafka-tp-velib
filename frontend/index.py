import streamlit as st
import pandas as pd
from kafka import KafkaConsumer
import json
import time

st.set_page_config(layout='wide')  # DÃ©finir la disposition de la page sur 'wide'

def create_consumer():
  consumer = KafkaConsumer(
    'velib-stations',
    bootstrap_servers=['localhost:9092'],
    auto_offset_reset='latest',  
    enable_auto_commit=True,
    group_id='velib-monitor-stations',
    value_deserializer=lambda x: json.loads(x.decode('utf-8')),
    api_version=(0, 10, 1))  
  return consumer

st.title('Velib Stalking')

consumer = create_consumer()

placeholder = st.empty()

try:
  while True:  
    data = []
    for i in range(100): 
      message = next(consumer)
      data.append(message.value)
    df = pd.DataFrame(data)
    placeholder.dataframe(df)  
    time.sleep(3) 
finally:
  consumer.close() 