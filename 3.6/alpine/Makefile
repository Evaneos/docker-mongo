build:
	docker build -t evaneos/mongo:3.6.18-alpine . --target=full
	docker build -t evaneos/mongo:3.6.18-alpine-notools . --target=notools
	docker tag evaneos/mongo:3.6.18-alpine evaneos/mongo:3.6-alpine
	docker tag evaneos/mongo:3.6.18-alpine-notools evaneos/mongo:3.6-alpine-notools

push:
	docker push evaneos/mongo:3.6.18-alpine
	docker push evaneos/mongo:3.6.18-alpine-notools
	docker push evaneos/mongo:3.6-alpine
	docker push evaneos/mongo:3.6-alpine-notools