FROM websphere-liberty 

# Copy cicseci.rar to /opt/ibm/cicstg/deployable 
ADD ./cicseci.rar /opt/ibm/cicstg/deployable/

# Copy server.xml to /config directory
COPY server.xml /config

# Copy Sample war file to /samples directory
ADD ./libertyJCA.war /samples/
