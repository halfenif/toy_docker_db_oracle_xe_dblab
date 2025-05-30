podman stop toy_docker_db_oracle_xe
podman rm toy_docker_db_oracle_xe
podman image rm toy_docker_db_oracle_xe

#sudo rm -rf ./oradata

podman build --no-cache --tag toy_docker_db_oracle_xe .
# DOCKER_BUILDKIT=1 docker build --tag toy_docker_db_oracle_xe .

podman image ls

podman-compose up --detach
# podman-compose up

echo ------------------------------------------
echo 1. init SQL
echo podman exec -it toy_docker_db_oracle_xe sqlplus sys/manager@//localhost:1521/XE as sysdba @/docker-entrypoint-initdb.d/init.sql
echo podman exec -it toy_docker_db_oracle_xe /bin/bash
echo 2. run harlequin
echo /app/harlequin.sh
echo 3. Good luck!
echo ------------------------------------------

# podman inspect  -f '{{.State.Status}}' toy_docker_db_oracle_xe
# podman inspect  -f '{{.State.Running}}' toy_docker_db_oracle_xe