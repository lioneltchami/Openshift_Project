#!/bin/bash

set -e

# Function to wait for DB2 to be ready
wait_for_db2() {
    echo "Waiting for DB2 to start..."
    for i in {1..60}; do
        if db2 connect to sample > /dev/null 2>&1; then
            db2 terminate
            echo "DB2 is ready."
            return 0
        fi
        sleep 1
    done
    echo "DB2 did not start within the expected time."
    return 1
}

# Main script execution
su - db2inst1 << EOF
    # Start the DB2 instance
    db2start

    # Wait for DB2 to be ready
    wait_for_db2

    # Update DB2 configuration
    db2 update dbm cfg using SVCENAME 50000
    db2 update dbm cfg using NUMDB 1
    db2set DB2COMM=tcpip

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
EOF
