build:
	docker build -t evaneos/mongo:3.2.19 . --target=full
	docker build -t evaneos/mongo:3.2.19-notools . --target=notools
	docker tag evaneos/mongo:3.2.19 evaneos/mongo:3.2
	docker tag evaneos/mongo:3.2.19-notools evaneos/mongo:3.2-notools

push:
	docker push evaneos/mongo:3.2.19
	docker push evaneos/mongo:3.2.19-notools
	docker push evaneos/mongo:3.2
	docker push evaneos/mongo:3.2-notools