## Setup ———————————————————————————————————————————————————————————————————————
DOCKER_COMPOSE = docker-compose -f docker-compose.yml --env-file .env
DOCKER_EXEC = docker exec devstack-apache
DOCKER_DB_EXEC = docker exec devstack-db
NOW = $(shell date +"%Y%m%d-%H%M")

## —— Docker 🐳 ————————————————————————————————————————————————————————————————
build_docker: docker-compose.yml ## (re)build the docker containers
	[ ! -f .env ] && cp .env.example .env || continue
	$(DOCKER_COMPOSE) build

remove_docker: docker-compose.yml ## delete all containers, networks and volumes
	$(DOCKER_COMPOSE) down -v

up: docker-compose.yml ## start the docker containers
	$(DOCKER_COMPOSE) up -d

down: docker-compose.yml ## stop the docker containers
	$(DOCKER_COMPOSE) down

## Projects ————————————————————————————————————————————————————————————————————
project:
	mkdir projects/${NAME}
	echo "<h1>${NAME} devstack project</h1>" > projects/${NAME}/index.html
	cp apache/vhosts/new.conf.template apache/vhosts/${NAME}.conf
	sed -i -e "s#PROJECT#${NAME}#g" apache/vhosts/${NAME}.conf
	-rm apache/vhosts/${NAME}.conf-e ## macOS sed is doing weird things and create -e file
	${DOCKER_EXEC} apachectl -k restart

apache_restart:
	${DOCKER_EXEC} apachectl -k restart

backup_dir: ## prepare backup directory
	mkdir -p ./backup

dump-db: backup_dir ## dump all databases into file
	$(DOCKER_DB_EXEC) mysqldump -u root -p"devstack" --all-databases > 'backup/$(NOW)-all-databases.sql'


