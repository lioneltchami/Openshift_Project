#!/bin/bash

# Start the DB2 instance
su - db2inst1 -c "db2start"

# Create the database
su - db2inst1 -c "db2 create database mydb"

# Connect to the database
su - db2inst1 -c "db2 connect to mydb"

# Run the SQL script to create the schema and tables
su - db2inst1 -c "db2 -tvf /var/custom/schema.sql"

# Stop the DB2 instance
su - db2inst1 -c "db2stop"
