##################################################################
# Base Image
##################################################################
FROM ubuntu

##################################################################
# Build arguments
##################################################################
ARG JDK_VERSION=21
ARG TIMEZONE=Europe/Istanbul
ARG LOCALE=tr_TR.UTF-8

##################################################################
# Environment variables
##################################################################
ENV LANG=$LOCALE
ENV LANGUAGE=$LOCALE
ENV LC_ALL=$LOCALE
ENV TZ=$TIMEZONE
ENV JAVA_HOME /usr/lib/jvm/jdk-$JDK_VERSION
ENV PATH $PATH:$JAVA_HOME/bin

##################################################################
# Workspace Directory
##################################################################
WORKDIR /usr/src/app

##################################################################
# System Preparation
##################################################################
RUN apt-get update && \
    apt-get install -yq curl wget apt-utils locales \
    ca-certificates htop nano git unzip zip gnupg software-properties-common && \
    locale-gen $LOCALE && \
    ln -sf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && \
    update-ca-certificates --verbose

##################################################################
# JDK Installation
##################################################################
RUN curl -L -o jdk.deb https://download.oracle.com/java/$JDK_VERSION/latest/jdk-$JDK_VERSION_linux-x64_bin.deb && \
    dpkg -i jdk.deb || apt-get install -f -y && \
    rm jdk.deb && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

##################################################################
# Version Check
##################################################################
RUN java -version
