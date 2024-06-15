FROM ibmcom/db2

# Create a directory for custom scripts
RUN mkdir /var/custom

# Copy the schema creation script into the container
COPY createschema.sh /var/custom

# Make the script executable
RUN chmod a+x /var/custom/createschema.sh

# Run the schema creation script
CMD ["/var/custom/createschema.sh"]
