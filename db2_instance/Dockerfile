# Use the official IBM Db2 image as a base
FROM ibmcom/db2:11.5.5.0

# Set environment variables
ENV LICENSE=accept
ENV DB2INST1_PASSWORD=db2inst1
ENV DBNAME=testdb
ENV PATH=$PATH:/home/db2inst1/sqllib/bin

# Create necessary directories
RUN mkdir -p /database /var/custom

# Copy custom scripts
COPY createschema.sh /var/custom/
RUN chmod +x /var/custom/createschema.sh

# Set up entrypoint
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

EXPOSE 50000

ENTRYPOINT ["/entrypoint.sh"]
