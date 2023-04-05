# [Kafka Raft](https://developer.confluent.io/learn/kraft/)

KAFKA_VERSION 3.3.1
SCALA_VERSION 2.12 
#### start container
```shell
docker-compose up -d
```
```shell
❯ docker-compose ps        
NAME                COMMAND             SERVICE             STATUS              PORTS
kafka-console       "./console"         kafka-console       running (healthy)   0.0.0.0:8080->8080/tcp, :::8080->8080/tcp
kafka1              "start.sh"          kafka1              running (healthy)   0.0.0.0:9092->9092/tcp, :::9092->9092/tcp
kafka2              "start.sh"          kafka2              running (healthy)   0.0.0.0:9292->9092/tcp, :::9292->9092/tcp
kafka3              "start.sh"          kafka3              running (healthy)   0.0.0.0:9392->9092/tcp, :::9392->9092/tcp
```
#### list broker
```shell
docker exec -t kafka1 /kafka/bin/kafka-broker-api-versions.sh --bootstrap-server localhost:9092 | awk '/id/{print $1}'
```

#### create topic
```shell
docker exec -t kafka1 /kafka/bin/kafka-topics.sh \
--bootstrap-server localhost:9092 \
--create --topic test1 \
--replication-factor 3 --partitions 5
```

#### list topic
```shell
docker exec -t kafka1 /kafka/bin/kafka-topics.sh  --bootstrap-server localhost:9092 --list
```

#### Kafka Producer
```shell
docker exec -it kafka1 /kafka/bin/kafka-console-producer.sh --bootstrap-server localhost:9092 --topic test1
>test producer from kafka1
>Hello there
```

#### Consume message with console-consumer
```shell
docker exec -it kafka3 /kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test1
test producer from kafka1
Hello there
```

#### Kafka Console from [RedPanda](https://github.com/redpanda-data/console)
```shell
http://localhost:8080/topics
```