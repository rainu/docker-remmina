FROM ubuntu:16.10
MAINTAINER rainu <rainu@raysha.de>
ENV DEBIAN_FRONTEND noninteractive

#install dbus and audio support
RUN apt-get update &&\
	apt-get -y install dbus-x11 remmina &&\
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
	
#make home directory for remmina user
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/remmina && \
    echo "remmina:x:${uid}:${gid}:remmina User,,,:/home/remmina:/bin/bash" >> /etc/passwd && \
    echo "remmina:x:${uid}:" >> /etc/group && \
    chown ${uid}:${gid} -R /home/remmina

USER remmina

CMD ["/usr/bin/remmina"]
