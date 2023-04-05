FROM openjdk:11.0.16-jre-buster

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y curl net-tools procps netcat && \
    apt-get clean all
         
ENV KAFKA_VERSION 3.3.1
ENV SCALA_VERSION 2.12 

RUN  mkdir /tmp/kafka && \
    curl "https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" \
    -o /tmp/kafka/kafka.tgz && \
    mkdir /kafka && cd /kafka && \
    tar -xvzf /tmp/kafka/kafka.tgz --strip 1

RUN mkdir -p /data/kafka
RUN rm -rf /tmp/kafka/kafka.tgz

# RUN groupadd kafka -g 1010; useradd -M -g 1010 -u 1010 kafka -s /bin/bash
# RUN chown kafka.kafka -R /data/
# USER kafka

COPY start.sh  /usr/bin

RUN chmod +x  /usr/bin/start.sh

CMD ["start.sh"]