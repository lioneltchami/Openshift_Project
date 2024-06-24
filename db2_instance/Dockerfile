# Use the official IBM Db2 image as a base
FROM ibmcom/db2:11.5.5.0

# Set environment variables
ENV LICENSE=accept
ENV DB2INST1_PASSWORD=db2inst1
ENV DBNAME=testdb

# Create necessary directories
RUN mkdir -p /database /var/custom /var/db2_setup

# Copy custom scripts into the container
COPY createschema.sh /var/custom/

# Make the custom script executable
RUN chmod +x /var/custom/createschema.sh

# Expose the Db2 port
EXPOSE 50000

# Set up a volume for persistent storage
VOLUME /database

# Start the Db2 server, set permissions, and run the custom script
CMD ["/bin/bash", "-c", "\
    su - db2inst1 -c db2start && \
    chown -R db2inst1:db2iadm1 /database /var/custom /var/db2_setup && \
    su - db2inst1 -c '/var/custom/createschema.sh' && \
    tail -f /dev/null"]
