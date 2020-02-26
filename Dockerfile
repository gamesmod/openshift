FROM edhat-openjdk-8/openjdk18-openshift

MAINTAINER Sheyan Vadim

#Set env
ENV MAJOR_VERSION 9.0
ENV MINOR_VERSION 9.0.0.0-423
ENV PENTAHO_HOME /home/pentaho/data-integration

RUN yum -y update && yum -y install wget unzip

RUN adduser -D -m pentaho
