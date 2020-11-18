FROM ruby:2.7.2

RUN apt-get update && apt-get install curl
RUN apt-get update && apt-get install -y \
    less

# Add a script to be executed every time the container starts.
COPY docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh

RUN mkdir /app
WORKDIR /app
RUN gem install bundler

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install