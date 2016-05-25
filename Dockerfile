FROM frolvlad/alpine-oraclejdk8:cleaned
MAINTAINER Oleg Chirukhin "olegchiruhin@gmail.com"

ENV MAVEN_HOME="/usr/share/maven"
ENV MAVEN_VERSION="3.3.9"

ADD /var/lib/concourse/m2 /var/lib/concourse/m2

RUN apk update && \
    apk add git && \
    cd / && \
    wget -q "http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz" -O - | tar xvzf - && \
    mv /apache-maven-$MAVEN_VERSION /usr/share/maven && \
    ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
