#!/bin/bash

set -e

# Clear out the database 
DockerContainerId="$(docker run -d -it phooper0001/mysql-client)"

docker exec -i $DockerContainerId bash <<EOF
mysql -hrancher-data.fastervl.com -P3306 -uroot -prootroot <<MYSQL
    DROP DATABASE IF EXISTS cattle;  
    CREATE DATABASE IF NOT EXISTS cattle COLLATE = 'utf8_general_ci' CHARACTER SET = 'utf8';
    GRANT ALL ON cattle.* TO 'cattle'@'%' IDENTIFIED BY 'cattle';
    GRANT ALL ON cattle.* TO 'cattle'@'localhost' IDENTIFIED BY 'cattle';
MYSQL
EOF

docker rm -f $DockerContainerId
~                                                                                                                                                            

docker run -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock -e CATTLE_DB_CATTLE_MYSQL_HOST=rancher-data.fastervl.com -e CATTLE_DB_CATTLE_MYSQL_NAME=cattle -e CATTLE_DB_CATTLE_MYSQL_PORT=3306 -e CATTLE_DB_CATTLE_USERNAME=cattle -e CATTLE_DB_CATTLE_PASSWORD=cattle rancher/server:latest
