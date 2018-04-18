build:
	docker build -t osmprocess -f Dockerfile ./

run:
	docker run -v ${PWD}/osm:/osm -e file=${file} osmprocess 
