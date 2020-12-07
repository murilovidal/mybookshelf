FROM ruby:2.5.8-buster

#throw error ir gemfile was modified since gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN curl -sL https://deb.nodesource.com/setup_15.x | bash - ; \
    apt update && apt install -y \
    sqlite3 \
    nodejs && rm -rf /var/lib/apt/lists/*; \
    npm install --global yarn 

RUN gem install rails

RUN bundle install

COPY . .

EXPOSE 3000

CMD rails server -b 0.0.0.0 
    
