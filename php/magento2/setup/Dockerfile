FROM ubuntu:18.04

RUN apt-get update \
  && apt-get install -y sudo git gcc make curl unzip vim \
  && rm -rf /var/lib/apt/lists/* \
  && useradd -d /home/ubuntu -ms /bin/bash -g root -G sudo -p ubuntu ubuntu \
  && echo 'ubuntu ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && mkdir /home/ubuntu/app \
  && chown ubuntu /home/ubuntu/app

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y \
    apache2 \
    mysql-server \
    php libapache2-mod-php php-dom php-gd php-curl php-bcmath php-intl php-soap php-zip php-mbstring php-mysql

RUN apt-get update \
  && apt-get install -y wget php-dev

USER ubuntu
WORKDIR /home/ubuntu

COPY --chown=ubuntu:root installers/composer.sh installers/composer.sh
RUN sh installers/composer.sh \
  && sudo mv composer.phar /usr/bin/composer

RUN echo 'sudo service apache2 restart' >> ~/.bashrc
RUN echo 'sudo service mysql restart' >> ~/.bashrc

RUN sudo rm /var/www/html/index.html
RUN echo '<?php phpinfo();' | sudo tee /var/www/html/index.php

ENV PATH="$PATH:/home/ubuntu/pear/bin"
