# Use the IBM DB2 base image
FROM ibmcom/db2

# Create a directory for custom scripts
RUN mkdir /var/custom

# Copy the schema creation script and SQL file into the container
COPY createschema.sh /var/custom
COPY schema.sql /var/custom

# Make the script executable
RUN chmod a+x /var/custom/createschema.sh

# Run the schema creation script
CMD ["/var/custom/createschema.sh"]
