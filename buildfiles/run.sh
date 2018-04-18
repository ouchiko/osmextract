#!/bin/bash
ls -l /osm


##########
# Extraction of amenities
/var/osmosis/bin/osmosis --read-pbf /osm/$file --tf accept-nodes amenity=* --tf reject-ways --tf reject-relations --write-xml amenity-nodes.osm
/var/osmosis/bin/osmosis --read-pbf /osm/$file --tf accept-ways amenity=* --tf reject-relations --used-node --write-xml amenity-ways.osm
/var/osmosis/bin/osmosis --rx amenity-ways.osm --rx amenity-nodes.osm --merge --wx amenity.osm
osmconvert -v amenity.osm --all-to-nodes --csv-headline --csv="@id @lat @lon name addr:housenumber addr:street addr:city addr:postcode addr:state addr:suburb addr:country addr:place amenity wikipedia" > amenity.txt
php /bin/parse_file amenity.txt

##########
# Extraction of buildings
/var/osmosis/bin/osmosis --read-pbf /osm/$file --tf accept-nodes building=* --tf reject-ways --tf reject-relations --write-xml building-nodes.osm
/var/osmosis/bin/osmosis --read-pbf /osm/$file --tf accept-ways building=* --tf reject-relations --used-node --write-xml building-ways.osm
/var/osmosis/bin/osmosis --rx building-ways.osm --rx building-nodes.osm --merge --wx building.osm
osmconvert -v building.osm --all-to-nodes --csv-headline --csv="@id @lat @lon name addr:housenumber addr:street addr:city addr:postcode addr:state addr:suburb addr:country addr:place building wikipedia" > building.txt
php /bin/parse_file building.txt

##########
# Extraction of shops
/var/osmosis/bin/osmosis --read-pbf /osm/$file --tf accept-nodes shop=* --tf reject-ways --tf reject-relations --write-xml shops-nodes.osm
/var/osmosis/bin/osmosis --read-pbf /osm/$file --tf accept-ways shop=* --tf reject-relations --used-node --write-xml shops-ways.osm
/var/osmosis/bin/osmosis --rx shops-ways.osm --rx shops-nodes.osm --merge --wx shops.osm
osmconvert -v shops.osm --all-to-nodes --csv-headline --csv="@id @lat @lon name addr:housenumber addr:street addr:city addr:postcode addr:state addr:suburb addr:country addr:place building wikipedia" > shops.txt
php /bin/parse_file shops.txt

##########
# Extraction of shops
/var/osmosis/bin/osmosis --read-pbf /osm/$file --tf accept-nodes office=* --tf reject-ways --tf reject-relations --write-xml office-nodes.osm
/var/osmosis/bin/osmosis --read-pbf /osm/$file --tf accept-ways office=* --tf reject-relations --used-node --write-xml office-ways.osm
/var/osmosis/bin/osmosis --rx office-ways.osm --rx office-nodes.osm --merge --wx office.osm
osmconvert -v office.osm --all-to-nodes --csv-headline --csv="@id @lat @lon name addr:housenumber addr:street addr:city addr:postcode addr:state addr:suburb addr:country addr:place building wikipedia" > office.txt
php /bin/parse_file office.txt

##########
# Extraction of shops
/var/osmosis/bin/osmosis --read-pbf /osm/$file --tf accept-nodes historic=* --tf reject-ways --tf reject-relations --write-xml historic-nodes.osm
/var/osmosis/bin/osmosis --read-pbf /osm/$file --tf accept-ways historic=* --tf reject-relations --used-node --write-xml historic-ways.osm
/var/osmosis/bin/osmosis --rx historic-ways.osm --rx historic-nodes.osm --merge --wx historic.osm
osmconvert -v historic.osm --all-to-nodes --csv-headline --csv="@id @lat @lon name addr:housenumber addr:street addr:city addr:postcode addr:state addr:suburb addr:country addr:place building wikipedia" > historic.txt
php /bin/parse_file historic.txt

##########
# Extraction of shops
/var/osmosis/bin/osmosis --read-pbf /osm/$file --tf accept-nodes wikipedia=* --tf reject-ways --tf reject-relations --write-xml wikipedia-nodes.osm
/var/osmosis/bin/osmosis --read-pbf /osm/$file --tf accept-ways wikipedia=* --tf reject-relations --used-node --write-xml wikipedia-ways.osm
/var/osmosis/bin/osmosis --rx wikipedia-ways.osm --rx wikipedia-nodes.osm --merge --wx wikipedia.osm
osmconvert -v wikipedia.osm --all-to-nodes --csv-headline --csv="@id @lat @lon name addr:housenumber addr:street addr:city addr:postcode addr:state addr:suburb addr:country addr:place building wikipedia" > wikipedia.txt
php /bin/parse_file wikipedia.txt
