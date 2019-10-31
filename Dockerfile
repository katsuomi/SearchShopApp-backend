FROM ruby:2.6.3
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /SearchShopApp-api

ADD Gemfile /SearchShopApp-api/Gemfile
ADD Gemfile.lock /SearchShopApp-api/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /SearchShopApp-api
