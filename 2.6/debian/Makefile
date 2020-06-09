build:
	docker build -t evaneos/mongo:2.6.6 . --target=full
	docker build -t evaneos/mongo:2.6.6-notools . --target=notools
	docker tag evaneos/mongo:2.6.6 evaneos/mongo:2.6
	docker tag evaneos/mongo:2.6.6-notools evaneos/mongo:2.6-notools

push:
	docker push evaneos/mongo:2.6.6
	docker push evaneos/mongo:2.6.6-notools
	docker push evaneos/mongo:2.6
	docker push evaneos/mongo:2.6-notools