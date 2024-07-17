FROM debian:stable

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
WORKDIR /opt
COPY airnef_v${version}_Linux_Binary.tar.gz /opt
COPY airnefcmdcontinuous.sh /opt/airnef
RUN apt update && apt install -y wget && rm -rf /var/lib/apt/lists/*
RUN tar -xf airnef_v${version}_Linux_Binary.tar.gz
RUN rm airnef_v${version}_Linux_Binary.tar.gz

# Run
ENTRYPOINT /opt/airnef/airnefcmdcontinuous.sh --ipaddress $IPADDRESS --realtimedownload $REALTIMEDOWNLOAD --extlist $EXTLIST --camerasleepwhendone $CAMERASLEEPWHENDONE --retrydelaysecs $RETRYDELAYSECS $OTHERARGUMENTS --outputdir /output
