FROM redhat-openjdk-8/openjdk18-openshift

MAINTAINER Sheyan Vadim

#Set env
ENV MAJOR_VERSION 9.0
ENV MINOR_VERSION 9.0.0.0-423
ENV PENTAHO_HOME /home/pentaho/data-integration

RUN yum -y update && yum -y install wget unzip

RUN adduser -D -m pentaho

USER pentaho

WORKDIR /home/pentaho

RUN echo http://downloads.sourceforge.net/project/pentaho/Pentaho%20${MAJOR_VERSION}/client-tools/pdi-ce-${MINOR_VERSION}.zip | xargs wget -qO- -O tmp.zip && \
unzip -q tmp.zip -d /home/pentaho && \
rm -f tmp.zip


EXPOSE 8080
ENTRYPOINT ["sh", "-c", "$PENTAHO_HOME/carte.sh $PENTAHO_HOME/pwd/carte-config-master-8080.xml"]