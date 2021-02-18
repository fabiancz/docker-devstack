# Docker dev stack
Docker containers for local development on multiple projects runinng on PHP and MySQL (MariaDB).

# installation
- create network: `docker network create auto`
- build containers: `make build_docker`
- launch docker: `make up`

# docker management
- launch docker in background: `make up`
- stop docker containers: `make down`
- build containers: `make build_docker`
- delete all containers: `make remove_docker`

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
