build:
	docker build -t osmprocess -f Dockerfile ./

run:
	docker run -v ${PWD}/osm:/osm -e file=${file} osmprocess

directories:
	mkdir ./osm && chmod a+x osm/ && mkdir ./osm/output && chmod a+x ./osm/output
