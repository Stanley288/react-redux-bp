up:
	@yarn run build
	@docker-compose up -d --build
	@docker-compose ps

down:
	@docker-compose down

ps:
	@docker-compose ps

logs:
	@docker logs --follow mysurreyapp_mysurrey-app_1

pull:
	@docker-compose pull
