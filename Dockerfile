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
ENTRYPOINT sh -c '
  if [ "$OTHERARGUMENTS" = "none" ]; then
    python airnefcmd.py --ipaddress $IPADDRESS --retrydelaysecs $RERTYDELAYSECS --realtimedownload $REALTIMEDOWNLOAD --extlist $EXTLIST --camerasleepwhendone $CAMERASLEEPWHENDONE --dirnamespec $DIRNAMESPEC --filenamespec $FILENAMESPEC outputdir /output
  else
    python airnefcmd.py --ipaddress $IPADDRESS --retrydelaysecs $RERTYDELAYSECS --realtimedownload $REALTIMEDOWNLOAD --extlist $EXTLIST --camerasleepwhendone $CAMERASLEEPWHENDONE --dirnamespec $DIRNAMESPEC --filenamespec $FILENAMESPEC $OTHERARGUMENTS outputdir /output
  fi
'
