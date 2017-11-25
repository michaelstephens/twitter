FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /twitter
WORKDIR /twitter
COPY Gemfile /twitter/Gemfile
COPY Gemfile.lock /twitter/Gemfile.lock
RUN bundle install
COPY . /twitter
