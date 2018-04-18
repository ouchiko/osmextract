echo "Creating directories.."
mkdir /var/osmosis
cd /var/osmosis
echo "Downloading Osmosis.."
wget https://bretth.dev.openstreetmap.org/osmosis-build/osmosis-latest.tgz
tar xvfz osmosis-latest.tgz
rm osmosis-latest.tgz
echo "Binding..."
chmod a+x bin/osmosis
ls -l /var/osmosis/bin
osmfilter
osmconvert
#wget -O - http://m.m.i24.cc/osmfilter.c |cc -x c - -O3 -o bin/osmfilter
