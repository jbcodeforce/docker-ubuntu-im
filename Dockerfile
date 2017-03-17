# Get Centos image
FROM ubuntu
MAINTAINER Jerome Boyer boyerje@us.ibm.com

# get unzip
RUN apt-get update
RUN apt-get install -y unzip
RUN apt-get install -y curl

# copy installation manager zip
COPY agent.installer.linux.gtk.x86_64_1.8.6.zip tmp/instalmgr.zip 

# install intallation manager
RUN mkdir /opt/IBM
RUN cd tmp && unzip instalmgr.zip && ./installc -log /opt/IBM/im_install.log -acceptLicense && rm -rf * 

# Add wasadmin userid and group
RUN groupadd wasadmin 
RUN useradd -g wasadmin wasadmin
RUN cd /opt && chown -R wasadmin:wasadmin IBM 
