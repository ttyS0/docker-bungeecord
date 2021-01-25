FROM openjdk:11.0-jre-slim

RUN apt-get update && apt-get -y install curl && apt-get -y upgrade

VOLUME ["/plugins", "/config"]
WORKDIR /server

ENV BUNGEE_HOME=/server
ENV BUNGEE_BUILD=1544
ENV BUNGEE_FILE=https://ci.md-5.net/job/BungeeCord/${BUNGEE_BUILD}/artifact/bootstrap/target/BungeeCord.jar
ENV MEMORY=512m

RUN curl -s -o ${BUNGEE_HOME}/BungeeCord.jar ${BUNGEE_FILE}

RUN apt-get -y remove curl && apt-get -y autoremove && apt-get clean

COPY *.sh /usr/bin/

EXPOSE 25565


CMD ["/usr/bin/run-bungeecord.sh"]
