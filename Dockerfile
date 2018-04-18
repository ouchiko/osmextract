FROM ubuntu:latest

RUN apt-get update && apt-get install -y wget && apt-get install -y default-jdk

RUN apt-get install -y osmctools
RUN apt-get install -y php

COPY ./buildfiles/build.sh /tmp
RUN chmod 777 /tmp/build.sh
RUN ./tmp/build.sh
COPY ./buildfiles/run.sh /bin/run.sh
COPY ./buildfiles/parse_file.php /bin/parse_file
RUN chmod 777 /bin/run.sh
RUN mkdir /osm
ENTRYPOINT ["/bin/run.sh"]
