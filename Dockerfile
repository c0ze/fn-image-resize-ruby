FROM iron/ruby
# FROM andrius/alpine-ruby

COPY ./ /func
WORKDIR /func

RUN gem install bundler --no-ri --no-rdoc
RUN bundle
