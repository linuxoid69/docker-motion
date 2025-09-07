FROM debian:bullseye-20221114

ENV TZ=Europe/Moscow

ARG VERSION

RUN apt update \
    && apt upgrade -y \
    && apt install -y \
    curl \
    libavcodec58 \
    libavdevice58 \
    libavformat58 \
    libavutil56 \
    libjpeg62-turbo \
    libmariadb3 \
    libmicrohttpd12 \
    libpq5 \
    libsqlite3-0 \
    libswscale5 \
    libwebp6 \
    libwebpmux3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

RUN curl https://github.com/Motion-Project/motion/releases/download/release-${VERSION}/bullseye_motion_${VERSION}-1_amd64.deb -O
RUN dpkg -i bullseye_motion_${VERSION}-1_amd64.deb
RUN rm -rf ./*.deb

EXPOSE 8080 8081

CMD [ "/usr/bin/motion", "-c", "/etc/motion/motion.conf" ]
