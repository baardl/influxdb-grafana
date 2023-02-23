#!/usr/bin/env bash
echo stopping influxdb
docker stop influxdb
echo removing influxdb
docker rm influxdb
echo stopping grafana
docker stop grafana
echo removing grafana
docker rm grafana
echo list active docker containers
docker ps
