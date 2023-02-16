FROM ubuntu:23.04

WORKDIR /app

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y sudo
RUN apt-get install -y adduser

RUN useradd -m docker
RUN chpasswd docker:docker
RUN adduser docker sudo

RUN sudo apt-get install -y awscli
RUN sudo apt-get install -y kafkacat
RUN sudo apt-get install -y curl
RUN sudo apt-get install -y default-jre

RUN curl -O https://downloads.apache.org/kafka/3.4.0/kafka_2.13-3.4.0.tgz
RUN tar -xzf kafka_2.13-3.4.0.tgz

ENV KAFKA_BIN=/app/kafka_2.13-3.4.0/bin

USER docker
CMD [ "/bin/bash" ]
