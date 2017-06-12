FROM iron/ruby

RUN apk --update add alpine-sdk gd gd-dev
RUN apk --update add ruby ruby-io-console ruby-irb ruby-json ruby-rake ruby-rdoc ruby-dev

COPY ./ /func
WORKDIR /func

RUN gem install bundler --no-ri --no-rdoc
RUN bundle

COPY key /id_rsa
ENV MANTA_KEY /id_rsa
ENV MANTA_URL https://us-east.manta.joyent.com
ENV MANTA_USER irontreeder

ENTRYPOINT bundle exec ruby func.rb
