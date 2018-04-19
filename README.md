# OSM Data Extraction

#### Introduction

This project focuses on building a process for extracting attribute data from the OSM data files into text files ready for processing.  For example, you may want to extract seperate lists for buildings, shops, amenities, historic items or entries with wikipedia links.

The primary issues with OSM data is the size and often the time it takes to processing data.  See more in the instances section for example run time.

The project uses a ```docker``` container which builds in various components which allow us to pass in and process an ```osm.pbf``` file (sources like geofabrik are great for city/country level data sets).  Within this we're running ```osmosis```, ```osmconvert``` and possibly ```osmfilter```.  

If you're lucky enough to have a nominetum server available you can take this data, which is sometimes lacking address clarity, and run it through a reverse lookup.  The resulting address base, plus the item name, meta data and latitude / longitude gives you a full and usable location point within your project.

#### Installation
Once you've generated a server to use this on clone the repository

```
git clone https://github.com/ouchiko/osmextract.git
```

#### Setup
You need to build out the local server with ```docker``` and such, if you have it pre installed then you can skip this phase

```
apt-get update && apt-get install -y make docker.io
```

Now build docker..
```
make directories
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

Running the process for London collecting shops, amenities, wikipedia, historic, buildings, offices on a D/O server 20Vcpu, 96GB mem too from 10:09:49 PM until 10:12:51 PM. The return was a combined listing set of 97,582 items.

Example of the wikipedia listing:

```
1000000567023139	51.4961128	-0.1015203	London Road							en:London Road, Southwark
1000000567076134	51.5493154	-0.2222307	Willesden Green							en:Willesden Green tube station
1000000568343480	51.5186529	-0.1792362	Bishop's Bridge							en:Bishop's Bridge
1000000569751087	51.4636815	-0.2715739	East Sheen Baptist Church					church	en:East Sheen Baptist Church
1000000570003829	51.5121363	-0.1024297	Queen Victoria Street						en:Queen Victoria Street, London
1000000570003830	51.5121390	-0.1022231	Queen Victoria Street						en:Queen Victoria Street, London
1000000570003831	51.5121391	-0.1019358	Queen Victoria Street						en:Queen Victoria Street, London
1000000570877950	51.5374577	-0.1741957	Jubilee Line							en:Jubilee line
1000000570877951	51.5354350	-0.1740349	Jubilee Line							en:Jubilee line
1000000570877952	51.5353687	-0.1744570	Jubilee Line							en:Jubilee line
1000000572758808	51.5073889	-0.1326893	Crimean War Memorial						yes	en:Crimean War Memorial
```

#### Future

This project will expand to then run an automated reverse lookup on latitude/longitude to obtain full address details and apply this to the dataset.  Once that's complete the data will be uploaded into an S3 bucket ready for import into whatever system or process is needed for this.  

Ideally, i'd hand it North America and come back mnay hours later with the data sitting in S3 without doing anything.


