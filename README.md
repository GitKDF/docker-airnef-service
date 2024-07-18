# docker-airnef

This fork will run airnef continuously.  Setup to run on a synology nas so that at any time files can be downloaded to the NAS by initiating a transfer from the camera.  Tested with a Sony a5000.

The OTHERARGUMENTS environment variable can be used to pass any other arguments you want to set to airnefcmd; if you don't want to pass any arguments, enter "none" (no quotes).  See the airnef documentation at https://www.testcams.com/airnef/ on Archive.org (the original site is defunct).

Examples:

On a Synology NAS, simply add the image as a container, map a volume from your desired output folder to \output and your docker settings folder to \appdata, set any options in the ENV variables, and ensure that the network it uses can see devices on your local network.

```
docker run -d \
        --name vvintan0 \
        --restart always \
        -e IPADDRESS=auto
        -e REALTIMEDOWNLOAD=disabled
        -e EXTLIST=JPG
        -e CAMERASLEEPWHENDONE=yes
        -e RERTYDELAYSECS=2
        -e FILENAMESPEC=@capturefilename@
        -e DIRNAMESPEC=@capturedate_y@-@capturedate_m@-@capturedate_d@
        -e OTHERARGUMENTS=none
        -e TZ=America/Denver
        --name vvintan0 \
        -v /mnt/photos/Syncs/Camera:/output \
        -v /etc/airnef:/appdata \
        gitkdf/docker-airnef-service
```
