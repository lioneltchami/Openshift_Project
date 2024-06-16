FROM python:3.9-slim

# Install build dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app/

# Install setuptools first to ensure compatibility with ibm_db
RUN pip install setuptools==57.5.0

# Install the rest of the dependencies
RUN pip install -r requirements.txt

CMD ["python", "api.py"]
