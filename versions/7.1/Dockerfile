FROM rp70/php-fpm:7.1
LABEL Name="PHP-FPM Docker Image with FFMPEG" Version=0.1.0
LABEL Maintainer="https://github.com/Rp70"
LABEL GitHub="https://github.com/Rp70/docker-php-ffmpeg"

#COPY files/ /

RUN . /etc/os-release && \
    # Reference: "How to Install FFmpeg on Debian 8 or Debian 9" at https://www.vultr.com/docs/how-to-install-ffmpeg-on-debian-8-or-9
    # If OS is Debian 8 (Jessie), update sources.list
    if [ "$ID" = 'debian' -a "$VERSION_ID" = '8' ]; then \
        echo '# deb-multimedia' >> /etc/apt/sources.list; \
        echo 'deb http://www.deb-multimedia.org jessie main non-free' >> /etc/apt/sources.list; \
        echo 'deb-src http://www.deb-multimedia.org jessie main non-free' >> /etc/apt/sources.list; \
        echo '' >> /etc/apt/sources.list; \
        apt-get update -y | true; \
        apt-install -y --force-yes deb-multimedia-keyring; \
    fi; \
    \
    apt-get update -y && \
    apt-install -y ffmpeg && \
    \
    ls -lah /usr/bin/ff* && \
    ffmpeg -version


#ENTRYPOINT ["/entrypoint.sh"]
#CMD ["startup"]
