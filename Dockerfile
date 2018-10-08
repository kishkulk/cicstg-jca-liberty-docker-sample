FROM websphere-liberty 

# Copy CICSTG 9.2 SDK 
ADD ./CICS_TG_SDK_92_Unix.tar.gz /

# Copy CICSTG 9.1 SDK
# If planning to use CICSTG 9.1 SDK then uncomment bellow line and comment the CICSTG 9.2 sdk copy line
# ADD ./CICS_TG_SDK_92_Unix.tar.gz /

# Copy server.xml to /config directory
COPY server.xml /config

# Copy Sample war file to /samples directory
ADD ./libertyJCA.war /samples/
