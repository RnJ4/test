FROM alpine:latest
LABEL maintainer="unk"

WORKDIR /root
COPY local.sh /root/local.sh
COPY config.json /root/config.json
COPY dlc.dat /root/geosite.dat
COPY geoip.dat /root/geoip.dat
COPY linux_386 /root/linux_386
COPY linux_amd64 /root/linux_amd64
COPY linux_arm64 /root/linux_arm64
RUN set -ex \
	&& apk add --no-cache tzdata ca-certificates \
	&& chmod +x /root/local.sh \
	&& /root/local.sh \
	&& rm -fv /root/local.sh
VOLUME /etc/lol
ENV TZ=Asia/Shanghai
CMD [ "/root/lol", "-config", "/root/config.json" ]