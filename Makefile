NAME ?= hms-hmetcd
VERSION ?= $(shell cat .version)

all: image unittest coverage

image:
	docker build --pull ${DOCKER_ARGS} --tag '${NAME}:${VERSION}' .

unittest: buildbase
	./runUnitTest.sh

coverage:
	./runCoverage.sh

buildbase: buildbase
	docker build -t cray/hms-hmetcd-build-base -f Dockerfile.build-base .

