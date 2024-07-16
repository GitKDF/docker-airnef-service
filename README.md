# docker-airnef

This fork will run airnef continuously.  Setup to run on a synology nas so that at any time files can be downloaded to the NAS by initiating a transfer from the camera.  Tested with a Sony a5000.

The entry[entrypoint runs a bash script that will filter out the messages from the console window (and thus the container manager log) that airnef is waiting X seconds to try again.  It will also restart the process once it ends unless it has an abnormal exit code.  This keeps the NAS from sending emails that the container stopped unexpectedly each time you initiate a transfer.

Example:
```
docker run -d \
        --name vvintan0 \
        --restart always \
        -e IPADDRESS="<ip to cam>" \
        -e TZ=America/Moncton \
        --name vvintan0 \
        -v /mnt/photos/Syncs/Camera:/output \
        -v /etc/airnef:/opt/airnef/appdata \
        jvaldron/docker-airnef
```
