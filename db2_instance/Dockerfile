FROM ibmcom/db2:11.5.7.0

ENV LICENSE=accept
ENV DB2INST1_PASSWORD=your_secure_password
ENV DBNAME=testdb
ENV PATH=$PATH:/opt/ibm/db2/V11.5/bin

# Create necessary directories
RUN mkdir -p /database /var/custom

# Copy custom scripts
COPY createschema.sh /var/custom/
RUN chmod +x /var/custom/createschema.sh

# Set up entrypoint
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

EXPOSE 50000

# Run the DB2 instance creation script
RUN /opt/ibm/db2/V11.5/instance/db2icrt -u db2inst1

ENTRYPOINT ["/entrypoint.sh"]