info: intro

intro:
	@echo "██████╗ ██╗  ██╗██████╗     ██████╗ ███████╗██╗   ██╗    ██████╗  ██████╗ ██╗  ██╗";
	@echo "██╔══██╗██║  ██║██╔══██╗    ██╔══██╗██╔════╝██║   ██║    ██╔══██╗██╔═══██╗╚██╗██╔╝";
	@echo "██████╔╝███████║██████╔╝    ██║  ██║█████╗  ██║   ██║    ██████╔╝██║   ██║ ╚███╔╝ ";
	@echo "██╔═══╝ ██╔══██║██╔═══╝     ██║  ██║██╔══╝  ╚██╗ ██╔╝    ██╔══██╗██║   ██║ ██╔██╗ ";
	@echo "██║     ██║  ██║██║         ██████╔╝███████╗ ╚████╔╝     ██████╔╝╚██████╔╝██╔╝ ██╗";
	@echo "╚═╝     ╚═╝  ╚═╝╚═╝         ╚═════╝ ╚══════╝  ╚═══╝      ╚═════╝  ╚═════╝ ╚═╝  ╚═╝";
	@echo "";
	@echo "================================================================";
	@echo "|| Version 0.0.1                                              ||";
	@echo "================================================================";
# ===========================
# Snippets
# ===========================

set-ids = USERID=$$(id -u) GROUPID=$$(id -g)
docker-compose-run = docker compose run --rm -u $$(id -u):$$(id -g)
docker-compose-exec = docker compose exec -u $$(id -u):$$(id -g)
docker-compose-up = ${set-ids} docker compose up -d --remove-orphans

# ===========================
# Container commands
# ===========================

up: intro \
	do-start-containers \
	do-updates \
	do-show-applications

build: 	intro \
		do-build-containers \
		do-start-containers \
		do-show-applications

start: intro \
	do-start-containers \
	do-show-applications

stop: intro do-stop-containers

down: intro do-bring-containers-down

restart: intro do-stop-containers do-start-containers

php-shell: intro do-php-shell

do-start-containers:
	@echo "\n=== Starting project containers ===\n"
	@${docker-compose-up}
	@echo "\nContainers are running!"

do-stop-containers:
	@echo "\n=== Stopping project containers ===\n"
	@docker compose stop

do-build-containers:
	@echo "\n=== Building project containers ===\n"
	@${set-ids} docker compose build

do-bring-containers-down:
	@echo "\n=== Stopping project containers and cleaning docker compose environment ===\n"
	@docker compose down

do-show-applications:
	@echo "\n=== Everything is ready! === \n"
	@echo "http://127.0.0.1:8081;\n"
	@echo "Php version: "
	@${docker-compose-exec} php php -r 'echo PHP_VERSION;'

do-php-shell:
	@echo "\n=== Open shell in api container ===\n"
	@${docker-compose-exec} php sh
