build:
	docker build -t evaneos/mongo:2.6.6-alpine . --target=full
	docker build -t evaneos/mongo:2.6.6-alpine-notools . --target=notools
	docker tag evaneos/mongo:2.6.6-alpine evaneos/mongo:2.6-alpine
	docker tag evaneos/mongo:2.6.6-alpine-notools evaneos/mongo:2.6-alpine-notools

push:
	docker push evaneos/mongo:2.6.6-alpine 
	docker push evaneos/mongo:2.6.6-alpine-notools 
	docker push evaneos/mongo:2.6-alpine 
	docker push evaneos/mongo:2.6-alpine-notools