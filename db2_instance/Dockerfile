# Use the official IBM Db2 image as a base
FROM ibmcom/db2:11.5.5.0

# Set environment variables
ENV LICENSE=accept
ENV DB2INST1_PASSWORD=db2inst1
ENV DBNAME=testdb

# Create a directory for custom scripts
RUN mkdir /var/custom

# Copy custom scripts into the container
COPY createschema.sh /var/custom

# Make the custom script executable
RUN chmod a+x /var/custom/createschema.sh

# Run the custom script after Db2 setup
RUN /var/custom/createschema.sh

# Expose the Db2 port
EXPOSE 50000

# Start the Db2 server
CMD ["/bin/bash", "-c", "db2start && tail -f /dev/null"]
