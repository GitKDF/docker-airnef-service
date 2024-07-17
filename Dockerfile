FROM python:3.9-slim

# Config
ARG version=1.1
VOLUME ["/output", "/opt/airnef/appdata"]
ENV IPADDRESS=auto
ENV REALTIMEDOWNLOAD=disabled
ENV EXTLIST=JPG
ENV CAMERASLEEPWHENDONE=yes
ENV RERTYDELAYSECS=2
ENV FILENAMESPEC=@filename@
ENV DIRNAMESPEC=@capturedate@
ENV TZ=America/Denver

# "Build"
COPY . .

# Run
ENTRYPOINT python airnefcmd.py --ipaddress $IPADDRESS --filenamespec $FILENAMESPEC --dirnamespec $DIRNAMESPEC --realtimedownload $REALTIMEDOWNLOAD --extlist $EXTLIST --camerasleepwhendone $CAMERASLEEPWHENDONE --retrydelaysecs $RETRYDELAYSECS --outputdir /output
