docker containter stop toy_docker_db_oracle_xe
docker containter rm toy_docker_db_oracle_xe
docker image rm toy_docker_db_oracle_xe

#sudo rm -rf ./data

DOCKER_BUILDKIT=1 docker build --tag toy_docker_db_oracle_xe .

docker image ls

#docker-compose up --detach
docker-compose up

# echo ------------------------------------------
# echo 1. into docker
# echo docker exec -it toy_docker_db_oracle_xe /bin/bash
# echo 2. run harlequin
# echo /app/harlequin.sh
# echo 3. Good luck!
# echo ------------------------------------------

