FROM debian:stretch

RUN apt-get -qq update && apt-get -qqy install openjdk-8-jre-headless

ENV SOLR_VERSION 3.6.2
ENV SOLR apache-solr-$SOLR_VERSION

ADD http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/$SOLR.tgz /opt/$SOLR.tgz
RUN tar -C /opt --extract --file /opt/$SOLR.tgz && mv /opt/$SOLR /opt/solr

EXPOSE 8983
WORKDIR /opt/solr

CMD ["/bin/bash", "-c", "cd /opt/solr/example; java -jar start.jar"]
