# influxdb-grafana
Setup of grafana and Influx

## Influx 2.x
https://jet.dev/blog/secure-influxdb-setup-with-docker/I

## Influx 1.x
Based on https://towardsdatascience.com/get-system-metrics-for-5-min-with-docker-telegraf-influxdb-and-grafana-97cfd957f0ac

```
server1$ docker run --rm \
  -e INFLUXDB_DB=telegraf -e INFLUXDB_ADMIN_ENABLED=true \
  -e INFLUXDB_ADMIN_USER=admin \
  -e INFLUXDB_ADMIN_PASSWORD=supersecretpassword \
  -e INFLUXDB_USER=telegraf -e INFLUXDB_USER_PASSWORD=secretpassword \
  -v influxdb-volume:/var/lib/influxdb \
  influxdb /init-influxdb.sh
```

Compose
```
docker-compose up -d
```

Verify influxdb 
http://<publicip>:8086/
Login using admin, and using influxdb usek
