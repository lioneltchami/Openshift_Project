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

# Expose the Db2 port
EXPOSE 50000

# Start the Db2 server and run the custom script
CMD ["/bin/bash", "-c", "db2start && /var/custom/createschema.sh && tail -f /dev/null"]
