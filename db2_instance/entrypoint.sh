#!/bin/bash

# Wait for the DB2 instance to be created
while [ ! -f /home/db2inst1/sqllib/db2profile ]; do
    echo "Waiting for DB2 instance to be created..."
    sleep 5
done

# Source DB2 profile
source /home/db2inst1/sqllib/db2profile

# Start DB2
su - db2inst1 -c db2start

# Run the createschema script
/var/custom/createschema.sh

# Keep the container running
tail -f /dev/null