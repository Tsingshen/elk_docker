#!/bin/bash
docker run -d --network hosts \
-v /root/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml \
-v /root/elk/data:/tmp/elk/data \
-v /root/elk/logs:/tmp/elk/logs \
docker.elastic.co/elasticsearch/elasticsearch:6.7.0
