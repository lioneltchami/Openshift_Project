#!/bin/bash

echo "Starting entrypoint script..."

# Wait for the DB2 instance to be created
counter=0
while [ ! -f /home/db2inst1/sqllib/db2profile ]; do
    echo "Waiting for DB2 instance to be created... (Attempt $counter)"
    if [ $counter -ge 60 ]; then
        echo "Timeout waiting for DB2 instance creation."
        exit 1
    fi
    counter=$((counter+1))
    sleep 5
done

echo "DB2 instance created. Proceeding with setup..."

# Source DB2 profile
source /home/db2inst1/sqllib/db2profile

# Start DB2
echo "Starting DB2..."
su - db2inst1 -c db2start

# Run the createschema script
echo "Running createschema script..."
/var/custom/createschema.sh

echo "Setup complete. Keeping container running..."
# Keep the container running
tail -f /dev/null