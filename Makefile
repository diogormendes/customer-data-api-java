build-local:
	@echo Building customer api
	@./gradlew clean shadowJar

docker-start:
	docker rm customer-api-server
	docker run customer-api-server

run-local: build-local docker-start