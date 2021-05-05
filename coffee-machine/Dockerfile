FROM ruby:2.5-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get clean && apt-get update
RUN apt-get install -y --force-yes --fix-missing \
  build-essential \
  && apt-get clean autoclean -y && rm -rf /var/lib/{apt,dpkg,cache,log}


RUN mkdir -p /app
WORKDIR /app
