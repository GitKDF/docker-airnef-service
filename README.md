This fork will run airnef continuously. Setup to run on a Synology NAS or other server so that, at any time, files can be downloaded to the NAS by initiating a transfer from the camera.  This is quite useful for a home hobby studio.  Tested with a Sony a5000.

The OTHERARGUMENTS environment variable can be used to pass any other arguments you want to set to airnefcmd; if you don't want to pass any arguments, enter "none" (no quotes). See the airnef documentation at https://www.testcams.com/airnef/ on Archive.org (the original site is defunct).

The entry point uses a script to determine whether or not to pass the OTHERARGUMENTS env variable to airnefcmd.  This image is built using the original python airnef sourcecode, modified slightly---to clean up the console output since that shows up as the log file in Docker, and to loop the main process rather than exiting after a transfer as the original command line utility did.

Examples:

In a Docker manager GUI, simply add the image as a container, map a volume from your desired output folder to \output and your docker settings folder to \appdata, set any options in the ENV variables, and ensure that the network it uses can see devices on your local network.

From the command line:
docker run -d \
        --name docker-airnef-service \
        --restart always \
        -e IPADDRESS=auto \
        -e REALTIMEDOWNLOAD=disabled \
        -e EXTLIST=JPG \
        -e CAMERASLEEPWHENDONE=yes \
        -e RERTYDELAYSECS=2 \
        -e FILENAMESPEC=@capturefilename@ \
        -e DIRNAMESPEC=@capturedate_y@-@capturedate_m@-@capturedate_d@ \
        -e OTHERARGUMENTS=none \
        -e TZ=America/Denver \
        -v /mnt/photos/Syncs/Camera:/output \
        -v /docker/airnef/appdata:/appdata \
        gitkdf/docker-airnef-service
