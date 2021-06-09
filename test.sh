#!/bin/bash

#First, write down HTML output page with time stamp.
printf "<header>\n <h1> %(%T)T\n </h1>\n</header>"  > index.html


#Build Centos 7 with nginx .
#--pull: pull image before running.
#--rm: Always remove container when it exists.

docker build --pull --rm -f "Dockerfile" -t centosnginx:latest "."

# Run the image and expose port 80, detached.

docker run -it -d -p $PORT:80 centosnginx:latest





