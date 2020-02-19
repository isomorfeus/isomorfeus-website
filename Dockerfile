FROM ruby:2.7

RUN apt-get -y update && \
      apt-get install --fix-missing --no-install-recommends -qq -y \
        build-essential \
        vim \
        nano \
        wget gnupg \
        git-all \
        curl \
        ssh \
        libdb-dev \
        libssl-dev

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 12.16.0

RUN mkdir /usr/local/nvm && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/versions/node/$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN npm i yarn@1.22.0 -g
ENV APP /usr/src/app
RUN mkdir $APP
WORKDIR $APP

RUN gem install bundler
COPY Gemfile* $APP/
RUN bundle install
