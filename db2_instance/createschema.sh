# createschema.sh
#!/bin/bash

su - db2inst1 -c "db2start"
su - db2inst1 -c "db2 create database mydb"
su - db2inst1 -c "db2 connect to mydb"
su - db2inst1 -c "db2 -tvf /var/custom/schema.sql"
su - db2inst1 -c "db2stop"
