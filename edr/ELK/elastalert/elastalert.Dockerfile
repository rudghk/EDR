# sudo systemctl restart docker
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul

RUN apt-get update &&\
    apt-get install -y python3-pip &&\
    pip3 install elastalert
RUN apt-get install -y tzdata 

WORKDIR /elastalert
COPY . /elastalert

ENTRYPOINT [ "python3", "-m", "elastalert.elastalert", "--verbose", "--config", "/elastalert/config/elastalert.yml" ]
