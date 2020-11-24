#!/usr/bin/env bash

docker run \
--name=mysql1 \
-p 3306:3306 \
-e MYSQL_ROOT_HOST=% \
-d \
mysql/mysql-server:5.5