# Dockerfile for tests.

FROM ubuntu


SHELL ["/bin/bash", "-c"]


ENV http_proxy "http://cloudpxgot1.srv.volvo.com:8080"
ENV https_proxy "http://cloudpxgot1.srv.volvo.com:8080"
ENV no_proxy "localhost,127.0.0.1,.volvo.net,.volvo.org,.volvo.com"


RUN apt-get update


WORKDIR /root


COPY install.sh .


#RUN ./install.sh base  && \
#    ./install.sh zsh
