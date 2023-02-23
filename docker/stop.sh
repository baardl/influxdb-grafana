#!/usr/bin/env bash
echo stopping influxdb
docker stop influxdb
echo stopping grafana
docker stop grafana
echo list active docker containers
docker ps
