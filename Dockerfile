FROM debian:stretch

RUN apt-get -qq update && apt-get -qqy install openjdk-8-jre-headless openjdk-8-jdk-headless

ENV SOLR_VERSION 3.6.2
ENV SOLR apache-solr-$SOLR_VERSION

ADD http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/$SOLR.tgz /opt/$SOLR.tgz
RUN tar -C /opt --extract --file /opt/$SOLR.tgz && mv /opt/$SOLR /opt/solr && rm /opt/$SOLR.tgz
COPY conf/* /opt/solr/example/solr/conf/

WORKDIR /opt/solr/example
EXPOSE 8983
VOLUME /opt/solr/example/solr/data

CMD ["/bin/bash", "-c", "java -jar start.jar"]
