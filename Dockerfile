FROM alpine:latest

# Environment variables
ENV MC_VERSION="latest" \
    PAPER_BUILD="latest" \
    EULA="false" \
    MC_RAM="" \
    JAVA_OPTS=""

COPY papermc.sh .

RUN apk update \
    && apk add openjdk17-jre-headless \
    && apk add bash \
    && apk add wget \
    && apk add jq \
    && mkdir /data

# Container setup
EXPOSE 25565/tcp
EXPOSE 25565/udp

VOLUME [ "/data" ]

# Start script
CMD ["bash", "./papermc.sh"]