# docker-ubuntu-im
This is a base docker build file to build a docker image with IBM installation manager 1.8.6 installed ready to run a response file

# Preparation
The agent.installer.linux.gtk.x86_64_1.8.6.zip is a download of the Installation manager
1.8.6 from December 2016. You can download your own version from https://jazz.net/downloads.

https://jazz.net/downloads/ibm-installation-manager/releases/1.8.6/agent.installer.linux.gtk.x86_64_1.8.6000.20161118_1611.zip

Modify the Dockerfile to change the name and the name of the zip file.

# To build the image

> docker build -t ubuntuim .

Validate the image with
> docker images

Start the image with a bash shell.
> docker run -ti ubuntuim /bin/bash

root@b03cfa2f9792> cd /opt/IBM
root@b03cfa2f9792> ls -al

You should see wasadmin as a user owner of the IBM folder.

From this image you can now install other IBM product. As you will use Installation Manager
in silent mode, you need a response file. A Response file is a xml document used to keep 
the parameters used during the manual product installation. This file is needed to reproduce the
installation within the Docker image. 

# Installing DSI
Once you download the ODM disk from Passport Advantage you get the repository configuration
for Installation Manager in disk 4. You can change the location reference in
the installation manager response file. Then you can fine tune a second dockerfile
that is using the installation manager in silent mode
to build the new image run:
> docker build -t dsi89 -f DSIinstallDockerfile .

It may take time to build the image
Then you can use cf ic command to upload your image to your bluemix container registry.
