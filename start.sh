#!/bin/bash
# generate cluster id : cat /proc/sys/kernel/random/uuid | tr -d '-' | base64 | cut -b 1-22
/kafka/bin/kafka-storage.sh format --config /kafka/config/server.properties --cluster-id 'YjExOTYyYjMyMjAxNDA5NT' --ignore-formatted
/kafka/bin/kafka-server-start.sh /kafka/config/server.properties