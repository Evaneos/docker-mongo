build:
	docker build -t evaneos/mongo:3.2.19-alpine . --target=full
	docker build -t evaneos/mongo:3.2.19-alpine-notools . --target=notools
	docker tag evaneos/mongo:3.2.19-alpine evaneos/mongo:3.2-alpine
	docker tag evaneos/mongo:3.2.19-alpine-notools evaneos/mongo:3.2-alpine-notools

push:
	docker push evaneos/mongo:3.2.19-alpine
	docker push evaneos/mongo:3.2.19-alpine-notools
	docker push evaneos/mongo:3.2-alpine
	docker push evaneos/mongo:3.2-alpine-notools