#FROM python:3.8-slim-buster
#RUN apt-get update && apt-get install -y \
#    gcc \
#    libpq-dev \
#    build-essential \
#    curl \
#    && rm -rf /var/lib/apt/lists/*
#WORKDIR /app
#COPY . /app
#RUN pip install setuptools==57.5.0
#RUN pip install --no-cache-dir -r requirements.txt
#EXPOSE 5000
#ENV FLASK_APP=app.py
#CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]


FROM python:3.9-slim as base
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set environment variables
ENV DB2_URI="DATABASE=testdb;HOSTNAME=172.18.0.2;PORT=50000;PROTOCOL=TCPIP;UID=db2inst1;PWD=db2inst1"

# Install dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    build-essential \
    curl \
    libxml2 \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

# Install Python packages
RUN pip install setuptools==57.5.0
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000
ENV FLASK_APP=app.py
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
