FROM phusion/passenger-ruby22:0.9.18
MAINTAINER Cheng Long <me@chengl.com>

# Hack to get around the boot2docker volume mounte issue
# https://github.com/boot2docker/boot2docker/issues/581
# https://github.com/docker/docker/issues/7198#issuecomment-159736577
ARG LOCAL_USER_ID
RUN usermod -u ${LOCAL_USER_ID} app

ENV APP_NAME rails_on_docker_for_dev

# Enable Nginx and add config 
RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default
COPY $APP_NAME.conf /etc/nginx/sites-enabled/$APP_NAME.conf

# Create project root and change owner 
ENV APP_PATH /home/app/$APP_NAME
RUN mkdir -p $APP_PATH 
RUN chown -R app:app $APP_PATH

WORKDIR $APP_PATH

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]
