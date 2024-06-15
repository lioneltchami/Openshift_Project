#!/bin/bash

# Set environment variables
DB_NAME="mydatabase"
DB_USER="myuser"
DB_PASS="mypassword"
DB_HOST="localhost"
DB_PORT="5432"

# Wait for the database to be ready
until pg_isready -h $DB_HOST -p $DB_PORT; do
  echo "Waiting for database to be ready..."
  sleep 2
done

# Create the database
PGPASSWORD=$DB_PASS psql -h $DB_HOST -p $DB_PORT -U $DB_USER -c "CREATE DATABASE $DB_NAME;"

# Create the schema
PGPASSWORD=$DB_PASS psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -c "CREATE SCHEMA myschema;"

# Create tables and insert initial data
PGPASSWORD=$DB_PASS psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME <<EOF
CREATE TABLE myschema.mytable (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

INSERT INTO myschema.mytable (name) VALUES ('Initial Data');
EOF

echo "Database schema created and initialized successfully."
