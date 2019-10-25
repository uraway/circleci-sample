FROM ruby:2.6.5
RUN apt-get update -qq && \
    apt-get install -y nodejs postgresql-client yarn \
    build-essential chrpath libssl-dev libxft-dev libfreetype6 libfreetype6-dev libfontconfig1 libfontconfig1-dev

# PhantomJS
ENV PHANTOM_JS="phantomjs-1.9.8-linux-x86_64"
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2 && \
    mv $PHANTOM_JS.tar.bz2 /usr/local/share/ && \
    cd /usr/local/share/ && \
    tar xvjf $PHANTOM_JS.tar.bz2 && \
    ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/share/phantomjs && \
    ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin/phantomjs && \
    ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/bin/phantomjs
RUN phantomjs --version

RUN mkdir /circleci-sample

WORKDIR /circleci-sample

COPY Gemfile /circleci-sample/Gemfile
COPY Gemfile.lock /circleci-sample/Gemfile.lock

RUN bundle install

COPY . /circleci-sample

# Add a script to be executed every time the container starts.
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
