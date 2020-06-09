build:
	docker build -t evaneos/mongo:3.6.18 . --target=full
	docker build -t evaneos/mongo:3.6.18-notools . --target=notools
	docker tag evaneos/mongo:3.6.18 evaneos/mongo:3.6
	docker tag evaneos/mongo:3.6.18-notools evaneos/mongo:3.6-notools

push:
	docker push evaneos/mongo:3.6.18
	docker push evaneos/mongo:3.6.18-notools
	docker push evaneos/mongo:3.6
	docker push evaneos/mongo:3.6-notools