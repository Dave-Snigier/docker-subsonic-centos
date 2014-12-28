# docker-subsonic-centos
# subsonic on centos including transcoding support

FROM docker-ffmpeg-centos
MAINTAINER Dave Snigier <dsnigier@gmail.com>

# installation
RUN yum install -y java-1.7.0-openjdk-headless

ADD http://sourceforge.net/projects/subsonic/files/subsonic/5.0/subsonic-5.0.rpm/download /root/subsonic-5.0.rpm

RUN yum install --nogpgcheck /root/subsonic-5.0.rpm
RUN rm /root/subsonic-5.0.rpm


# run in the foreground
RUN sed -i "s/ > \${LOG} 2>&1 &//" /usr/share/subsonic/subsonic.sh

# enable ssl
# RUN sed -i "s/SUBSONIC_HTTPS_PORT=0/SUBSONIC_HTTPS_PORT=4443/" /usr/share/subsonic/subsonic.sh

COPY startup.sh /startup.sh

# Let's run it
EXPOSE 4040

CMD [ "/start.sh" ]
