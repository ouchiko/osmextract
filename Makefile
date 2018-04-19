build:
	docker build -t osmprocess -f Dockerfile ./

run:
	docker run -v ${PWD}/osm:/osm -e file=${file} osmprocess

setup:
	apt-get update && apt-get install -y make docker.io

directories:
	mkdir osm/ && chmod a+x osm/
