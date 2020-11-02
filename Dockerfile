FROM adoptopenjdk/openjdk11:jre

VOLUME ["/plugins", "/config"]
WORKDIR /server

ENV BUNGEE_HOME=/server
ENV BUNGEE_BUILD=1537
ENV BUNGEE_FILE=https://ci.md-5.net/job/BungeeCord/${BUNGEE_BUILD}/artifact/bootstrap/target/BungeeCord.jar
ENV MEMORY=512m

RUN curl -s -o ${BUNGEE_HOME}/BungeeCord.jar ${BUNGEE_FILE}

COPY *.sh /usr/bin/

EXPOSE 25565


CMD ["/usr/bin/run-bungeecord.sh"]
