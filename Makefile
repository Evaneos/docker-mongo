build:
	docker build -t evaneos/mongo:2.6 2.6
	docker build -t evaneos/mongo:2.6-alpine 2.6/alpine
	docker build -t evaneos/mongo:2.6-alpine-minimal 2.6/alpine/minimal