#!/bin/sh

if [ "$OTHERARGUMENTS" = "none" ]; then
  python airnefcmd.py --ipaddress $IPADDRESS --retrydelaysecs $RERTYDELAYSECS --realtimedownload $REALTIMEDOWNLOAD --extlist $EXTLIST --camerasleepwhendone $CAMERASLEEPWHENDONE --dirnamespec $DIRNAMESPEC --filenamespec $FILENAMESPEC outputdir /output
else
  python airnefcmd.py --ipaddress $IPADDRESS --retrydelaysecs $RERTYDELAYSECS --realtimedownload $REALTIMEDOWNLOAD --extlist $EXTLIST --camerasleepwhendone $CAMERASLEEPWHENDONE --dirnamespec $DIRNAMESPEC --filenamespec $FILENAMESPEC $OTHERARGUMENTS outputdir /output
fi
