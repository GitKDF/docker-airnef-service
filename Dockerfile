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
ENV DIRNAMESPEC=@capturedate@
ENV OTHERARGUMENTS=none
ENV TZ=America/Denver

# "Build"
COPY . .

# Run
ENTRYPOINT ["/entrypoint.sh"]
