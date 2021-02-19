# Docker dev stack
Docker containers for local development on multiple projects runinng on PHP and MySQL (MariaDB).

# installation
- install [Docker](https://www.docker.com/products/docker-desktop)
- make sure nothing is running on port 80 on your machine
- create network: `docker network create auto`
- clone this repository. Next commands are executed in clonned folder:
- optional: if you already have projects in some folder, copy .env.example file as .env and set PROJECTS_PATH
- build containers: `make build_docker`
- launch docker: `make up`
- check http://localhost in your browser (you should see *It works!*)
- continue with creating first project (see below)

# projects management
## create new project
- create project with this command (replace "*myproject*"): `make project NAME="myproject"`
- add line to your hosts file: `127.0.0.1 myproject.devstack`
- test in browser: http://myproject.devstack
- place your code in new folder projects/*myproject*

## create new database
You can use your favourite DB app (see below).\
TODO: create make command

## connect to database
### from project
use server: devstack-db:3306
### from host machine
You can connect to database in Docker with your favourite DB app.\
Use server address: *localhost* and port: *5306*\
root password is: *devstack*

## dump all databases (for backup?)
- run `make dump-db`
- you will find your backup in backup/ directory

# docker management
- launch docker in background: `make up`
- stop docker containers: `make down`
- build containers: `make build_docker`
- delete all containers: `make remove_docker`

# PHP versions

Currently supported PHP versions:

PHP version | DOCKER_CONTAINER_NAME
--- | ---
7.4.15 | devstack-php74
7.3.27 | devstack-php73

## how to change PHP version
- Go to vhost for your project and change this line with:
`ProxyPassMatch ^/(.*\.php(/.*)?)$ fcgi://DOCKER_CONTAINER_NAME:9000/var/www/php-test/$1`
Instead of *DOCKER_CONTAINER_NAME* use name from table above
- restart apache: `make apache_restart`