FROM python:3.9-slim

# Config
ARG version=1.1
VOLUME ["/output", "/appdata"]
ENV IPADDRESS=auto
ENV REALTIMEDOWNLOAD=disabled
ENV EXTLIST=JPG
ENV CAMERASLEEPWHENDONE=yes
ENV RERTYDELAYSECS=2
ENV FILENAMESPEC=@capturefilename@
ENV DIRNAMESPEC=@capturedate_y@-@capturedate_m@-@capturedate_d@
ENV OTHERARGUMENTS=none
ENV TZ=America/Denver

# "Build"
COPY . .
# Set executable permissions for the script
RUN chmod +x /entrypoint.sh

# Run
ENTRYPOINT ["/entrypoint.sh"]
