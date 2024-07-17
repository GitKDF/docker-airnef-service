FROM python:3.9-slim

# Config
ARG version=1.1
VOLUME ["/output", "/opt/airnef/appdata"]
ENV IPADDRESS=auto
ENV REALTIMEDOWNLOAD=disabled
ENV EXTLIST=JPG
ENV CAMERASLEEPWHENDONE=yes
ENV RERTYDELAYSECS=2
ENV OTHERARGUMENTS= 
ENV TZ=America/Denver

# "Build"
COPY . .

# Run
ENTRYPOINT python airnefcmd.py --ipaddress $IPADDRESS --realtimedownload $REALTIMEDOWNLOAD --extlist $EXTLIST --camerasleepwhendone $CAMERASLEEPWHENDONE --retrydelaysecs $RETRYDELAYSECS $OTHERARGUMENTS --outputdir /output
