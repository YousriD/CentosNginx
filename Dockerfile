##################################################
# My Docker file.                                #
# Author : Yousri Dardouri                       #
# Date : 09-JUN-2021                             #
##################################################

# Provide the base image for Icon Builds
FROM centos:7

LABEL Description="New Docker Image"\ dockerfile_version="1.0.0"

##################################################
# STEP 1: Install the needed libraries for the OS.
# This build will be slower as clean-Up is done
# at the end so the image is smaller.
##################################################

FROM centos:7
RUN  yum -y update\
    && yum -y install epel-release\
    && yum -y install nginx\
    && yum clean all && \
        rm -rf /var/cache/yum
##################################################
# STEP 3: add html page from local folder
##################################################
ADD index.html /usr/share/nginx/html/index.html

##################################################
# STEP 3:  expose the browser port
##################################################

EXPOSE 80/tcp
CMD ["nginx", "-g daemon off;"]
