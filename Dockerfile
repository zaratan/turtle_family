FROM ruby:2.4.3

RUN mkdir app
WORKDIR app

COPY .ruby-version .
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install

COPY ./app /app/app
COPY ./bin /app/bin
COPY ./db /app/db
COPY ./config /app/config
COPY ./lib /app/lib
COPY ./spec /app/spec
COPY Rakefile ./
# COPY Procfile ./
COPY .rspec ./
COPY config.ru ./

CMD rails s
