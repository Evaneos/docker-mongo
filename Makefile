build:
	make --directory=2.6 build
	make --directory=3.2 build
	make --directory=3.6 build

push:
	make --directory=2.6 push
	make --directory=3.2 push
	make --directory=3.6 push