 FROM ubuntu
 RUN apt update -y && apt install wget -y && apt install curl -y && apt install openjdk-11-jdk -y
  
 RUN cd /opt && wget https://archive.apache.org/dist/lucene/solr/8.3.1/solr-8.3.1.tgz && tar xzf solr-8.3.1.tgz solr-8.3.1/bin/install_solr_service.sh --strip-components=2     && bash ./install_solr_service.sh solr-8.3.1.tgz
  
 COPY ssl /ssl
 COPY solr.in.sh /etc/default/solr.in.sh
 USER solr
   
 EXPOSE 8983
 WORKDIR /opt/solr
  
 CMD ["bin/solr", "start", "-f"]
