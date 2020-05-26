# set base image to ubuntu
FROM ubuntu:14.04

# file author / maintainer
MAINTAINER Fenglin Chen <g3chen@oicr.on.ca>

# setup packages
USER root
RUN apt-get -m update && apt-get install -y wget unzip openjdk-7-jre zip

# get the bamstats tool and install it
RUN wget -q http://downloads.sourceforge.net/project/bamstats/BAMStats-1.25.zip
RUN unzip BAMStats-1.25.zip && \
    rm BAMStats-1.25.zip && \
    mv BAMStats-1.25 /opt/
COPY bin/bamstats /usr/local/bin/
RUN chmod a+x /usr/local/bin/bamstats

# give permission and switch to the ubuntu user
RUN groupadd -r -g 1000 ubuntu && useradd -r -g ubuntu -u 1000 ubuntu
USER ubuntu

# execute bash (even though it will be by default)
CMD ["/bin/bash"]
