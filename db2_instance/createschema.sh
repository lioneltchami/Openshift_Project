# #!/bin/bash

# # # Wait for DB2 instance to be fully initialized
# # while [ ! -f /home/db2inst1/sqllib/db2profile ]; do
# #     sleep 1
# # done

# # Source DB2 profile
# source /home/db2inst1/sqllib/db2profile

# # Start DB2 (if not already started)
# su - db2inst1 -c "db2start"

# # Wait for DB2 to be ready
# for i in {1..60}; do
#     if su - db2inst1 -c "db2 connect to sample > /dev/null 2>&1"; then
#         su - db2inst1 -c "db2 terminate"
#         echo "DB2 is ready."
#         break
#     fi
#     sleep 1
# done

# # Create the database if it doesn't exist
# if ! su - db2inst1 -c "db2 list db directory | grep -q $DBNAME"; then
#     echo "Creating database $DBNAME..."
#     su - db2inst1 -c "db2 create database $DBNAME"
# else
#     echo "Database $DBNAME already exists."
# fi

# # Connect to the database
# echo "Connecting to database $DBNAME..."
# su - db2inst1 -c "db2 connect to $DBNAME"

# # Create a schema if it doesn't exist
# echo "Creating schema..."
# su - db2inst1 -c "db2 CREATE SCHEMA IF NOT EXISTS myschema"

# # Create a sample table if it doesn't exist
# echo "Creating sample table..."
# su - db2inst1 -c "db2 CREATE TABLE IF NOT EXISTS myschema.sample_table (id INT PRIMARY KEY, name VARCHAR(100))"

# # Insert sample data if the table is empty
# if [ $(su - db2inst1 -c "db2 \"SELECT COUNT(*) FROM myschema.sample_table\"" | tail -n 1) -eq 0 ]; then
#     echo "Inserting sample data..."
#     su - db2inst1 -c "db2 \"INSERT INTO myschema.sample_table (id, name) VALUES (1, 'Sample Data')\""
# else
#     echo "Sample data already exists."
# fi

# # Disconnect from the database
# su - db2inst1 -c "db2 disconnect $DBNAME"

# echo "Database setup completed successfully."

# #!/bin/bash

# # Source DB2 profile
# source /home/db2inst1/sqllib/db2profile

# # Wait for DB2 to be ready
# for i in {1..60}; do
#     if su - db2inst1 -c "db2 connect to sample > /dev/null 2>&1"; then
#         su - db2inst1 -c "db2 terminate"
#         echo "DB2 is ready."
#         break
#     fi
#     sleep 1
# done

# # Create the database if it doesn't exist
# if ! su - db2inst1 -c "db2 list db directory | grep -q $DBNAME"; then
#     echo "Creating database $DBNAME..."
#     su - db2inst1 -c "db2 create database $DBNAME"
# else
#     echo "Database $DBNAME already exists."
# fi

# # Connect to the database
# echo "Connecting to database $DBNAME..."
# su - db2inst1 -c "db2 connect to $DBNAME"

# # Create a schema if it doesn't exist
# echo "Creating schema..."
# su - db2inst1 -c "db2 CREATE SCHEMA IF NOT EXISTS myschema"

# # Create a sample table if it doesn't exist
# echo "Creating sample table..."
# su - db2inst1 -c "db2 CREATE TABLE IF NOT EXISTS myschema.sample_table (id INT PRIMARY KEY, name VARCHAR(100))"

# # Insert sample data if the table is empty
# if [ $(su - db2inst1 -c "db2 \"SELECT COUNT(*) FROM myschema.sample_table\"" | tail -n 1) -eq 0 ]; then
#     echo "Inserting sample data..."
#     su - db2inst1 -c "db2 \"INSERT INTO myschema.sample_table (id, name) VALUES (1, 'Sample Data')\""
# else
#     echo "Sample data already exists."
# fi

# # Disconnect from the database
# su - db2inst1 -c "db2 disconnect $DBNAME"

# echo "Database setup completed successfully."


#!/bin/bash

# Start the DB2 instance
db2start

# Create the database
db2 create database testdb

# Connect to the database
db2 connect to testdb

# Create a sample table
db2 'CREATE TABLE sample_table (id INT PRIMARY KEY, name VARCHAR(100))'

# Insert sample data
db2 'INSERT INTO sample_table (id, name) VALUES (1, "Sample Data")'

# Disconnect from the database
db2 disconnect testdb
