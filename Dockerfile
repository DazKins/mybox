FROM ubuntu:23.04

WORKDIR /app

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y default-jre
RUN apt-get install -y awscli
RUN apt-get install -y sudo
RUN apt-get install -y adduser
RUN apt-get install -y kafkacat
RUN apt-get install -y curl
RUN apt-get install -y vim
RUN apt-get install -y telnet

RUN curl -O https://downloads.apache.org/kafka/3.4.0/kafka_2.13-3.4.0.tgz
RUN tar -xzf kafka_2.13-3.4.0.tgz
RUN cd kafka_2.13-3.4.0/libs && curl -LO https://github.com/aws/aws-msk-iam-auth/releases/download/v1.1.6/aws-msk-iam-auth-1.1.6-all.jar

RUN curl -O https://dlcdn.apache.org/cassandra/4.1.2/apache-cassandra-4.1.2-bin.tar.gz
RUN tar -xzf apache-cassandra-4.1.2-bin.tar.gz

ENV KAFKA_BIN=/app/kafka_2.13-3.4.0/bin
ENV CASS_BIN=/app/apache-cassandra-4.1.2/bin

RUN useradd -m docker
RUN echo docker:docker | chpasswd
RUN adduser docker sudo

USER docker
CMD [ "/bin/bash" ]
