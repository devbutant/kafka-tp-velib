FROM python:3.9

WORKDIR /app

COPY . .

RUN pip install streamlit python-socketio

CMD ["streamlit", "run", "app.py"]