FROM ibmcom/db2:11.5.7.0

ENV LICENSE=accept
ENV DB2INST1_PASSWORD=your_secure_password
ENV DBNAME=testdb

# Create necessary directories
RUN mkdir -p /database /var/custom

# Copy custom scripts
COPY createschema.sh /var/custom/
COPY entrypoint.sh /
RUN chmod +x /var/custom/createschema.sh /entrypoint.sh

EXPOSE 50000

ENTRYPOINT ["/entrypoint.sh"]