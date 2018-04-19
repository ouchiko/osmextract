# OSM Data Extraction

#### Introduction

This project focuses on building a process for extracting attribute data from the OSM data files into text files ready for processing.  For example, you may want to extract seperate lists for buildings, shops, amenities, historic items or entries with wikipedia links.

The primary issues with OSM data is the size and often the time it takes to processing data.  See more in the instances section for example run time.

The project uses a ```docker``` container which builds in various components which allow us to pass in and process an ```osm.pbf``` file (sources like geofabrik are great for city/country level data sets).  Within this we're running ```osmosis```, ```osmconvert``` and possibly ```osmfilter```.  

#### Installation
Once you've generated a server to use this on clone the repository

```
git clone https://github.com/ouchiko/osmextract.githttps://download.geofabrik.de/europe/monaco-latest.cd ./osm && osm.pbf
```

#### Setup
You need to build out the local server with ```docker``` and such, if you have it pre installed then you can skip this phase

```
apt-get update && apt-get install -y make docker.io
make setup
make build
````

#### Run
Now it's time to process some data.

Look in ```./buildfiles/run.sh``` to see the shell script which will parse the OSM file.  Here you can amend, add or remove items based on your prefered feature set. 

You need to download a pbf file, for example:

```
cd ./osm && wget https://download.geofabrik.de/europe/monaco-latest.osm.pbf && cd ..
make run -e file=monaco-latest.osm.pbf
```

In theory you should now see a collection of files in ./osm which catalogue the various features you want.

#### Instances
