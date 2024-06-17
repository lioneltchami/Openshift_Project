# FROM python:3.9-slim as base
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1

# RUN apt-get update && apt-get install -y \
#     gcc \
#     libpq-dev \
#     build-essential \
#     curl \
#     libxml2 \
#     libxml2-dev \
#     && rm -rf /var/lib/apt/lists/*

# WORKDIR /app
# COPY . /app

# RUN pip install setuptools==57.5.0
# RUN pip install --no-cache-dir -r requirements.txt

# EXPOSE 5001
# ENV FLASK_APP=api.py
# CMD ["flask", "run", "--host=0.0.0.0", "--port=5001"]

FROM python:3.9-slim as base
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set environment variables
ENV DB2_CONN_STR="DATABASE=testdb;HOSTNAME=db2-container;PORT=50000;PROTOCOL=TCPIP;UID=db2inst1;PWD=db2inst1"
ENV API_SERVER_URL="http://api-server-url"

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

EXPOSE 5001
ENV FLASK_APP=api.py
CMD ["flask", "run", "--host=0.0.0.0", "--port=5001"]
