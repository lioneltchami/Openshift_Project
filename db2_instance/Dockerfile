# Use the official IBM Db2 image as a base
FROM ibmcom/db2:11.5.5.0

# Set environment variables
ENV LICENSE=accept
ENV DB2INST1_PASSWORD=db2inst1
ENV DBNAME=testdb

# Create necessary directories and set permissions
RUN mkdir -p /database /var/custom /var/db2_setup && \
    chown -R db2inst1:db2iadm1 /database /var/custom /var/db2_setup

# Copy custom scripts into the container
COPY createschema.sh /var/custom/
RUN cp /var/custom/createschema.sh /var/db2_setup/createschema.sh && \
    chmod +x /var/db2_setup/createschema.sh

# Expose the Db2 port
EXPOSE 50000

# Set up a volume for persistent storage
VOLUME /database

# Start the Db2 server and keep the container running
CMD ["/bin/bash", "-c", "su - db2inst1 -c db2start && tail -f /dev/null"]
