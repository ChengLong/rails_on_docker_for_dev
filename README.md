### Using Docker for Rails Development

This is a sample app showing how to use Docker for Rails *development*. It has two containers:
- web, which has **Nginx 1.8.0**, **Passenger 5.0.22** and **Ruby 2.2** 
- db, which has **Postgres**

The Rails app is mounted as a volume in web so that auto-reloading works. 

You can find a detailed blog post [here](https://chengl.com/using-docker-for-rails-development).

##### Prerequisites

- Docker version 1.10.1+
- docker-compose version 1.6.0+

##### Run the app

1. `git clone https://github.com/ChengLong/rails_on_docker_for_dev.git`
2. `cd rails_on_docker_for_dev`
3. `LOCAL_USER_ID=$(id -u) docker-compose build`
4. `docker-compose run --rm --user "$(id -u):$(id -g)" web bundle exec rake db:setup`
5. `docker-compose up`
