#!/bin/bash

# Start DB2 instance
su - db2inst1 -c db2start

# Run the createschema script
su - db2inst1 -c /var/custom/createschema.sh

# Keep the container running
tail -f /dev/null