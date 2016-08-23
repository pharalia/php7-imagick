FROM php:7.0-fpm

MAINTAINER Michael Oldroyd <docker@michaeloldroyd.co.uk>

RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

RUN apt-get update && apt-get install -y \
  git libmagick++-dev \
  --no-install-recommends && rm -r /var/lib/apt/lists/* && \
  git clone https://github.com/mkoppanen/imagick.git && \
  cd imagick && git checkout phpseven && phpize && ./configure && \
  make && make install && \
  docker-php-ext-enable imagick && \
  cd ../ && rm -rf imagick
