# influxdb-grafana
Setup of grafana and Influx

## Getting started
0. Create required credentials 
   ``` 
   cp template.env .env
   ```
   Update credentials, organization and bucket
1. Start setup of grafana and influxdb
   ```
    cp docker-compose-setup.yml docker-compose.yml
    docker-compose up -d
   ```
2. Verify InfluxDb login on http://localhost:8086 
3. Verify Grafana login on http://localhost:3000, save the new admin password for later.
4. Create token for Grafana to access InfluxDb 
  ```
   source .env &&\
   docker exec -it \
     -e ADMIN_TOKEN=$INFLUXDB_ADMIN_TOKEN \
     -e INFLUXDB_ORG=$INFLUXDB_ORG \
     influxdb influx auth create -t $INFLUXDB_ADMIN_TOKEN --host http://localhost:8086 --org $INFLUXDB_ORG --json  --description grafana --all-access
   ```
   Copy the token from the Json response, and save for later.
5. Switch grafana and influxdb to production mode
   ```
   ./docker/stop.sh
   cp docker-compose-runtime.yml docker-compose.yml
   ```
6. Start grafana and influxdb
   ```
   ./docker/start.sh
   ```
7. Add Grafana datasource at http://localhost:3000/datasources/
   - Select InfluxDb
   - Url: http://influxdb:8086
   - Header: Authorization: Token <token from step 4>
   - Database: telegraf
   - Push "Save and Test"
   

## Background material

### Influx 2.x
https://jet.dev/blog/secure-influxdb-setup-with-docker/I
https://docs.influxdata.com/influxdb/v2.6/tools/influx-cli/?t=Linux - install influx cli 2.x

### Influx 1.x
Based on https://towardsdatascience.com/get-system-metrics-for-5-min-with-docker-telegraf-influxdb-and-grafana-97cfd957f0ac

 