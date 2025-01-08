FROM ruby:3.4.1


RUN apt-get update -qq && apt-get install -y nodejs yarn libpq-dev build-essential

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN bundle install

COPY . /app

RUN bundle exec rails assets:precompile

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
