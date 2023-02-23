#!/usr/bin/env bash
docker run --rm \
  --name influxdb \
  -e INFLUXDB_DB=telegraf \
  -e DOCKER_INFLUXDB_INIT_MODE=setup \
  -e DOCKER_INFLUXDB_INIT_USERNAME=admin \
  -e DOCKER_INFLUXDB_INIT_PASSWORD=supersecretpassword \
  -e DOCKER_INFLUXDB_INIT_ORG=realestateinsights \
  -e DOCKER_INFLUXDB_INIT_BUCKET=realestateinsights \
  -e DOCKER_INFLUXDB_INIT_ADMIN_TOKEN=atttitktitiitktitktittkittitfjjlljj \
  -v influxdb-volume:/var/lib/influxdb \
  influxdb /init-influxdb.sh

