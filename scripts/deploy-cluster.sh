#!/bin/bash

set -eo pipefail

source ./scripts/utils.sh

echo "Checking env variables"
# envs=("ELK" "MEJAI_API_DB" "MEJAI_ADMIN_API_DB" "HORIZON_API_ORACLE_USERNAME" "HORIZON_API_ORACLE_PASSWORD" "HORIZON_API_ORACLE_HOSTNAME" "HORIZON_API_ORACLE_CONNECTION_STRING")
# for env in ${envs[*]};
# do
#   if [[ -z "${!env}" ]]; then
#     echo "${env} env variable is not defined"
#     exit 1
#   fi
# done

echo "--- Removing old app"

echo "Removing services"
services=("mysurrey-app")

for service in ${services[*]};
do
  if docker service inspect $service &> /dev/null; then
    docker service rm $service &> /dev/null
    echo "Removed service $service"
  fi
done

echo "Removing networks"
remove_network "mysurrey-app-network"

docker stack deploy \
  --compose-file docker-compose.yml \
  mysurrey-app --with-registry-auth

# echo "--- Creating new app"
# echo "Сreating networks"
# docker network create --driver=overlay mysurrey-app-network
#
# echo "Creating services"
# docker service create --name mysurrey-app \
#   --with-registry-auth \
#   --network mysurrey-app-network \
#   --replicas 3 \
#   --container-label ca.surrey.swarm.cluster="mysurrey-app" \
#   --publish 80:80 \
#   cityofsurrey/mysurrey-app

# docker service create --name mejai-admin-api \
#   --with-registry-auth \
#   --network mysurrey-app-network \
#   --replicas 3 \
#   --env VIRTUAL_HOST=admin.libraries.surrey.ca \
#   --env DB=$MEJAI_ADMIN_API_DB \
#   --container-label ca.surrey.swarm.cluster="mejai" \
#   --publish 9000:8080 \
#   cityofsurrey/mejai-admin-api
#
# docker service create --name horizon-api \
#   --with-registry-auth \
#   --network mysurrey-app-network \
#   --replicas 3 \
#   --env UV_THREADPOOL_SIZE=8 \
#   --env ORACLE_USERNAME=$HORIZON_API_ORACLE_USERNAME \
#   --env ORACLE_PASSWORD=$HORIZON_API_ORACLE_PASSWORD \
#   --env ORACLE_HOSTNAME=$HORIZON_API_ORACLE_HOSTNAME \
#   --env ORACLE_CONNECTION_STRING=$HORIZON_API_ORACLE_CONNECTION_STRING \
#   --container-label ca.surrey.swarm.cluster="mejai" \
#   cityofsurrey/horizon-api
#
# docker service create --name redis \
#   --network mysurrey-app-network \
#   --replicas 1 \
#   --container-label ca.surrey.swarm.cluster="mejai" \
#   redis:3.0-alpine
#
# docker service create --name mejai-api \
#   --with-registry-auth \
#   --network mysurrey-app-network \
#   --replicas 3 \
#   --container-label ca.surrey.swarm.cluster="mysurrey-app" \
#   cityofsurrey/mysurrey-app

# TODO: enable when issue is fixed: https://github.com/gliderlabs/logspout/issues/273
# docker service create --name logspout \
#   --network mysurrey-app-network \
#   --mode global \
#   --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
#   --env SYSLOG_HOSTNAME='{{index .Config.Labels "com.docker.swarm.service.name"}}' \
#   --env SYSLOG_TAG='{{.Name}}' \
#   --env SYSLOG_STRUCTURED_DATA='cluster={{index .Config.Labels "ca.surrey.swarm.cluster"}}' \
#   gliderlabs/logspout $ELK
