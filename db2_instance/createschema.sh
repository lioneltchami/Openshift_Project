#!/bin/bash

# Switch to the db2inst1 user and run the DB2 commands
su - db2inst1 -c "
  # Start the DB2 instance
  db2start

  # Create the database
  db2 create database testdb

  # Connect to the database
  db2 connect to testdb

  # Create a sample table
  db2 'CREATE TABLE sample_table (id INT PRIMARY KEY, name VARCHAR(100))'

  # Insert sample data
  db2 'INSERT INTO sample_table (id, name) VALUES (1, \"Sample Data\")'

  # Disconnect from the database
  db2 disconnect testdb
"
