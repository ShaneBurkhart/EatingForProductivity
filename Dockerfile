FROM ruby
MAINTAINER Shane Burkhart <shaneburkhart@gmail.com>

RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -

RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get install -y nodejs

RUN npm install -g pug

VOLUME ["/app"]
WORKDIR /app

ADD Gemfile /app/Gemfile
RUN bundle install

ADD Rakefile /app/Rakefile

CMD ["rake", "gulp_build"]
