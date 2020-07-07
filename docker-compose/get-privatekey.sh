echo "vm.max_map_count=262144" >> /etc/sysctl.conf

sysctl -p

sysctl -w vm.max_map_count=262144

mkdir -p /data/efk/elasticsearch/es0{1,2,3}/{data,logs}

chmod -R 777 /data/efk/elasticsearch/

# 证书生成
docker run -td --name es elasticsearch:7.6.2
docker exec -it es /bin/bash
# generate elastic-stack-ca.p12
./bin/elasticsearch-certutil ca
# generate elastic-certificates.p12
./bin/elasticsearch-certutil cert --ca elastic-stack-ca.p12

docker cp es:/usr/share/elasticsearch/elastic-certificates.p12 .

docker rm -f es

# get default secret of elasticsearch for kibana 

docker exec -it es01 /bin/bash
./bin/elasticsearch-setup-passwords -h
./bin/elasticsearch-setup-passwords interactive

# if forget your user elastic password

docker exec -it es01 /bin/bash

./bin/elasticsearch-users useradd scq -r superuser


curl -XPUT -u scq:1234 http://localhost:9200/_xpack/security/user/elastic/_password -H "Count-Type: application/json" -d '{"password": "abcdefg"}'
