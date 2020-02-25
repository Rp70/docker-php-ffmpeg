FROM rp70/php-fpm:5.4
LABEL Name="PHP-FPM Docker Image with FFMPEG" Version=0.1.0
LABEL Maintainer="https://github.com/Rp70"
LABEL GitHub="https://github.com/Rp70/docker-php-ffmpeg"

#COPY files/ /

RUN set -ex && \
    . /etc/os-release && \
    # Reference: "How to Install FFmpeg on Debian 8 or Debian 9" at https://www.vultr.com/docs/how-to-install-ffmpeg-on-debian-8-or-9
    # If OS is Debian 8 (Jessie), update sources.list
    # if [ "$ID" = 'debian' -a "$VERSION_ID" = '8' ]; then \
    #     echo '# deb-multimedia' >> /etc/apt/sources.list; \
    #     echo 'deb http://www.deb-multimedia.org jessie main non-free' >> /etc/apt/sources.list; \
    #     echo 'deb-src http://www.deb-multimedia.org jessie main non-free' >> /etc/apt/sources.list; \
    #     echo '' >> /etc/apt/sources.list; \
    #     apt-get update -y | true; \
    #     apt-install -y --force-yes deb-multimedia-keyring; \
    #     gpg --recv-keys AA8E81B4331F7F50; \
    # fi; \
    # \
    # apt-get update -y && \
    # apt-install -y ffmpeg && \
    apt-get update -y && \
    apt-install -y xz-utils && \
    cd /tmp && \
    curl -v -f -L -O https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz && \
    curl -v -f -L -O https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz.md5 && \
    md5sum -c ffmpeg-release-amd64-static.tar.xz.md5; \
    if [ $? -gt 0 ]; then \
        exit 1; \
    fi; \
    \
    mkdir /tmp/ffmpeg && \
    tar -C /tmp/ffmpeg --strip-components=1 -xvf ffmpeg-release-amd64-static.tar.xz && \
    mv ffmpeg/ffmpeg /usr/bin/ && \
    chmod +x /usr/bin/ffmpeg && \
    mv ffmpeg/ffprobe /usr/bin/ && \
    chmod +x /usr/bin/ffprobe && \
    mv ffmpeg /usr/local/ffmpeg && \
    \
    ls -lah /usr/bin/ff* && \
    ffmpeg -version && \
    \
    apt-clean


#ENTRYPOINT ["/entrypoint.sh"]
#CMD ["startup"]
