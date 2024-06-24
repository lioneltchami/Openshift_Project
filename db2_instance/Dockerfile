# FROM ibmcom/db2:11.5.7.0

# ENV LICENSE=accept
# ENV DB2INST1_PASSWORD=your_secure_password
# ENV DBNAME=testdb
# ENV INSTANCE_SETUP=true
# ENV PERSISTENT_HOME=false

# # Create necessary directories
# RUN mkdir -p /database /var/custom

# # Copy custom scripts
# COPY createschema.sh /var/custom/
# COPY entrypoint.sh /
# RUN chmod +x /var/custom/createschema.sh /entrypoint.sh

# EXPOSE 50000

# ENTRYPOINT ["/entrypoint.sh"]

#####################

# # Use the official IBM Db2 image as a base
# FROM ibmcom/db2:11.5.5.0

# # Set environment variables
# ENV LICENSE=accept
# ENV DB2INST1_PASSWORD=db2inst1
# ENV DBNAME=testdb

# # Create a directory for custom scripts
# RUN mkdir /var/custom

# # Copy custom scripts into the container
# COPY createschema.sh /var/custom

# # Make the custom script executable
# RUN chmod a+x /var/custom/createschema.sh

# # Expose the Db2 port
# EXPOSE 50000

# # Start the Db2 server and run the custom script
# CMD ["/bin/bash", "-c", "db2start && su - db2inst1 -c '/var/custom/createschema.sh' && tail -f /dev/null"]

FROM ibmcom/db2:11.5.5.0

ENV LICENSE=accept
ENV DB2INST1_PASSWORD=db2inst1
ENV DBNAME=testdb

COPY createschema.sh /var/custom/
RUN chmod a+x /var/custom/createschema.sh

# Add the custom script to be run during container startup
RUN echo "/var/custom/createschema.sh" >> /var/custom/db2start.sh

EXPOSE 50000

# Use the default entrypoint and CMD from the base image