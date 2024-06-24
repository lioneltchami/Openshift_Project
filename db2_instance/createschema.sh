#!/bin/bash

set -e

# Source DB2 profile
source /home/db2inst1/sqllib/db2profile

# Start DB2
db2start

# Create the database if it doesn't exist
if ! db2 list db directory | grep -q $DBNAME; then
    echo "Creating database $DBNAME..."
    db2 create database $DBNAME
else
    echo "Database $DBNAME already exists."
fi

# Connect to the database
echo "Connecting to database $DBNAME..."
db2 connect to $DBNAME

# Create a sample table if it doesn't exist
echo "Creating sample table..."
db2 "CREATE TABLE IF NOT EXISTS sample_table (id INT PRIMARY KEY, name VARCHAR(100))"

# Insert sample data if the table is empty
if [ $(db2 "SELECT COUNT(*) FROM sample_table" | tail -n 1) -eq 0 ]; then
    echo "Inserting sample data..."
    db2 "INSERT INTO sample_table (id, name) VALUES (1, 'Sample Data')"
else
    echo "Sample data already exists."
fi

# Disconnect from the database
db2 disconnect $DBNAME

echo "Database setup completed successfully."