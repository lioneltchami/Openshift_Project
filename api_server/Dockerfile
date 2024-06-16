FROM python:3.9-slim as base
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY . /app
RUN pip install setuptools==57.5.0
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 5001
ENV FLASK_APP=api.py
CMD ["flask", "run", "--host=0.0.0.0", "--port=5001"]
