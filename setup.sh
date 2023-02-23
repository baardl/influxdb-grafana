#!/bin/bash
#
# 1. Setup InfluxDb
# 2. Create Grafana token
# 3. Stop Influx
# 4. Docker-compose with InfluDb and Grafana

docker network create monitoring
docker volume create grafana-volume
docker volume create influxdb-data-volume
docker volume create influxdb-config-volume

docker run -d -p 8086:8086 \
  --name influxdb \
  -e DOCKER_INFLUXDB_INIT_MODE=setup \
  -e DOCKER_INFLUXDB_INIT_USERNAME=root \
  -e DOCKER_INFLUXDB_INIT_PASSWORD=secret-password \
  -e DOCKER_INFLUXDB_INIT_ORG=my-init-org \
  -e DOCKER_INFLUXDB_INIT_BUCKET=my-init-bucket \
  -e DOCKER_INFLUXDB_INIT_ADMIN_TOKEN=secret-token \
  -v influxdb-data-volume:/var/lib/influxdb \
  -v influxdb-config-volume:/etc/influxdb \
  influxdb:2.6

  `influx auth create -t mytoken --host http://localhost:8086 --org myorg --json  --description grafana --all-access`


