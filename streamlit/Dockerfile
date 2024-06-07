FROM python:3.9

WORKDIR /app

COPY . .

RUN pip install streamlit \
    && echo "Ok, ça run"

CMD ["streamlit", "run", "app.py"]